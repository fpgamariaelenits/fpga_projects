LIBRARY ieee;
USE ieee.std_logic_1164.all;
ENTITY adder1bit IS
PORT (A, B: IN STD_LOGIC;
Ci: IN STD_LOGIC;
S: OUT STD_LOGIC;
Co: OUT STD_LOGIC);
END adder1bit;
------------------------------------------------
ARCHITECTURE adder_rtl OF adder1bit IS
SIGNAL xor_out, and1_out, and2_out : STD_LOGIC; -- δήλωση των εσωτερικών σημάτων
BEGIN
xor_out <= A XOR B; -- Περιγραφή του εσωτερικού σήματος xor_out
and1_out <= A AND B; -- Περιγραφή του εσωτερικού σήματος and1_out
and2_out <= Ci AND xor_out; -- Περιγραφή του εσωτερικού σήματος and2_out
S <= xor_out XOR Ci; -- Περιγραφή της εξόδου του αθροίσματος S
Co <= and1_out OR and2_out; -- Περιγραφή του κρατούμενου εξόδου Co
END adder_rtl;