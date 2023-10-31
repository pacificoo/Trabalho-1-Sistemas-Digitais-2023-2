LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY And_port IS -- Porta And posição a posição entre as entradas a e b
  PORT (
		a        : IN  std_logic_vector(3 DOWNTO 0); -- Operando a
		b        : IN  std_logic_vector(3 DOWNTO 0); -- Operando b
		s        : OUT  std_logic_vector(3 DOWNTO 0) -- Saída
    );
END And_port;

--------------------------------------------------------------------------------
--Complete your VHDL description below
--------------------------------------------------------------------------------

ARCHITECTURE Dataflow OF And_port IS

BEGIN

	s(0) <= a(0) AND b(0);
	s(1) <= a(1) AND b(1);
	s(2) <= a(2) AND b(2);
	s(3) <= a(3) AND b(3);

END Dataflow;
