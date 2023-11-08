library ieee;
use ieee.std_logic_1164.all;
entity adder8bit is
port (a, b: in std_logic_vector(7 downto 0);
ci: in std_logic;
s: out std_logic_vector(7 downto 0));
end adder8bit;
------------------------------------------------
architecture structural of adder8bit is
component adder1bit
port(a, b: in std_logic;
ci: in std_logic;
s: out std_logic;
co: out std_logic);
end component;
signal c: std_logic_vector(7 downto 0);
begin 
block1: adder1bit port map(a(0), b(0), ci, s(0), c(0));
p1: for i in 1 to 7 generate
block2: adder1bit port map(a(i),b(i), c(i-1), s(i),c(i));
end generate;
end structural;