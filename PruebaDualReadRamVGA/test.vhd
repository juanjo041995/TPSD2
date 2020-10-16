--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   15:47:08 10/16/2020
-- Design Name:   
-- Module Name:   D:/GitHubRepos/TPSD2/PruebaDualReadRamVGA/test.vhd
-- Project Name:  PruebaDualReadRamVGA
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: PruebaVGARAM
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
 
ENTITY test IS
END test;
 
ARCHITECTURE behavior OF test IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT PruebaVGARAM
    PORT(
         clk : IN  std_logic;
         reset : IN  std_logic;
         SWAddress : IN  std_logic_vector(2 downto 0);
         dataSWColor : IN  std_logic_vector(7 downto 0);
         memReadSW4 : IN  std_logic;
         memWriteSW5 : IN  std_logic;
         Red : OUT  std_logic_vector(2 downto 0);
         Green : OUT  std_logic_vector(2 downto 0);
         Blue : OUT  std_logic_vector(1 downto 0);
         HSync : OUT  std_logic;
         VSync : OUT  std_logic;
         LEDS : OUT  std_logic_vector(7 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal clk : std_logic := '0';
   signal reset : std_logic := '0';
   signal SWAddress : std_logic_vector(2 downto 0) := (others => '0');
   signal dataSWColor : std_logic_vector(7 downto 0) := (others => '0');
   signal memReadSW4 : std_logic := '0';
   signal memWriteSW5 : std_logic := '0';

 	--Outputs
   signal Red : std_logic_vector(2 downto 0);
   signal Green : std_logic_vector(2 downto 0);
   signal Blue : std_logic_vector(1 downto 0);
   signal HSync : std_logic;
   signal VSync : std_logic;
   signal LEDS : std_logic_vector(7 downto 0);

   -- Clock period definitions
   constant clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: PruebaVGARAM PORT MAP (
          clk => clk,
          reset => reset,
          SWAddress => SWAddress,
          dataSWColor => dataSWColor,
          memReadSW4 => memReadSW4,
          memWriteSW5 => memWriteSW5,
          Red => Red,
          Green => Green,
          Blue => Blue,
          HSync => HSync,
          VSync => VSync,
          LEDS => LEDS
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
			reset <= '1';
			wait for 100 ns;
			reset<='0';
			wait for 100 ns;
			SWAddress <= "000";
			dataSWColor <= "11100000";
			wait for 10 ns;
			memWriteSW5 <= '1';
			wait for 10 ns;
			memWriteSW5 <= '0';
			wait for 10 ns;
			SWAddress <= "001";
			dataSWColor <= "00011100";
			wait for 10 ns;
			memWriteSW5 <= '1';
			wait for 10 ns;
			memWriteSW5 <= '0';
			wait for 10 ns;
			SWAddress <="000";
			wait for 10 ns;
			memReadSW4 <= '1';
			wait for 100ns;
			memReadSW4 <= '0';
			wait for 100 ns;
			SWAddress <="001";
			wait for 10 ns;
			memReadSW4 <= '1';
			wait for 100ns;
			memReadSW4 <= '0';
			wait for 100 ns;
			
			--SWAddress : IN  std_logic_vector(2 downto 0);
        -- dataSWColor : IN  std_logic_vector(7 downto 0);
        -- memReadSW4 : IN  std_logic;
        -- memWriteSW5 : IN  std_logic;
      --wait for clk_period*10;

      -- insert stimulus here 

      wait;
   end process;

END;
