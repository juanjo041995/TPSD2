----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    22:43:14 10/19/2020 
-- Design Name: 
-- Module Name:    dirPixel - Behavioral 
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

entity dirPixel is
	PORT (
				DPSWitch : in STD_LOGIC_VECTOR(7 downto 0);
				cs			: in STD_LOGIC;
				dataOut	: out STD_LOGIC_VECTOR(7 downto 0)
	);
end dirPixel;

architecture Behavioral of dirPixel is

begin
process(cs,DPSwitch)
begin
	if cs='1' then
		dataOut <= DPSwitch;
	else
		dataOut <= X"00";
	end if;
end process;
end Behavioral;

