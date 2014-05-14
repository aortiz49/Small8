library ieee; 
use ieee.std_logic_1164.all; 
use ieee.numeric_std.all; 
use work.small8_lib.all;

entity alu is 

	port ( 
		A,D 			: in std_logic_vector(alu_width-1 downto 0);	-- Accumulator reg and Data reg
       		sel 			: in std_logic_vector(3 downto 0);	-- select line
	   	C			: in std_logic;	-- Carry-in 
		c_out,v_out,s_out,z_out	: out std_logic;	-- status signals
		output 			: out std_logic_vector(alu_width-1 downto 0)	--output 
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
			if(C = '1') then 
				temp_sum := signed('0'&A)+signed('0'&D)+1;
			else 
				temp_sum := signed('0'&A)+signed('0'&D);
			end if;
			 
				temp 		:= temp_sum(alu_width-1 downto 0);
				c_out 	<= temp_sum(alu_width);                        
				v_out 	<= temp_sum(alu_width) xor A(alu_width-1) xor D(alu_width-1)xor temp_sum(alu_width-1); 			
				s_out 	<= temp(alu_width-1);
				
				if(temp = 0) then	
					z_out <= '1';
			   	else	
					z_out <= '0';
				end if;
------------------------------------------------------------------------------------------------------        
      		when F_SBCR =>	
			temp_sum := signed('0'&A)+signed(not('0'&D))+1;
			temp 	:= temp_sum(alu_width-1 downto 0);
			c_out 	<= temp_sum(alu_width);                        
			v_out 	<= temp_sum(alu_width) xor A(alu_width-1) xor D(alu_width-1)xor temp_sum(alu_width-1); 			
			s_out 	<= temp(alu_width-1);

			if(temp = 0) then	
				z_out <= '1';
			else	
				z_out <= '0';
			end if;
------------------------------------------------------------------------------------------------------ 			
		when F_ANDR =>
			temp := signed(A and D);

			if(temp = 0) then	
				z_out <= '1';
			else
				z_out <= '0';
			end if;
			s_out 	<= temp(alu_width-1);
------------------------------------------------------------------------------------------------------ 	
		when F_ORR =>
			temp := signed(A or D);

			if(temp = 0) then	
				z_out <= '1';
			else
				z_out <= '0';
			end if;
			s_out 	<= temp(alu_width-1);
------------------------------------------------------------------------------------------------------
		when F_XORR =>
			temp := signed(A xor D);

			if(temp = 0) then	
				z_out <= '1';
			else
				z_out <= '0';
			end if;
			s_out 	<= temp(alu_width-1);
------------------------------------------------------------------------------------------------------
		when F_SLRL =>
			temp 		:= SHIFT_LEFT(signed(A), 1);
			temp(0)  := '0';
			c_out <= A(alu_width-1);

			if(temp = 0) then	
				z_out <= '1';
			else
				z_out <= '0';
			end if;
			s_out 	<= temp(alu_width-1);
------------------------------------------------------------------------------------------------------
		when F_SRRL =>
				temp 		:= SHIFT_RIGHT(signed(A), 1);
				temp(7)  := '0';
				c_out <= A(0);
				if(temp = 0) then	
					z_out <= '1';
				else
					z_out <= '0';
				end if;
				s_out 	<= temp(alu_width-1);
------------------------------------------------------------------------------------------------------
		when F_ROLC =>
				temp 		:= SHIFT_LEFT(signed(A), 1);
				temp(0)  := C;
				c_out <= A(7);
				if(temp = 0) then	
					z_out <= '1';
				else
					z_out <= '0';
				end if;
				s_out 	<= temp(alu_width-1);
------------------------------------------------------------------------------------------------------			
		when F_RORC =>
				temp 		:= SHIFT_RIGHT(signed(A), 1);
				temp(7)  := C;
				c_out <= A(0);
				if(temp = 0) then	
					z_out <= '1';
				else
					z_out <= '0';
				end if;
				s_out 	<= temp(alu_width-1);
------------------------------------------------------------------------------------------------------	

 		when others =>                                          -- Output is '0' and overflow is '0' for unused select values
            temp := (others=>'0');                              -- takes care of inferred latch warning

			     
    end case;
	 
	
    output <= std_logic_vector(temp);
	
  end process;
end behavior;

