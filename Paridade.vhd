LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY Paridade IS -- Verifica se o binário da entrada a é par. A saída será 1111 caso seja par e 0000 caso contrário
  PORT (
    a        : IN  std_logic_vector(3 DOWNTO 0); -- Operador
    s        : OUT std_logic -- Saída
    );
END Paridade;

ARCHITECTURE Dataflow OF Paridade IS

BEGIN

	s <= not(a(0)) -- 'a' é par se o bit menos significativo é 0

END Dataflow;
