--
--	Package File Template
--
--	Purpose: This package defines supplemental types, subtypes, 
--		 constants, and functions 
--
--   To use any of the example code shown below, uncomment the lines and modify as necessary
--

library IEEE;
use IEEE.STD_LOGIC_1164.all;

package general is


-- cantidad de bits de direcciones de las memorias del MIPS
-- Estos definen el tamaño de la memoria disponible para programa y datos
-- Recordar que el FPGA tiene relativamente poca memoria interna.
constant NUM_BITS_MEMORIA_INSTRUCCIONES: integer := 10;
constant NUM_BITS_MEMORIA_DATOS: integer := 10;
constant NUM_BITS_MEMORIA_VGA: integer := 6;
-- archivo desde donde se lee el programa a cargarse en la ROM. Se lee en tiempo de sintesis del hardware
constant filename : string := "extraño.txt";


-- tipos de datos de las memorias de instrucciones y datos del MIPS
-- definidas segun el tamaño indicado por las constantes definidas antes
type mem_instrucciones is array (0 to 2**NUM_BITS_MEMORIA_INSTRUCCIONES -1) of STD_LOGIC_VECTOR(31 downto 0);
type mem_datos is array (0 to 2**NUM_BITS_MEMORIA_DATOS -1) of STD_LOGIC_VECTOR(31 downto 0);
type mem_VGA is array (0 to 2**NUM_BITS_MEMORIA_VGA -1) of STD_LOGIC_VECTOR(31 downto 0);end general;

package body general is

 
end general;
