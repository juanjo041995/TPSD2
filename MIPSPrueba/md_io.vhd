----------------------------------------------------------------------------------
-- Company: Universidad Cat�lica
-- Engineer: Vicente Gonz�lez
-- 
-- Create Date:    14:44:35 06/14/2017 
-- Design Name: 
-- Module Name:    md_io - Behavioral 
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
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity md_io is
    Port ( dir       : in  STD_LOGIC_VECTOR (31 downto 0);
           datain    : in  STD_LOGIC_VECTOR (31 downto 0);
           memwrite  : in  STD_LOGIC;
           memread   : in  STD_LOGIC;
			  tipoAcc   : in STD_LOGIC_VECTOR (2 downto 0); --tipo de operaci�n a realizar, cargar bytes, half word y word
           clk       : in  STD_LOGIC;
           dataout   : out  STD_LOGIC_VECTOR (31 downto 0);
			  reset		: in STD_LOGIC;
			  HSync,VSync: out STD_LOGIC;
			  Red,Green 	: out STD_LOGIC_VECTOR(2 downto 0);
			  Blue			: out STD_LOGIC_VECTOR(1 downto 0);
			  LEDS : out STD_LOGIC_VECTOR( 7 downto 0) -- cuidao
			  );
end md_io;

architecture Behavioral of md_io is
	COMPONENT mmioVGA
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
	END COMPONENT;
	
	COMPONENT decodificador
    Port ( ent       : in  STD_LOGIC_VECTOR (31 downto 0);
           csMem     : out  STD_LOGIC;
			  csVGA		: out STD_LOGIC;
			  csOutRandom : out STD_LOGIC
			);
	END COMPONENT;

	COMPONENT md
    Port ( dir      : in STD_LOGIC_VECTOR (NUM_BITS_MEMORIA_DATOS -1 +2 downto 0);
           datain   : in  STD_LOGIC_VECTOR (31 downto 0);
           cs       : in  STD_LOGIC;
           memwrite : in  STD_LOGIC;
           memread  : in  STD_LOGIC;
			  tipoAcc  : in STD_LOGIC_VECTOR (2 downto 0);
           clk      : in  STD_LOGIC;
           dataout  : out  STD_LOGIC_VECTOR (31 downto 0)
			);
	END COMPONENT;



-- Definimos se�ales para interconexi�n interna en este m�dulo
	signal csMem       : STD_LOGIC;
	signal csVGA		 : STD_LOGIC;
	signal datosMem    : STD_LOGIC_VECTOR (31 downto 0);
	signal datosVGA	 : STD_LOGIC_VECTOR (31 downto 0);
	signal csOutRandom : STD_LOGIC;
	
begin

	-- Multiplexor de salida
	process(datosMem,csMem,csVGA,datosVGA,csOutRandom)
	begin
		if csMem = '1' then
			dataout <= datosMem;
		elsif csVGA = '1' then
			dataout <= datosVGA;
		elsif csOutRandom ='1' then
			dataOut <=X"000000" & X"FF";
		else
			dataout <=X"00000000";
		end if;
	end process;
	
	Inst_decodificador: decodificador PORT MAP(
		ent       => dir(31 downto 0),
      csMem     => csMem,
		csVGA		 => csVGA,
		csOutRandom => csOutRandom
	);

	Inst_md: md PORT MAP(
		dir      => dir(NUM_BITS_MEMORIA_DATOS -1+2 downto 0),
      datain   => datain,
      cs       => csMem,
      memwrite => memwrite,
      memread  => memread,
		tipoAcc  => tipoAcc,
      clk      => clk,
      dataout  => datosMem
	);
	Inst_mmioVGA : mmioVGA 
		PORT MAP (
						cs => csVGA,
						clk => clk,
						reset => reset,
						memRead => memread,
						memWrite => memwrite,
						HSync => HSync,
						VSync => VSync,
						Red => Red,
						Green => Green,
						Blue	=> Blue,
						DataIn	=> datain,
						DataOutMIPS	=> datosVGA,
						addressMIPS => dir(NUM_BITS_MEMORIA_VGA-1+2 downto 0),
						tipoAcc => tipoAcc
		);
 process(csOutRandom)
 begin
 if csOutRandom = '1' then
	LEDS <= X"FF";
	else
	LEDS <= X"00";
	end if;
	end process;
end Behavioral;
