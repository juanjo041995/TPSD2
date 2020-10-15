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
	GENERIC (
					constant PIXEL_SIZE : integer := 16
	);
	PORT (
				clk		: in STD_LOGIC;
				memWrite	: in STD_LOGIC;
				--memRead	: in STD_LOGIC;
				address	: in STD_LOGIC_VECTOR(2 downto 0); -- se ignoran FFFF debido al decodificador
				dataIn	: in STD_LOGIC_VECTOR(7 downto 0);
				dataOut	: out STD_LOGIC_VECTOR(7 downto 0)
	);
end RAM;

architecture Behavioral of RAM is
type rw_type is array (0 to 7) of STD_LOGIC_VECTOR(7 downto 0);
signal memRW: rw_type;
signal EN: STD_LOGIC := '0';
begin
enable: process(address)
begin
	if ((TO_INTEGER(unsigned(address)) >= 0) and (TO_INTEGER(unsigned(address))<= 7)) then
		EN <= '1';
	else
		EN <= '0';
	end if;
end process;

write_memory: process(clk)
begin
	if (clk'event and clk = '1') then
		if (EN ='1' and memWrite = '0') then
			memRW(TO_INTEGER(unsigned(address))) <= dataIn;
		end if;
	end if;
end process;
read_memory: process(address,memRW,EN,memWrite) --exlcuido memread
begin
	if (EN='1' and memWrite ='1') then -- write por read 
			dataOut <= memRW(TO_INTEGER(unsigned(address)));
		--elsif (memWrite = '0') then
		--	dataOut <= X"00";
		else
			dataOut <= X"00";
		end if;
end process;


end Behavioral;

