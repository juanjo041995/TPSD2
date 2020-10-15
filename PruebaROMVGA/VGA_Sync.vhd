----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    16:37:13 10/11/2020 
-- Design Name: 
-- Module Name:    VGA_Sync - Behavioral 
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

entity VGA_Sync is
	PORT(
			clk, reset_n 		: in STD_LOGIC;
			HSync, VSync 		: out STD_LOGIC;
			video_on       	: out STD_LOGIC;
			pixel_x, pixel_y	: out STD_LOGIC_VECTOR(9 downto 0)
	);
end VGA_Sync;

architecture Behavioral of VGA_Sync is
	constant HD: integer:= 640; -- horizontal display
	constant HF: integer:= 16; -- hsync front porch
	constant HB: integer:= 48; -- hsync back porch
	constant HR: integer:= 96; -- hsync retrace
	
	constant VD: integer:= 480; -- vertical display
	constant VF: integer:= 11; -- vsync front porch
	constant VB: integer:= 31; -- vsync back porch
	constant VR: integer:= 2; -- vsync retrace
	
	signal hCount       : integer range 0 to 1023 := 640;
   signal vCount       : integer range 0 to 1023 := 480;
   signal nextHCount   : integer range 0 to 1023 := 641;
   signal nextVCount   : integer range 0 to 1023 := 480;
	
begin
		process (clk,reset_n)
		begin
			if (reset_n = '0') then
				hCount <= 640;
				vCount <= 480;
			elsif (clk'event and clk='1') then
				if hCount = (HD+HF+HB+HR-1) then
					hCount <= 0;
					if vCount = (VD+VF+VB+VR-1) then
						vCount <=0;
					else 
						vCount <= vCount +1;
					end if;
				else
				hCount <= hCount + 1;
				end if;
				
				if nextHCount = (HD+HF+HB+HR-1) then
					nextHCount <= 0;
					if nextVCount = (VD+VF+VB+VR-1) then
						nextVCount <=0;
					else 
						nextVCount <= VCount +1;
					end if;
				else
				nextHCount <= HCount + 1;
				end if;
				-- CUIDADO CONDICION
				if (vCount >= VD + VF and vCount < VD + VF + VR) then
					VSync <= '0';
				else
					VSync <= '1';
				end if;
				
				if (hCount >= HD + HF and hCount < HD + HF + HR) then
					HSync <= '0';
				else
					HSync <= '1';
				end if;
				
				if (hCount < HD and vCount < VD) then
					video_on <= '1';
				else
					video_on <= '0';
				end if;
			end if;
		end process;
		pixel_x <= STD_LOGIC_VECTOR(TO_UNSIGNED(nextHCount,pixel_x'length));
		pixel_y <= STD_LOGIC_VECTOR(TO_UNSIGNED(nextVCount,pixel_y'length));	
end Behavioral;

