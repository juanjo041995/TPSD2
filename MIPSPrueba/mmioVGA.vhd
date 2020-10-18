----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    22:10:19 10/15/2020 
-- Design Name: 
-- Module Name:    mmioVGA - Behavioral 
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
use work.general.all;
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity mmioVGA is
	PORT (
				cs				: in STD_LOGIC;
				clk			: in STD_LOGIC;
				reset			: in STD_LOGIC;
				memRead		: in STD_LOGIC;
				memWrite		: in STD_LOGIC;
				
				HSync,VSync	: out STD_LOGIC;
				Red,Green 	: out STD_LOGIC_VECTOR(2 downto 0);
				Blue			: out STD_LOGIC_VECTOR(1 downto 0);
				
				tipoAcc 			: in STD_LOGIC_VECTOR(2 downto 0);
				DataIn		: in STD_LOGIC_VECTOR (31 downto 0); 
				
				addressMIPS	: in STD_LOGIC_VECTOR(NUM_BITS_MEMORIA_VGA-1+2 downto 0);
				dataOutMIPS	: out STD_LOGIC_VECTOR(31 downto 0)
	);
end mmioVGA;

architecture Behavioral of mmioVGA is

COMPONENT RAM
	PORT (	
				cs					: in STD_LOGIC;
				clk				: in STD_LOGIC;
				memWrite			: in STD_LOGIC;
				memRead			: in STD_LOGIC;
				
				dataIn			: in STD_LOGIC_VECTOR(31 downto 0);
				tipoAcc 			: in STD_LOGIC_VECTOR(2 downto 0);
				
				addressVGA 		: in STD_LOGIC_VECTOR(NUM_BITS_MEMORIA_VGA -1+2 downto 0);
				dataOutVGA 		: out STD_LOGIC_VECTOR(7 downto 0);
				
				addressMIPS		: in STD_LOGIC_VECTOR(NUM_BITS_MEMORIA_VGA-1+2 downto 0);
				dataOutMIPS		: out STD_LOGIC_VECTOR(31 downto 0)
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

COMPONENT Pinta_IMG
	PORT (
			  pxl_num 		: in  STD_LOGIC_VECTOR (9 downto 0);
           line_num 		: in  STD_LOGIC_VECTOR (9 downto 0);
			  
           visible 		: in  STD_LOGIC;
           red 			: out  STD_LOGIC_VECTOR (2 downto 0);
           green 			: out  STD_LOGIC_VECTOR (2 downto 0);
           blue 			: out  STD_LOGIC_VECTOR (1 downto 0);
			  
			  dataMem		: in STD_LOGIC_VECTOR (7 downto 0);
			  dirMem 		: out STD_LOGIC_VECTOR(NUM_BITS_MEMORIA_VGA -1 +2 downto 0)
	);
END COMPONENT;
signal vis : STD_LOGIC;
signal x,y : STD_LOGIC_VECTOR(9 downto 0);
signal dataM: STD_LOGIC_VECTOR(7 downto 0);
signal dirM: STD_LOGIC_VECTOR(NUM_BITS_MEMORIA_VGA -1 +2 downto 0);
signal res: STD_LOGIC;
begin
Inst_Pinta_IMG : Pinta_IMG
PORT MAP(
			 visible => vis,
			 pxl_num => x,
			 line_num =>y,
			 red => Red,
			 green => Green,
			 blue => Blue,
			 dataMem => dataM,
			 dirMem => dirM
);
Inst_VGA : VGA_Sync
PORT MAP(
			clk => clk,
			reset_n => res,
			HSync => HSync,
			VSync => VSync,
			video_on => vis,
			pixel_x => x,
			pixel_y => y
);
Inst_RAM : RAM
PORT MAP (
				cs			=> cs,		
				clk		=> clk,		
				memWrite	=> memWrite,			
				memRead	=> memRead,
				
				dataIn	=> dataIn,	
				tipoAcc 	=> tipoAcc,		
				
				addressVGA 	=> dirM,	
				dataOutVGA 	=> dataM,
				
				addressMIPS	=> addressMIPS,	
				dataOutMIPS	=>	dataOutMips

);


res<= not(reset);
end Behavioral;

