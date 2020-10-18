----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    20:01:31 10/12/2020 
-- Design Name: 
-- Module Name:    RAM - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: 
--
-- Dependencies: 
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use work.general.all;
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity RAM is
	PORT (	
				cs					: in STD_LOGIC;
				clk				: in STD_LOGIC;
				memWrite			: in STD_LOGIC;
				memRead			: in STD_LOGIC;
				
				dataIn			: in STD_LOGIC_VECTOR(31 downto 0);
				tipoAcc 			: in STD_LOGIC_VECTOR(2 downto 0);
				
				addressVGA 		: in STD_LOGIC_VECTOR(NUM_BITS_MEMORIA_VGA -1+2 downto 0);
				dataOutVGA 		: out STD_LOGIC_VECTOR(7 downto 0);
				
				addressMIPS		: in STD_LOGIC_VECTOR(NUM_BITS_MEMORIA_VGA-1+2 downto 0);
				dataOutMIPS		: out STD_LOGIC_VECTOR(31 downto 0)
	);
end RAM;

architecture Behavioral of RAM is
type mem_byte is array (0 to 2**NUM_BITS_MEMORIA_VGA -1) of STD_LOGIC_VECTOR(7 downto 0);
signal mem00 : mem_byte;
signal mem01 : mem_byte;
signal mem10 : mem_byte;
signal mem11 : mem_byte;

signal hwtemp1 : STD_LOGIC_VECTOR(15 downto 0);
signal hwtemp2 : STD_LOGIC_VECTOR(15 downto 0);

signal dir_match: STD_LOGIC:= '0';

begin

hwtemp1 <= mem01(to_integer(unsigned(addressMIPS(NUM_BITS_MEMORIA_VGA -1 +2 downto 2)))) & mem00(to_integer(unsigned(addressMIPS(NUM_BITS_MEMORIA_VGA -1 +2 downto 2))));
hwtemp2 <= mem11(to_integer(unsigned(addressMIPS(NUM_BITS_MEMORIA_VGA -1 +2 downto 2)))) & mem10(to_integer(unsigned(addressMIPS(NUM_BITS_MEMORIA_VGA -1 +2 downto 2))));


MATCH: process(addressVGA, addressMips)
begin
	if addressVGA = addressMips then
		dir_match <='1';
	else
		dir_match <='0';
	end if;
end process;


Write_memory : process (clk) is
	begin
		if clk'event and clk = '1' then 
			if cs = '1' and memWrite = '1' then
				case tipoAcc is
					when "000" => -- una palabra
						mem00(TO_INTEGER(unsigned(addressMIPS(NUM_BITS_MEMORIA_VGA -1 +2 downto 2)))) <= dataIn(7  downto  0);
						mem01(TO_INTEGER(unsigned(addressMIPS(NUM_BITS_MEMORIA_VGA -1 +2 downto 2)))) <= dataIn(15 downto  8);
						mem10(TO_INTEGER(unsigned(addressMIPS(NUM_BITS_MEMORIA_VGA -1 +2 downto 2)))) <= dataIn(23 downto 16);
						mem11(TO_INTEGER(unsigned(addressMIPS(NUM_BITS_MEMORIA_VGA -1 +2 downto 2)))) <= dataIn(31 downto 24);
					when "001" | "011" => -- media palabra
						case addressMIPS(1 downto 0) is
							when "00" =>
								mem00(TO_INTEGER(unsigned(addressMIPS(NUM_BITS_MEMORIA_VGA -1 +2 downto 2)))) <= dataIn( 7 downto 0);
								mem01(TO_INTEGER(unsigned(addressMIPS(NUM_BITS_MEMORIA_VGA -1 +2 downto 2)))) <= dataIn(15 downto 8);
							when "10" =>
								mem10(TO_INTEGER(unsigned(addressMIPS(NUM_BITS_MEMORIA_VGA -1 +2 downto 2)))) <= dataIn( 7 downto 0);
								mem11(TO_INTEGER(unsigned(addressMIPS(NUM_BITS_MEMORIA_VGA -1 +2 downto 2)))) <= dataIn(15 downto 8);
							when others =>
						end case;
					when "010" | "100" => -- un byte
						case addressMIPS(1 downto 0) is
							when "00" =>
								mem00(TO_INTEGER(unsigned(addressMIPS(NUM_BITS_MEMORIA_VGA -1 +2 downto 2)))) <= dataIn(7 downto 0);
							when "01" =>
								mem01(TO_INTEGER(unsigned(addressMIPS(NUM_BITS_MEMORIA_VGA -1 +2 downto 2)))) <= dataIn(7 downto 0);
							when "10" =>
								mem10(TO_INTEGER(unsigned(addressMIPS(NUM_BITS_MEMORIA_VGA -1 +2 downto 2)))) <= dataIn(7 downto 0);
							when "11" =>
								mem11(TO_INTEGER(unsigned(addressMIPS(NUM_BITS_MEMORIA_VGA -1 +2 downto 2)))) <= dataIn(7 downto 0);
							when others =>
						end case;
					when others =>
				end case;
			end if;
		end if;
	end process Write_memory;


