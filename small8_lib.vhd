library ieee;
use ieee.std_logic_1164.all;

package small8_lib is	
	constant width		:		positive := 8;
--ALU CONSTANTS-----------------------------------------------------------------------------
	constant alu_width		:		positive := 8;
    constant F_ADCR			: 		std_logic_vector(3 downto 0) := "0001";	-- Add with carry
    constant F_SBCR      	: 		std_logic_vector(3 downto 0) := "0010";	-- Subtract with borrow
    constant F_ANDR      	: 		std_logic_vector(3 downto 0) := "0011";	-- AND
    constant F_ORR       	: 		std_logic_vector(3 downto 0) := "0100";	-- OR
    constant F_XORR      	: 		std_logic_vector(3 downto 0) := "0101";	-- XOR
    constant F_SLRL      	: 		std_logic_vector(3 downto 0) := "0110";	-- Logical shift left
    constant F_SRRL      	: 		std_logic_vector(3 downto 0) := "0111";	-- Logical shift right
    constant F_ROLC		 	: 		std_logic_vector(3 downto 0) := "1000";	-- Rotate right with carry
    constant F_SETC      	: 		std_logic_vector(3 downto 0) := "1001";	-- Set carry flag
	constant F_CLRC      	: 		std_logic_vector(3 downto 0) := "1010";	-- Clear carry flag
	constant F_MULT      	: 		std_logic_vector(3 downto 0) := "1011";	-- Multiply Operation
	
	
	
END small8_lib;