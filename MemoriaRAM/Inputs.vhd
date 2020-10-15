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
			  --memReadSW4: in STD_LOGIC;
           memWriteSW5 : in  STD_LOGIC;
			  dirMemPinta : in STD_LOGIC_VECTOR (2 downto 0);
			  dirFinal: out STD_LOGIC_VECTOR (2 downto 0)
			  );
end Inputs;

architecture Behavioral of Inputs is
signal address : STD_LOGIC_VECTOR(2 downto 0) := "000";
begin
		process(SWAddress,memWriteSW5,dirMemPinta)--memread excluido
		begin
		--if(memReadSW4 ='1') then
		--	address <= dirMemPinta;
		if(memWriteSW5 ='0') then --elsif
			address <= SWAddress;
		else
			address <= dirMemPinta; --"000"
		end if;
		end process;
	dirFinal <= address;

end Behavioral;

