LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY Incremento IS -- Soma 1 ao binário da entrada a
  PORT (
    a       : IN  std_logic_vector(3 downto 0); -- Operando
    s       : OUT  std_logic_vector(3 downto 0); -- Saída

    carry_out      : OUT  std_logic
    );

END Incremento;

--------------------------------------------------------------------------------
--Complete your VHDL description below
--------------------------------------------------------------------------------

ARCHITECTURE Behavioral OF Incremento IS

signal temp1: std_logic;
signal temp2: std_logic;
signal temp3: std_logic;

BEGIN -- Realiza a soma (a + 0001)

	s(0) <= NOT a(0);
	temp1 <= a(0);

	s(1) <= a(1) XOR temp1;
	temp2 <= a(1) AND temp1;

	s(2) <= a(2) XOR temp2;
	temp3 <= a(2) AND temp2;

	s(3) <= a(3) XOR temp3;
	carry_out <= a(3) AND temp3;


END Behavioral;
