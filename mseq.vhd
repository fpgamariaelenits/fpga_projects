library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
library lpm;
use lpm.lpm_components.all;
use work.mseqlib.all;

entity mseq is
port(ir: in std_logic_vector(3 downto 0);
     clock, reset: in std_logic ;
     z: in std_logic ;
     code: buffer std_logic_vector(35 downto 0);
     mOPs: out std_logic_vector(26 downto 0));
end mseq;

architecture arc of mseq is
signal f1,f2,f3,addr: std_logic_vector(5 downto 0);
signal cond: std_logic_vector(1 downto 0);
signal f4,ld,inc: std_logic;
signal notz: std_logic;
signal S0,s1: std_logic;

begin 
f3 <= f2 + "000001";
notz <= not (z);
s0 <= not f4;
cond <= code(35)&code(34);
addr <= code(5)&code(4)&code(3)&code(2)&code(1)&code(0);

mux1: mux4in1 port map("000000",ir & "00",addr,f3,s0 & s1,f1);
mux2: mux4in12 port map('1',z,notz,'0',cond,f4);
reg: regnbit generic map(n => 6) port map(f1,clock,reset,ld,inc,f2);
rom: mseg_rom port map(f2,clock,code);

end arc;
