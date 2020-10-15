--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   19:33:29 10/11/2020
-- Design Name:   
-- Module Name:   C:/Users/Juanjo/Documents/FIUNA ONLINE/SD2 online/VGAController/VGA_Sync_Test.vhd
-- Project Name:  VGAController
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: VGA_Sync
-- 
-- Dependencies:
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
--
-- Notes: 
-- This testbench has been automatically generated using types std_logic and
-- std_logic_vector for the ports of the unit under test.  Xilinx recommends
-- that these types always be used for the top-level I/O of a design in order
-- to guarantee that the testbench will bind correctly to the post-implementation 
-- simulation model.
--------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY VGA_Sync_Test IS
END VGA_Sync_Test;
 
ARCHITECTURE behavior OF VGA_Sync_Test IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT VGA_Sync
    PORT(
         clk : IN  std_logic;
         reset_n : IN  std_logic;
         HSync : OUT  std_logic;
         VSync : OUT  std_logic;
         video_on : OUT  std_logic;
         pixel_x : OUT  std_logic_vector(9 downto 0);
         pixel_y : OUT  std_logic_vector(9 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal clk : std_logic := '0';
   signal reset_n : std_logic := '0';

 	--Outputs
   signal HSync : std_logic;
   signal VSync : std_logic;
   signal video_on : std_logic;
   signal pixel_x : std_logic_vector(9 downto 0);
   signal pixel_y : std_logic_vector(9 downto 0);

   -- Clock period definitions
   constant clk_period : time := 40 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: VGA_Sync PORT MAP (
          clk => clk,
          reset_n => reset_n,
          HSync => HSync,
          VSync => VSync,
          video_on => video_on,
          pixel_x => pixel_x,
          pixel_y => pixel_y
        );

   -- Clock process definitions
   clk_process :process
   begin
		clk <= '0';
		wait for clk_period/2;
		clk <= '1';
		wait for clk_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 100 ns;	

      --wait for clk_period*10;

      -- insert stimulus here
			reset_n <= '0';
			wait for 100 ns;
			reset_n <= '1';

      wait;
   end process;

END;
