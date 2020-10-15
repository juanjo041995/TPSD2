----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    14:45:04 10/11/2020 
-- Design Name: 
-- Module Name:    Clock_divider - Behavioral 
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

entity Clock_divider is
	PORT (	
				clk_100Mhz : in STD_LOGIC;
				clk_50Mhz  : out STD_LOGIC;
				clk_25Mhz  : out STD_LOGIC
			);
end Clock_divider;

architecture Behavioral of Clock_divider is
signal count: integer range 0 to 3 := 0;
signal temp50: STD_LOGIC;
signal temp25: STD_LOGIC;
begin
	process(clk_100Mhz)
	begin
		if clk_100Mhz'event and clk_100Mhz = '1' then
			if count = 3 then
				count <= 0;
			else
				count <= count +1;
			end if;
		end if;
	end process;
	
	process (count)
	begin
		if count = 0 or count = 2 then
			temp50 <= '0';
		else
			temp50 <= '1';
		end if;
		
		if count =0 or count =1 then
			temp25 <= '0';
		else
			temp25 <= '1';
		end if;
	end process;
	
	clk_50Mhz <= temp50;
	clk_25Mhz <= temp25;
end Behavioral;

