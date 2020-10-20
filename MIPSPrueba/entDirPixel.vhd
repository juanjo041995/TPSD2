----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    19:17:32 10/19/2020 
-- Design Name: 
-- Module Name:    entDirPixel - Behavioral 
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

entity entDirPixel is
 PORT( 
			addressSW 	: in STD_LOGIC_VECTOR(7 downto 0);
			dataOutMIPS	: out STD_lOGIC_VECTOR(7 downto 0)
		
 );
end entDirPixel;

architecture Behavioral of entDirPixel is
begin
dataOutMIPS <= addressSW;
end Behavioral;

