--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   15:08:04 10/11/2020
-- Design Name:   
-- Module Name:   C:/Users/Juanjo/Documents/FIUNA ONLINE/SD2 online/VGAController/Clock_Test.vhd
-- Project Name:  VGAController
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: Clock_divider
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
 
ENTITY Clock_Test IS
END Clock_Test;
 
ARCHITECTURE behavior OF Clock_Test IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT Clock_divider
    PORT(
         clk_100Mhz : IN  std_logic;
         clk_50Mhz : OUT  std_logic;
         clk_25Mhz : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal clk_100Mhz : std_logic := '0';

 	--Outputs
   signal clk_50Mhz : std_logic;
   signal clk_25Mhz : std_logic;

   -- Clock period definitions
   constant clk_100Mhz_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: Clock_divider PORT MAP (
          clk_100Mhz => clk_100Mhz,
          clk_50Mhz => clk_50Mhz,
          clk_25Mhz => clk_25Mhz
        );

   -- Clock process definitions
   clk_100Mhz_process :process
   begin
		clk_100Mhz <= '0';
		wait for clk_100Mhz_period/2;
		clk_100Mhz <= '1';
		wait for clk_100Mhz_period/2;
   end process;
 
 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 100 ns;	

      --wait for clk_100Mhz_period*10;

      -- insert stimulus here 

      wait;
   end process;

END;
