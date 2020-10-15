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

entity ROM is
	PORT (
				address	: in STD_LOGIC_VECTOR(2 downto 0); -- se ignoran FFFF debido al decodificador
				dataOut	: out STD_LOGIC_VECTOR(7 downto 0)
	);
end ROM;

architecture Behavioral of ROM is
type rw_type is array (0 to 7) of STD_LOGIC_VECTOR(7 downto 0);
signal EN: STD_LOGIC := '0';

Constant memRD: rw_type := ( 0 => "11111111",
									  1 => "11111100",
									  2 => "00011111",
									  3 => "00011100",
									  4 => "11100011",
									  5 => "11100000",
									  6 => "00000011",
									  7 => "00000000");
begin
enable: process(address)
begin
	if ((TO_INTEGER(unsigned(address)) >= 0) and (TO_INTEGER(unsigned(address))<= 7)) then
		EN <= '1';
	else
		EN <= '0';
	end if;
end process;

read_memory: process(address,EN)
begin
		if (EN='1') then
			dataOut <= memRD(TO_INTEGER(unsigned(address)));
		else
			dataOut <= X"00";
		end if;
end process;


end Behavioral;

