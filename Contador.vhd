LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE IEEE.numeric_std.all;

ENTITY Contador IS
	GENERIC(t0 : INTEGER := 4000000);

	PORT (
		clk, reset: in std_logic;
  	   	s : out UNSIGNED (7 downto 0) := "00000000"
	);
END Contador;


ARCHITECTURE Dataflow OF Contador IS

SIGNAL contagem: UNSIGNED (7 DOWNTO 0) := "00000000";
BEGIN

	processo : process (clk, reset)
	VARIABLE t : INTEGER RANGE t0 DOWNTO 0 := 0;
	begin
		if (reset = '1') then
			contagem <= "00000000";

		elsif rising_edge(clk) then
			if (t <= t0) then
				t := t + 1;
			else
				contagem <= contagem + 1 
			end if;
		end if;

	
	end process;

	
	s <= contagem;

END Dataflow;
