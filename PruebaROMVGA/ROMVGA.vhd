----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    22:46:32 10/12/2020 
-- Design Name: 
-- Module Name:    ROMVGA - Behavioral 
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

entity ROMVGA is
	PORT(
			clk : in STD_LOGIC;
			rst_n: in STD_LOGIC;
			HSync, VSync : out STD_LOGIC;
			red : out  STD_LOGIC_VECTOR (2 downto 0);
         green : out  STD_LOGIC_VECTOR (2 downto 0);
         blue : out  STD_LOGIC_VECTOR (1 downto 0)
	);
end ROMVGA;

architecture Behavioral of ROMVGA is
COMPONENT Clock_divider
	PORT (
				clk_100Mhz : in STD_LOGIC;
				clk_50Mhz  : out STD_LOGIC;
				clk_25Mhz  : out STD_LOGIC
	);
END COMPONENT;

COMPONENT ROM
	PORT (
			address	: in STD_LOGIC_VECTOR(2 downto 0); -- se ignoran FFFF debido al decodificador
			dataOut	: out STD_LOGIC_VECTOR(7 downto 0)
	);
END COMPONENT;

COMPONENT VGA_Sync
	PORT ( clk, reset_n 		: in STD_LOGIC;
				HSync, VSync 		: out STD_LOGIC;
				video_on       	: out STD_LOGIC;
				pixel_x, pixel_y	: out STD_LOGIC_VECTOR(9 downto 0)
	);
END COMPONENT;

COMPONENT Pinta_IMG
	PORT (
				pxl_num : in  STD_LOGIC_VECTOR (9 downto 0);
           line_num : in  STD_LOGIC_VECTOR (9 downto 0);
           visible : in  STD_LOGIC;
           red : out  STD_LOGIC_VECTOR (2 downto 0);
           green : out  STD_LOGIC_VECTOR (2 downto 0);
           blue : out  STD_LOGIC_VECTOR (1 downto 0);
			  dataMem: in STD_LOGIC_VECTOR (7 downto 0);
			  dirMem : out STD_LOGIC_VECTOR (2 downto 0)
	);
END COMPONENT;
signal x,y : STD_LOGIC_VECTOR(9 downto 0);
signal Dmem : STD_LOGIC_VECTOR (7 downto 0);	
signal DirMem : STD_LOGIC_VECTOR (2 downto 0); 
signal vis : STD_LOGIC;
signal temp25: STD_LOGIC;
begin

Inst_Clock_divider : Clock_divider
PORT MAP(
			clk_100Mhz => clk,
			clk_25Mhz => temp25
);
Inst_VGA_Sync : VGA_Sync
PORT MAP(
			clk => temp25,
			reset_n => rst_n,
			video_on => vis,
			HSync => HSync,
			VSync => VSync,
			pixel_x => x,
			pixel_y => y
);
Inst_ROM : ROM 
PORT MAP (
			address => DirMem,
			dataOut => Dmem
);
Inst_Pinta_IMG : Pinta_IMG
PORT MAP (
				pxl_num => x,
				line_num => y,
				visible => vis,
				red => red,
				green => green,
				blue => blue,
				dataMem => Dmem,
				dirMem => DirMem
);

end Behavioral;

