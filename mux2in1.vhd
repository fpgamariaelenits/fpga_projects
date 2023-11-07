library ieee;
use ieee.std_logic_1164.all;

entity mux2in1 is
		port(input0,input1: std_logic_vector(0 to 63);
		sel: std_logic;
		output:out std_logic_vector(0 to 63));
		end  mux2in1;

architecture behavioral of mux2in1 is
	begin
	process(input0,input1,sel) is
	begin
		case sel is
			when '0' =>
				output <= input0;	
			when others =>
				output <= input1;
				end case;
	end process;

	end  behavioral;