library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

package alulib is

component mux2in1 is
		port(input0,input1: std_logic_vector(0 to 7);
		sel: std_logic;
		output:out std_logic_vector(0 to 7));
		end component;

component mux4in1 is
		port(input0,input1,input2,input3: std_logic_vector(0 to 7);
		sel: std_logic;
		output:out std_logic_vector(0 to 7));
		end  component;
		
component adder8bit is
      port (a, b: in std_logic_vector(7 downto 0);
      ci: in std_logic;
      s: out std_logic_vector(7 downto 0));
      end component; 

end package alulib;