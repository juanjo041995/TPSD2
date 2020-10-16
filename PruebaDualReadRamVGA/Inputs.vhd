----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    15:30:13 10/15/2020 
-- Design Name: 
-- Module Name:    Inputs - Behavioral 
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

entity Inputs is
    Port ( SWAddress : in  STD_LOGIC_VECTOR (2 downto 0);
			  memReadSW4: in STD_LOGIC;
           memWriteSW5 : in  STD_LOGIC
			  );
end Inputs;

architecture Behavioral of Inputs is
begin

end Behavioral;

