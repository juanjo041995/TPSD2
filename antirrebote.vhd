----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    18:31:32 05/25/2020 
-- Design Name: 
-- Module Name:    antirrebote - Behavioral 
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

entity antirrebote is
    Port ( b : in  STD_LOGIC;
           reset : in  STD_LOGIC;
           clk : in  STD_LOGIC;
           --cont10ms : in  STD_LOGIC;
           bf : out  STD_LOGIC);
end antirrebote;

architecture Behavioral of antirrebote is
   type state_type is (st1_cero, st2_1er_uno, st3_2do_uno, st4_1er_cero, st5_2do_cero); 
   signal state, next_state : state_type; 

	-- Frecuencia 50 MHz
	constant MAX_CONT : std_logic_vector := std_logic_vector(to_unsigned (499999, 19));
	signal cont, cont_next : std_logic_vector (18 downto 0);	-- contador
	signal cont10ms : std_logic;
begin
-----------------------------------------------------
-- Contador 10 ms
-----------------------------------------------------
	process (clk, reset)
	begin
		if clk'event and clk = '1' then
			if reset = '1' then
				cont <= (others => '0');
			else
				cont <= cont_next;
			end if;
		end if;
	end process;
	
	cont_next <= (others => '0') when cont = MAX_CONT else
	             std_logic_vector(unsigned(cont) + 1);
					 
	cont10ms <= '1' when cont = MAX_CONT else 
				   '0';
-----------------------------------------------------
-- Contador 10 ms
-----------------------------------------------------

-----------------------------------------------------
-- Filtro anti rebote
-----------------------------------------------------
	-- variables de estado
   SYNC_PROC: process (clk)
   begin
      if (clk'event and clk = '1') then
         if (reset = '1') then
            state <= st1_cero;
         else
            state <= next_state;
         end if;        
      end if;
   end process;

   NEXT_STATE_DECODE: process (state, b, cont10ms)
   begin
      --declare default state for next_state to avoid latches
      next_state <= state;  --default is to stay in current state
      
      case (state) is
         when st1_cero =>
            if b = '1' and cont10ms = '1' then
               next_state <= st2_1er_uno;
            end if;
         when st2_1er_uno =>
            if b = '1' and cont10ms = '1' then
               next_state <= st3_2do_uno;
            end if;
            if b = '0' and cont10ms = '1' then
               next_state <= st1_cero;
            end if;
         when st3_2do_uno =>
            next_state <= st4_1er_cero;
			when st4_1er_cero =>
            if b = '0' and cont10ms = '1' then
               next_state <= st5_2do_cero;
            end if;
			when st5_2do_cero =>
            if b = '0' and cont10ms = '1' then
               next_state <= st1_cero;
            end if;
            if b = '1' and cont10ms = '1' then
               next_state <= st4_1er_cero;
            end if;
         when others =>
            next_state <= st1_cero;
      end case;      
   end process;

   OUTPUT_DECODE: process (state)
   begin
      if state = st3_2do_uno then
         bf <= '1';
      else
         bf <= '0';
      end if;
   end process;
 
end Behavioral;

