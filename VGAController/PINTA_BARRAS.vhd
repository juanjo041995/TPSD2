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

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity PINTA_BARRAS is
    Port ( pxl_num : in  STD_LOGIC_VECTOR (9 downto 0);
           line_num : in  STD_LOGIC_VECTOR (9 downto 0);
           visible : in  STD_LOGIC;
           red : out  STD_LOGIC_VECTOR (2 downto 0);
           green : out  STD_LOGIC_VECTOR (2 downto 0);
           blue : out  STD_LOGIC_VECTOR (1 downto 0));
end PINTA_BARRAS;


architecture behavioral of pinta_barras is
	constant c_bar_width : natural := 64;
	begin
	P_pinta: Process (visible, pxl_num, line_num)
	
	begin
	red <= (others=>'0');
	green <= (others=>'0');
	blue <= (others=>'0');
	if visible = '1' then
		-- linea blanca de 1 pixel en los bordes
			if to_integer(unsigned(pxl_num)) = 0 OR to_integer(unsigned(pxl_num)) = 639 OR
				to_integer(unsigned(line_num))=0 OR to_integer(unsigned(line_num))= 479 then
				red <= (others=>'1');
				green <= (others=>'1');
				blue <= (others=>'1');
			elsif to_integer(unsigned(line_num)) >= 256 and to_integer(unsigned(line_num)) < 256 + c_bar_width then
			-- esto solo tiene sentido para la XUPV2P
				red <= std_logic_vector(pxl_num(2 downto 0));
				green <= std_logic_vector(pxl_num(2 downto 0));
				blue <= std_logic_vector(pxl_num(1 downto 0));
				if to_integer(unsigned(pxl_num)) >= 256 then
					red <= std_logic_vector(pxl_num(2 downto 0));
					green <= std_logic_vector(to_unsigned(255-to_integer(unsigned(pxl_num(7 downto 0))),3));
					blue <= (others=>'0');
				end if;
				if to_integer(unsigned(pxl_num)) >= 512 then -- rayas horizontales
					red <= (others=>not(line_num(0)));
					green <= (others=>not(line_num(0)));
					blue <= (others=>not(line_num(0))); 				end if;
			elsif to_integer(unsigned(line_num)) >= 256+c_bar_width and to_integer(unsigned(line_num)) < 256 + 2*c_bar_width then
				red <= std_logic_vector(to_unsigned(255 - to_integer(unsigned(pxl_num(7 downto 0))),3));
				green <= std_logic_vector(to_unsigned(255 - to_integer(unsigned(pxl_num(7 downto 0))),3));
				blue <= std_logic_vector(to_unsigned(255 - to_integer(unsigned(pxl_num(7 downto 0))),2));
				if to_integer(unsigned(pxl_num)) >= 256 then
					red <=std_logic_vector(to_unsigned(255 - to_integer(unsigned(pxl_num(7 downto 0))),3));
					green<=(others=>'0');
					blue <= std_logic_vector(pxl_num(1 downto 0));
				end if;
				if to_integer(unsigned(pxl_num)) >= 512 then -- puntos
					red <= (others=>pxl_num(0) xor line_num(0));
					green <= (others=>pxl_num(0) xor line_num(0));
					blue <= (others=>pxl_num(0) xor line_num(0));
				end if;
			elsif to_integer(unsigned(pxl_num))/c_bar_width = 0 then
			-- columna 0 sera blanca, columna 1 negra, ...
				red <= (others=>not(pxl_num(0)));
				green <= (others=>not(pxl_num(0)));
				blue <= (others=>not(pxl_num(0)));
			elsif to_integer(unsigned(pxl_num))/c_bar_width = 1 then --blanco
				red <= (others=>'1');
				green <= (others=>'1');
				blue <= (others=>'1');
			elsif to_integer(unsigned(pxl_num))/c_bar_width = 2 then --amarillo
				red <= (others=>'1');
				green <= (others=>'1');
				blue <= (others=>'0');
			elsif to_integer(unsigned(pxl_num))/c_bar_width = 3 then --cian
				red <= (others=>'0');
				green <= (others=>'1');
				blue <= (others=>'1');
			elsif to_integer(unsigned(pxl_num))/c_bar_width = 4 then --verde
				red <= (others=>'0');
				green <= (others=>'1');
				blue <= (others=>'0');
			elsif to_integer(unsigned(pxl_num))/c_bar_width = 5 then --magenta
				red <= (others=>'1');
				green <= (others=>'0');
				blue <= (others=>'1');
			elsif to_integer(unsigned(pxl_num))/c_bar_width = 6 then --rojo
				red <= (others=>'1');
				green <= (others=>'0');
				blue <= (others=>'0');
			elsif to_integer(unsigned(pxl_num))/c_bar_width = 7 then --azul
				red <= (others=>'0');
				green <= (others=>'0');
				blue <= (others=>'1');
			elsif to_integer(unsigned(pxl_num))/c_bar_width = 8 then --negro
				red <= (others=>'0');
				green <= (others=>'0');
				blue <= (others=>'0');
			else -- columna 639 sera blanca, 638 negra, ...
				red <= (others=>pxl_num(0));
				green <= (others=>pxl_num(0));
				blue <= (others=>pxl_num(0));
			end if;
		end if;
	end process;
end Behavioral;