LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY Inversor IS -- Inverte os valores de cada posição da entrada a
  PORT (
    a: in std_logic_vector (3 downto 0); -- Operando
    s: out std_logic_vector (3 downto 0) -- Saída
    );
END Inversor;


ARCHITECTURE Dataflow OF Inversor IS

BEGIN

	process(a)
	begin 
		for i in 0 to 3 loop -- Percorre o vetor 'a' bit a bit
			s(i) <= NOT (a(i));
		end loop;
	end process;

END Dataflow;
