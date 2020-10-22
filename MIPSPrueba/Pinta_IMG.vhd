----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    00:16:22 10/11/2020 
-- Design Name: 
-- Module Name:    PINTA_BARRAS - Behavioral 
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

entity Pinta_IMG is
    Port ( pxl_num 		: in  STD_LOGIC_VECTOR (9 downto 0);
           line_num 		: in  STD_LOGIC_VECTOR (9 downto 0);
			  
           visible 		: in  STD_LOGIC;
           red 			: out  STD_LOGIC_VECTOR (2 downto 0);
           green 			: out  STD_LOGIC_VECTOR (2 downto 0);
           blue 			: out  STD_LOGIC_VECTOR (1 downto 0);
			  
			  dataMem		: in STD_LOGIC_VECTOR (7 downto 0);
			  dirMem 		: out STD_LOGIC_VECTOR(NUM_BITS_MEMORIA_VGA -1 +2 downto 0));
end Pinta_IMG;


architecture behavioral of Pinta_IMG is
	begin
			process(pxl_num,line_num,visible,datamem)
				variable x_int, y_int,xmod,ymod : natural;
				variable offset: natural;
				begin
					x_int := TO_INTEGER(unsigned(pxl_num(9 downto 0)));
					y_int := TO_INTEGER(unsigned(line_num(9 downto 0)));
					xmod := x_int / 40;
					ymod := y_int /30 ;
					if visible = '1' then
						offset := xmod + ymod * 16;
						red <= dataMem (7 downto 5);
						green <= dataMem (4 downto 2);
						blue <= dataMem (1 downto 0);
						dirmem <= STD_LOGIC_VECTOR(to_unsigned(offset,NUM_BITS_MEMORIA_VGA+2));
					else
						red <= (others=>'0');
						green <= (others=>'0');
						blue <= (others=>'0');
						dirmem <= (others => '0');
					end if;
			end process;
end Behavioral;