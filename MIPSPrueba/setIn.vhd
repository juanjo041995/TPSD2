----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    14:42:56 10/20/2020 
-- Design Name: 
-- Module Name:    setIn - Behavioral 
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

entity setIn is
		PORT (
				SW5,SW6 : in STD_LOGIC;
				clk	  : in STD_LOGIC;
				set	  : out STD_LOGIC :='0'
	);
end setIn;

architecture Behavioral of setIn is

begin
process (clk)
		begin
			if (clk'event and clk='1') then
				if SW5 = '0' then
					set <= '1';
				elsif SW6 = '0' then
					set <= '0';
				end if;
			end if;
		end process;


end Behavioral;

