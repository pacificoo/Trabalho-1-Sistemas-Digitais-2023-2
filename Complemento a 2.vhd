LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY Complemento_a_2 IS -- Realiza o complemento a 2 da entrada a
  PORT (
    a        : IN  std_logic_vector(3 DOWNTO 0); -- Operando
    s        : OUT std_logic_vector(3 DOWNTO 0) -- Saída
    );
END Complemento_a_2;

--------------------------------------------------------------------------------
--Complete your VHDL description below
--------------------------------------------------------------------------------

ARCHITECTURE Structural OF Complemento_a_2 IS

	component Inversor is -- Usa a entidade Inversor
	PORT (a: in std_logic_vector (3 downto 0);
    		s: out std_logic_vector (3 downto 0));
	end component; 

	component Incremento is --Usa a entidade Incremento
	PORT (a: in std_logic_vector (3 downto 0);
    		s: out std_logic_vector (3 downto 0);
    		carry_out      : OUT  std_logic);
	end component;

	signal temp:	std_logic_vector(3 downto 0);
	signal tempx:  std_logic;

BEGIN

	-- Primeiro inverte o valor dos bits de entrada
	inv: Inversor PORT MAP(
	a => a,
	s => temp
	);

	-- Soma 1 ao binário invertido
	inc: Incremento PORT MAP(
	a => temp,
	s => s,
	carry_out => tempx
	);

END Structural;

