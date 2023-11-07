library ieee;
use ieee.std_logic_1164.all;

entity mux4in1 is
		port(input0,input1,input2,input3: std_logic_vector(0 to 63);
		sel: std_logic;
		output:out std_logic_vector(0 to 63));
		end  mux2in1;

architecture behavioral of mux4in1 is
	begin
	process(input0,input1,input2,input3,sel) is
	begin
		case sel is
			when '00' =>
				output <= input0;	
			when '01' =>
				output <= input1;
			when '10' =>
				output <= input2;
			when others =>
				output <= input3;
			end case;
	end process;

	end  behavioral;