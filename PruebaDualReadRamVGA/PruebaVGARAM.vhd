----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    16:20:32 10/15/2020 
-- Design Name: 
-- Module Name:    PruebaVGARAM - Behavioral 
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

entity PruebaVGARAM is
	PORT (
				clk, reset 					: in STD_LOGIC;
				SWAddress					: in STD_LOGIC_VECTOR(2 downto 0);
				dataSWColor					: in STD_LOGIC_VECTOR(7 downto 0);
				memReadSW4 					: in STD_LOGIC;
				memWriteSW5					: in STD_LOGIC;
				Red,Green 					: out STD_LOGIC_VECTOR(2 downto 0);
				Blue							: out STD_LOGIC_VECTOR(1 downto 0);
				HSync,VSync					: out STD_LOGIC;
				LEDS							: out STD_LOGIC_VECTOR(7 downto 0)
	);
end PruebaVGARAM;

architecture Behavioral of PruebaVGARAM is
COMPONENT Clock_divider
	PORT( 
				clk_100Mhz : in STD_LOGIC;
				clk_50Mhz  : out STD_LOGIC;
				clk_25Mhz  : out STD_LOGIC
	);
END COMPONENT;

COMPONENT mmioVGA
	PORT(
				cs				: in STD_LOGIC;
				clk,reset,memRead,memWrite: in STD_LOGIC;
				HSync,VSync: out STD_LOGIC;
				Red,Green 	: out STD_LOGIC_VECTOR(2 downto 0);
				Blue			: out STD_LOGIC_VECTOR(1 downto 0);
				DataIn		: in STD_LOGIC_VECTOR (7 downto 0); 
				DataOutMips	: out STD_LOGIC_VECTOR(7 downto 0);
				addressMIPS : in STD_LOGIC_VECTOR(2 downto 0)
	
	);
END COMPONENT;
signal cs: STD_LOGIC := '1';
signal x,y: STD_LOGIC_VECTOR(9 downto 0);
signal vis: STD_LOGIC;
signal NOTADDRESS: STD_LOGIC_VECTOR(2 downto 0);
signal NOTREAD,NOTWRITE,NOTRESET: STD_LOGIC :='0';
--signal memRD, 
signal temp25: STD_LOGIC;
begin

Inst_mmioVGA : mmioVGA
PORT MAP(
				cs	 => cs,			
				clk => temp25,
				reset => NOTRESET,
				memRead => NOTREAD,
				memWrite => NOTWRITE,
				HSync   => HSync,
				VSync		=> VSync,
				Red		=> Red,
				Green 	=> Green,
				Blue		=> Blue,
				DataIn	=> dataSWColor,	
				DataOutMips	=> LEDS,
				addressMIPS =>NOTADDRESS

);
Inst_Clock_divider : Clock_divider
PORT MAP (
				clk_100Mhz => clk,
				clk_25Mhz => temp25
);
NOTADDRESS <= not SWAddress;
NOTREAD <= not memReadSW4;
NOTWRITE <= not memWriteSW5;
NOTRESET <= not reset;

end Behavioral;

