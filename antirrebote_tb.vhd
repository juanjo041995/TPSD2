--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   18:48:50 05/25/2020
-- Design Name:   
-- Module Name:   C:/Users/juanv/Documents/Materias/Clases Micro 2/XILINX/antirrebote/antirrebote_tb.vhd
-- Project Name:  antirrebote
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: antirrebote
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
 
ENTITY antirrebote_tb IS
END antirrebote_tb;
 
ARCHITECTURE behavior OF antirrebote_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT antirrebote
    PORT(
         b : IN  std_logic;
         reset : IN  std_logic;
         clk : IN  std_logic;
         bf : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal b : std_logic := '0';
   signal reset : std_logic := '0';
   signal clk : std_logic := '0';


 	--Outputs
   signal bf : std_logic;

   -- Clock period definitions
   constant clk_period : time := 0.1 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: antirrebote PORT MAP (
          b => b,
          reset => reset,
          clk => clk,
          bf => bf
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
		reset <= '1';
      wait for 100 ns;	
		reset <= '0';
		
      --wait for clk_period*10;

      -- insert stimulus here 
		b <= '1';
		wait for 1000000 ns;
		b <= '0';

		wait for clk_period*10;

		b <= '1';
		wait for 50000000 ns;
		b <= '0';
		
      wait;
   end process;

END;
