----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    15:19:46 10/11/2020 
-- Design Name: 
-- Module Name:    VGA1 - Behavioral 
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

entity VGA1 is
	PORT (
				clk_100Mhz : in  STD_LOGIC;
				rst_n      : in  STD_LOGIC;
            HSync      : out STD_LOGIC;
            VSync      : out STD_LOGIC;
            Red        : out STD_LOGIC_VECTOR(2 downto 0);
            Green      : out STD_LOGIC_VECTOR(2 downto 0);
            Blue       : out STD_LOGIC_VECTOR(2 downto 1)
	
	);
end VGA1;

architecture Behavioral of VGA1 is

COMPONENT Clock_divider
	PORT(
			clk_100Mhz : in  STD_LOGIC;
			clk_50Mhz  : out STD_LOGIC;
			clk_25Mhz  : out STD_LOGIC
	);
END COMPONENT;

COMPONENT MimasV2VGADisplay
	PORT(
				clk 		  : in  STD_LOGIC;
				rst_n      : in  STD_LOGIC;
            HSync      : out STD_LOGIC;
            VSync      : out STD_LOGIC;
				rgb		  : in STD_LOGIC_VECTOR(7 downto 0);
				--pxl_num	  : out STD_LOGIC_VECTOR(9 downto 0);
				--line_num	  : out STD_LOGIC_VECTOR(9 downto 0);
				nhc : out integer range 0 to 1023;
				nvc : out integer range 0 to 1023;
            Red        : out STD_LOGIC_VECTOR(2 downto 0);
            Green      : out STD_LOGIC_VECTOR(2 downto 0);
            Blue       : out STD_LOGIC_VECTOR(2 downto 1)
	);
END COMPONENT;

COMPONENT VGAOut
	PORT(
				 clock      : in  STD_LOGIC; 
             --pxl_num	   : in STD_LOGIC_VECTOR(9 downto 0);
				 --line_num	: in STD_LOGIC_VECTOR(9 downto 0);
				 nhc: in integer range 0 to 1023;
				 nvc: in integer range 0 to 1023;
             pixels     : out STD_LOGIC_VECTOR(7 downto 0) 
	);
END COMPONENT;
signal temp50 : STD_LOGIC;
signal temp25 : STD_LOGIC;
signal rgb	  : STD_LOGIC_VECTOR(7 downto 0);
signal x, y   : integer range 0 to 1023;
begin

Inst_Clock_divider : Clock_divider
	PORT MAP (
					clk_100Mhz => clk_100Mhz,
					clk_50Mhz  => temp50,
					clk_25Mhz  => temp25
	);
Inst_VGA_Display : MimasV2VGADisplay
	PORT MAP (
					clk      => temp25,
					rst_n    => rst_n,
					HSync    => HSync,
					VSync    => VSync,
					rgb      => rgb,
					--pxl_num  => x,
					--line_num => y,
					nhc => x,
					nvc => y,
					Red      => Red,
					Green    => Green,
					Blue     => Blue
	);
Inst_VGAOut : VGAOut
	PORT MAP (
					clock => temp50,
					--pxl_num  => x,
					--line_num => y,
					nhc => x,
					nvc => y,
					pixels => rgb
	);


end Behavioral;

