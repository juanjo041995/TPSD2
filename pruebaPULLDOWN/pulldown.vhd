----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    15:08:50 10/16/2020 
-- Design Name: 
-- Module Name:    pulldown - Behavioral 
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
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity pulldowns is
	PORT(
			sw1 : in STD_LOGIC;
			LED : out STD_LOGIC_VECTOR(7 downto 0)
	);
end pulldowns;

architecture Behavioral of pulldowns is

begin
		process(sw1)
		begin
			if sw1='1' then
				LED <= "11111111";
			else
				LED <= "00000000";
			end if;
		end process;

end Behavioral;

