library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;
use work.alulib.all;

entity alu is
generic (n : integer := 8);
port ( ac : in std_logic_vector(n-1 downto 0);
 db : in std_logic_vector(n-1 downto 0);
 alus : in std_logic_vector(7 downto 1);
 dout : out std_logic_vector(n-1 downto 0));
end alu ;

architecture arch of alu is
signal f1,f2,f3,f4 : std_logic_vector(n-1 downto 0);
signal zero,notdb : std_logic_vector(n-1 downto 0);
signal ANDout,ORout,XORout,NOTout : std_logic_vector(n-1 downto 0);
signal zero1,notdb1 : std_logic_vector(1 downto 0);

begin
zero1(0)<=alus(2);
zero <= (others=>'0');
ANDout <= ac AND db ;
ORout <= ac OR db ;
XORout <= ac XOR db;
NOTout <= NOT (ac) ;
notdb <= NOT (db) ;

MUX_1: mux2in1 port map(ZERO,ac,alus(1),f1);
MUX_2: mux4in1 port map(ZERO,db,NOTDB,ZERO,zero1(0) & alus(3),f2);
MUX_3: mux4in1 port map(ANDout,ORout,XORout,NOTout,alus(5) & alus(6),f4);
PADDR: adder8bit port map(f1,f2,alus(4),f3);
MUX_4: mux2in1 port map(f3,f4,alus(7),dout);

end arch;