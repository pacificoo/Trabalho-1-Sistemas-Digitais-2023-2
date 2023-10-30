LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY Integrador IS -- Entidade usada para Integrar a ULA e o contador, usado para testar as entradas da ULA
  PORT (
    k: in std_logic_vector(2 downto 0); -- Operador
	a: in std_logic_vector(3 downto 0); -- Operando a
	b: in std_logic_vector(3 downto 0); -- Operando b
	carry_in: in std_logic;
	clk, reset: in std_logic;

	s: out std_logic_vector(3 downto 0); -- Saída
	overflow, zero, sinal, carry_out: out std_logic

    );
END Integrador;


ARCHITECTURE Structural OF Integrador IS

	component Contador is
		PORT (clk, reset: in std_logic;
  	   		q : out STD_LOGIC_VECTOR(7 downto 0) := "00000000"); -- Saída
		end component;

	component ULA is
		PORT (k: in std_logic_vector(2 downto 0); -- Entrada para seleção do operador
			a: in std_logic_vector(3 downto 0); -- Operando a
			b: in std_logic_vector(3 downto 0); -- Operando b
			carry_in: in std_logic;

			s: out std_logic_vector(3 downto 0); -- Saída
			overflow, zero, sinal, carry_out: OUT STD_LOGIC);
		end component;

SIGNAL temp_q: STD_LOGIC_VECTOR(7 DOWNTO 0); -- Guarda o valor da saída do contador

BEGIN

	cont: Contador PORT MAP(
		clk => clk,
		reset => reset,
		q => temp_q
		
	);

	ul: ULA PORT MAP( -- Associa as entradas a e b à primeira e segunda metade do vetor de saída do contador, respectivamente
		k => k,
		a => temp_q(7 DOWNTO 4),
		b => temp_q (3 DOWNTO 0),
		carry_in => carry_in,
		s => s,
		carry_out => x_carry_out,
		overflow => overflow
	);


END Structural;
