library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
package mseqlib is

component mux4in1 is
		port(input0,input1,input2,input3: std_logic_vector(0 to 5);
		sel: std_logic_vector(0 to 1);
		output:out std_logic_vector(0 to 5));
		end  component;
		
component mux4in12 is
		port(input0,input1,input2,input3: std_logic;
		sel: std_logic_vector(0 to 1);
		output:out std_logic);
		end  component;
		
component regnbit is
		generic (n: integer :=8);
		port( din : in std_logic_vector(n-1 downto 0);
		clk,rst,ld : in std_logic;
		inc : in std_logic;
		dout : out std_logic_vector(n-1 downto 0));
      end component; 
		
component mseg_rom is
		port (address: in std_logic_vector(5 downto 0);
		clock: in std_logic:= '1';
		q: out std_logic_vector(35 downto 0));
		end component;

end package mseqlib;