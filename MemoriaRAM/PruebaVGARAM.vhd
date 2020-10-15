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
				clk, rst_n 					: in STD_LOGIC;
				SWAddress						: in STD_LOGIC_VECTOR(2 downto 0);
				dataSWColor					: in STD_LOGIC_VECTOR(7 downto 0);
				memReadSW4,memWriteSW5	: in STD_LOGIC;
				Red,Green 					: out STD_LOGIC_VECTOR(2 downto 0);
				Blue							: out STD_LOGIC_VECTOR(1 downto 0);
				HSync,VSync					: out STD_LOGIC
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

COMPONENT VGA_Sync
	PORT(
			clk, reset_n 		: in STD_LOGIC;
			HSync, VSync 		: out STD_LOGIC;
			video_on       	: out STD_LOGIC;
			pixel_x, pixel_y	: out STD_LOGIC_VECTOR(9 downto 0)
	);
END COMPONENT;

COMPONENT RAM
	PORT(
				clk		: in STD_LOGIC;
				memWrite	: in STD_LOGIC;
				memRead	: in STD_LOGIC;
				address	: in STD_LOGIC_VECTOR(2 downto 0); -- se ignoran FFFF debido al decodificador
				dataIn	: in STD_LOGIC_VECTOR(7 downto 0);
				dataOut	: out STD_LOGIC_VECTOR(7 downto 0)
	);
END COMPONENT;

COMPONENT Pinta_IMG
	PORT(
				pxl_num : in  STD_LOGIC_VECTOR (9 downto 0);
           line_num : in  STD_LOGIC_VECTOR (9 downto 0);
           visible : in  STD_LOGIC;
           red : out  STD_LOGIC_VECTOR (2 downto 0);
           green : out  STD_LOGIC_VECTOR (2 downto 0);
           blue : out  STD_LOGIC_VECTOR (1 downto 0);
			  dataMem: in STD_LOGIC_VECTOR (7 downto 0);
			  dirMem : out STD_LOGIC_VECTOR (2 downto 0));
END COMPONENT;

COMPONENT Inputs
	PORT (
			  SWAddress : in  STD_LOGIC_VECTOR (2 downto 0);
			  memReadSW4: in STD_LOGIC;
           memWriteSW5 : in  STD_LOGIC;
			  dirMemPinta : in STD_LOGIC_VECTOR (2 downto 0);
			  dirFinal: out STD_LOGIC_VECTOR (2 downto 0)
	);
END COMPONENT;
signal x,y: STD_LOGIC_VECTOR(9 downto 0);
signal vis: STD_LOGIC;
signal dirM: STD_LOGIC_VECTOR(2 downto 0);
signal datM: STD_LOGIC_VECTOR(7 downto 0);
signal dataSW: STD_LOGIC_VECTOR(7 downto 0);
signal addrF: STD_LOGIC_VECTOR(2 downto 0);
signal memRD, memWR: STD_LOGIC;
signal temp25: STD_LOGIC;
begin
Inst_Clock_divider : Clock_divider
PORT MAP (
				clk_100Mhz => clk,
				clk_25Mhz => temp25
);
Inst_VGA : VGA_Sync
PORT MAP (
			clk => temp25,
			reset_n 	=> rst_n,
			HSync => HSync,
			VSync => VSync,
			video_on  => vis,
			pixel_x => x,
			pixel_y	=> y
);
Inst_RAM : RAM
PORT MAP (
				clk	=>	 temp25,
				memWrite	=> memWR, 
				memRead	 => memRD,
				address	 => addrF,
				dataIn	 => dataSW,
				dataOut	 => datM

);
Inst_Pinta : Pinta_IMG
PORT MAP(
			  pxl_num => x, 
           line_num => y,
           visible => vis,
           red => Red,
           green => Green,
           blue  => Blue,
			  dataMem => datM,
			  dirMem => dirM
);
Inst_Inputs : Inputs
PORT MAP(
			  SWAddress =>  SWAddress,
			  memReadSW4 => memRD,
			  memWriteSW5 => memWR,
			  dirMemPinta => dirM ,
			  dirFinal => addrF

);
memRD <= memReadSW4;
memWR <= memWriteSW5;
dataSW <= dataSWColor;

end Behavioral;

