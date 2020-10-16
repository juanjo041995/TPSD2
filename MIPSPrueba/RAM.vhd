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

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity RAM is
	PORT (	
				cs			:in STD_LOGIC;
				clk		: in STD_LOGIC;
				memWrite	: in STD_LOGIC;
				memRead	: in STD_LOGIC;
				addressVGA : in STD_LOGIC_VECTOR(2 downto 0);
				addressMips	: in STD_LOGIC_VECTOR(2 downto 0); -- se ignoran FFFF debido al decodificador
				dataIn	: in STD_LOGIC_VECTOR(7 downto 0);
				dataOutMIPS	: out STD_LOGIC_VECTOR(7 downto 0);
				dataOutVGA : out STD_LOGIC_VECTOR(7 downto 0)
	);
end RAM;

architecture Behavioral of RAM is
type rw_type is array (0 to 7) of STD_LOGIC_VECTOR(7 downto 0);
signal memRW: rw_type;
signal ENMIPS: STD_LOGIC := '0';
signal ENVGA : STD_LOGIC := '0';
signal dir_match: STD_LOGIC:= '0';
begin
MATCH: process(addressVGA, addressMips)
begin
	if addressVGA = addressMips then
		dir_match <='1';
	else
		dir_match <='0';
	end if;
end process;
enableMIPS: process(addressMIPS)
begin
	if ((TO_INTEGER(unsigned(addressMIPS)) >= 0) and (TO_INTEGER(unsigned(addressMIPS))<= 7)) then
		ENMIPS <= '1';
	else
		ENMIPS <= '0';
	end if;
end process;

enableVGA: process(addressVGA)
begin
	if ((TO_INTEGER(unsigned(addressVGA)) >= 0) and (TO_INTEGER(unsigned(addressVGA))<= 7)) then
		ENVGA <= '1';
	else
		ENVGA <= '0';
	end if;
end process;


write_memory: process(clk)
begin
	if (clk'event and clk = '1') then
		if (ENMIPS ='1' and cs ='1' and memWrite = '1') then
			memRW(TO_INTEGER(unsigned(addressMIPS))) <= dataIn;
		end if;
	end if;
end process;


Read_memoryMIPS: process (addressMIPS,memRW,ENMIPS,memRead,cs)
begin
	if (EnMIPS ='1' and cs ='1' and memRead = '1')then
		dataOutMIPS <= memRW(TO_INTEGER(unsigned(addressMIPS)));
	else
		dataOutMIPS <= X"00";
	end if;
end process;


read_memoryVGA: process(addressVGA,memRW,ENVGA,memWrite,memRead,dir_match,cs)
begin
	if (ENVGA='1' and cs= '1') then 
			if ((memWrite ='0') or (memWrite ='1' and dir_match ='0')) then 
					dataOutVGA <= memRW(TO_INTEGER(unsigned(addressVGA)));
			else
					dataOutVGA <= X"00";
			end if;
	else
		dataOutVGA <= X"00";
	end if;
end process;



end Behavioral;

