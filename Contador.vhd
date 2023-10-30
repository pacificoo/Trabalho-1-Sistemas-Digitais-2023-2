LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE IEEE.numeric_std.all;

ENTITY Contador IS -- Conta de 0 a 255 em binário
	GENERIC(t0 : INTEGER := 4000000); -- Variável usada para gerar uma dilatação de clock, dado que o clock da placa é extremamente rápido para nosso uso

	PORT (
		clk, reset: in std_logic;
  	   	q : out UNSIGNED (7 downto 0) := "00000000"  -- Saída
	);
END Contador;


ARCHITECTURE Dataflow OF Contador IS

SIGNAL contagem: UNSIGNED (7 DOWNTO 0) := "00000000";
BEGIN

	processo : process (clk, reset)
	VARIABLE t : INTEGER RANGE t0 DOWNTO 0 := 0;
	begin
		if (reset = '1') then -- Reseta o contador
			contagem <= "00000000";

		elsif rising_edge(clk) then 
			if (t <= t0) then -- Gera a dilatação do clock
				t := t + 1;
			else
				contagem <= contagem + 1 -- Realiza a contagem
			end if;
		end if;

	
	end process;

	
	q <= contagem; -- Atribui à saída o valor da contagem

END Dataflow;
