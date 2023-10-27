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

	process(a)
	begin
		for i in 0 to 3 loop -- Verifica para posição dos vetores a e b se ambos os valores são 1
			s(i) <= a(i) AND b(i);
		end loop;
	end process;

END Dataflow;
