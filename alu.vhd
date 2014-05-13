library ieee; 
use ieee.std_logic_1164.all; 
use ieee.numeric_std.all; 
use work.small8_lib.all;

entity alu is 

   port ( 
		A,D 								: in std_logic_vector(alu_width-1 downto 0);	-- Accumulator reg and Data reg
       	sel 								: in std_logic_vector(3 downto 0);	-- select line
	   	C									: in std_logic;	-- Carry-in 
	    c_out,v_out,s_out,z_out				: out std_logic;	-- status signals
		output 								: out std_logic_vector(alu_width-1 downto 0)	--output 
    ); 
end alu; 

architecture behavior of alu is
begin

   process(A,D,C,sel)
   variable temp_sum : signed(alu_width downto 0);               -- Append bit to data width for sum w/carry operation
   variable temp     : signed(alu_width-1 downto 0);             -- Temp var for final result 
  
begin
	c_out <= '0';
	v_out <= '0';
	s_out <= '0';
	z_out <= '0';
	temp  := (others=> '0');

	case sel is
------------------------------------------------------------------------------------------------------
		when F_ADCR =>
		
------------------------------------------------------------------------------------------------------        
       when F_SBCR =>
			
------------------------------------------------------------------------------------------------------ 			
		when F_ANDR =>
			
------------------------------------------------------------------------------------------------------ 	
		when F_ORR =>
				
------------------------------------------------------------------------------------------------------
		when F_XORR =>
				
------------------------------------------------------------------------------------------------------
		when F_SLRL =>
				
------------------------------------------------------------------------------------------------------
	when F_SRRL =>
				
------------------------------------------------------------------------------------------------------
	when F_ROLC =>
				
------------------------------------------------------------------------------------------------------			
     when F_RORC =>
				
------------------------------------------------------------------------------------------------------	

 when others =>                                         
            null;

			     
    end case;
	 
	
    output <= std_logic_vector(temp);  -- Convert final value to std_logic_vector 
	
  end process;
end behavior;


