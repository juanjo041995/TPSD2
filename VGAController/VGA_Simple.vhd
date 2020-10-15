----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    19:59:46 10/11/2020 
-- Design Name: 
-- Module Name:    VGA_Simple - Behavioral 
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

entity VGA_Simple is
	PORT( 
				clk_100Mhz, reset_n : in STD_LOGIC;
				hSync, vSync 	     : out STD_LOGIC;
				Red,Green			  : out STD_LOGIC_VECTOR(2 downto 0);
				Blue					  : out STD_LOGIC_VECTOR(1 downto 0)
	);
end VGA_Simple;

architecture Behavioral of VGA_Simple is

COMPONENT Clock_divider
	PORT (
			 clk_100Mhz : in STD_LOGIC;
			 clk_50Mhz  : out STD_LOGIC;
			 clk_25Mhz  : out STD_LOGIC
	);
END COMPONENT;


COMPONENT VGA_Sync
	PORT (
			clk, reset_n 		: in STD_LOGIC;
			HSync, VSync 		: out STD_LOGIC;
			video_on       	: out STD_LOGIC;
			pixel_x, pixel_y	: out STD_LOGIC_VECTOR(9 downto 0)
	);
END COMPONENT;

COMPONENT PINTA_BARRAS
	PORT (
			  pxl_num : in  STD_LOGIC_VECTOR (9 downto 0);
           line_num : in  STD_LOGIC_VECTOR (9 downto 0);
           visible : in  STD_LOGIC;
           red : out  STD_LOGIC_VECTOR (2 downto 0);
           green : out  STD_LOGIC_VECTOR (2 downto 0);
           blue : out  STD_LOGIC_VECTOR (1 downto 0)
	);
END COMPONENT;
signal Visible_on : STD_LOGIC;
signal x,y  		: STD_LOGIC_VECTOR(9 downto 0);
signal temp25		: STD_LOGIC;

begin

Inst_Clock_divider : Clock_divider
	PORT MAP (
					clk_100Mhz => clk_100Mhz,
					clk_25Mhz  => temp25
	);
	
Inst_VGA_Sync : VGA_Sync
	PORT MAP (
					clk => temp25,
					reset_n => reset_n,
					HSync => hSync,
					VSync => vSync,
					pixel_x => x,
					pixel_y => y,
					video_on => Visible_on
	);

Inst_PINTA_BARRAS : PINTA_BARRAS
	PORT MAP (
					pxl_num => x,
					line_num => y,
					visible => Visible_on,
					red => Red,
					green => Green,
					blue => Blue
	);
end Behavioral;