read_memoryMIPS : process (addressMIPS, memRead, cs, mem00, mem01, mem10, mem11, tipoAcc,hwtemp1,hwtemp2) is
	begin
		if cs = '1' and memRead = '1' then
			case tipoAcc is
				when "000" => -- lectura de una palabra
					dataOutMIPS <= mem11(TO_INTEGER(unsigned(addressMIPS(NUM_BITS_MEMORIA_VGA -1 +2 downto 2)))) & 
					           mem10(TO_INTEGER(unsigned(addressMIPS(NUM_BITS_MEMORIA_VGA -1 +2 downto 2)))) & 
							     mem01(TO_INTEGER(unsigned(addressMIPS(NUM_BITS_MEMORIA_VGA -1 +2 downto 2)))) & 
							     mem00(TO_INTEGER(unsigned(addressMIPS(NUM_BITS_MEMORIA_VGA -1 +2 downto 2))));
				when "001" => -- lectura de media palabra sin signo
					case addressMIPS(1 downto 0) is
						when "00" =>
							dataOutMIPS <= X"0000" & hwtemp1; --mem01(TO_INTEGER(unsigned(addressMIPS(NUM_BITS_MEMORIA_VGA -1 +2 downto 2)))) & 
							                     --mem00(TO_INTEGER(unsigned(addressMIPS(NUM_BITS_MEMORIA_VGA -1 +2 downto 2))));
						when "10" =>
							dataOutMIPS <= X"0000" & hwtemp2; --mem11(TO_INTEGER(unsigned(addressMIPS(NUM_BITS_MEMORIA_VGA -1 +2 downto 2)))) & 
							                     --mem10(TO_INTEGER(unsigned(addressMIPS(NUM_BITS_MEMORIA_VGA -1 +2 downto 2))));
						when others =>
							dataOutMIPS <= X"00000000";
					end case;
				when "010" => -- lectura de un byte
					case addressMIPS(1 downto 0) is
						when "00" =>
							dataOutMIPS <= X"000000" & mem00(TO_INTEGER(unsigned(addressMIPS(NUM_BITS_MEMORIA_VGA -1 +2 downto 2))));
						when "01" =>
							dataOutMIPS <= X"000000" & mem01(TO_INTEGER(unsigned(addressMIPS(NUM_BITS_MEMORIA_VGA -1 +2 downto 2))));
						when "10" =>
							dataOutMIPS <= X"000000" & mem10(TO_INTEGER(unsigned(addressMIPS(NUM_BITS_MEMORIA_VGA -1 +2 downto 2))));
						when "11" =>
							dataOutMIPS <= X"000000" & mem11(TO_INTEGER(unsigned(addressMIPS(NUM_BITS_MEMORIA_VGA -1 +2 downto 2))));
						when others =>
							dataOutMIPS <= X"00000000";
					end case;
				when "011" => -- lectura de media palabra con signo
					case addressMIPS(1 downto 0) is
						when "00" =>
							dataOutMIPS <= std_logic_vector(resize(signed(hwtemp1), dataOutMIPS'length));
						when "10" =>
							dataOutMIPS <= std_logic_vector(resize(signed(hwtemp2), dataOutMIPS'length));
						when others =>
							dataOutMIPS <= X"00000000";
					end case;
				when "100" => -- lectura de un byte con signo
					case addressMIPS(1 downto 0) is
						when "00" =>
							dataOutMIPS <= std_logic_vector(resize(signed(mem00(to_integer(unsigned(addressMIPS(NUM_BITS_MEMORIA_VGA -1 +2 downto 2))))), dataOutMIPS'length));
						when "01" =>
							dataOutMIPS <= std_logic_vector(resize(signed(mem01(to_integer(unsigned(addressMIPS(NUM_BITS_MEMORIA_VGA -1 +2 downto 2))))), dataOutMIPS'length));
						when "10" =>
							dataOutMIPS <= std_logic_vector(resize(signed(mem10(to_integer(unsigned(addressMIPS(NUM_BITS_MEMORIA_VGA -1 +2 downto 2))))), dataOutMIPS'length));
						when "11" =>
							dataOutMIPS <= std_logic_vector(resize(signed(mem11(to_integer(unsigned(addressMIPS(NUM_BITS_MEMORIA_VGA -1 +2 downto 2))))), dataOutMIPS'length));
						when others =>
							dataOutMIPS <= X"00000000";
					end case;
				when others => -- no debe ocurrir
					dataOutMIPS <= X"00000000";
			end case;
			
		else
			dataOutMIPS <= X"00000000";
		end if;
	end process read_memoryMIPS;


read_memoryVGA: process(addressVGA,memWrite,memRead,dir_match,cs,mem00,mem01,mem10,mem11) is
begin 
		if ((memWrite ='0') or (memWrite ='1' and dir_match ='0')) then 
				case addressVGA(1 downto 0) is
						when "00" =>
							dataOutVGA <= mem00(TO_INTEGER(unsigned(addressVGA(NUM_BITS_MEMORIA_VGA -1 +2 downto 2))));
						when "01" =>
							dataOutVGA <= mem01(TO_INTEGER(unsigned(addressVGA(NUM_BITS_MEMORIA_VGA -1 +2 downto 2))));
						when "10" =>
							dataOutVGA <= mem10(TO_INTEGER(unsigned(addressVGA(NUM_BITS_MEMORIA_VGA -1 +2 downto 2))));
						when "11" =>
							dataOutVGA <= mem11(TO_INTEGER(unsigned(addressVGA(NUM_BITS_MEMORIA_VGA -1 +2 downto 2))));
						when others =>
							dataOutVGA <= X"00";
				end case;
		else
		dataOutVGA <= X"00";
		end if;
end process read_memoryVGA;



end Behavioral;

