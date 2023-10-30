LIBRARY ieee;
USE ieee.std_logic_1164.all;

-- Unidade lógica aritmética que reúne as seguintes operações:
--	k = 000 => soma
--	k = 001 => Inversor
--	k = 010 => Incremento
--	k = 011 => Subtração
--	k = 100 => Complemento a 2
--	k = 101 => Paridade
--	k = 110 => Porta and bit a bit
--	k = 111 => Deslocador para a direita

ENTITY ULA IS 
  PORT (
	k: in std_logic_vector(2 downto 0); -- Entrada para seleção do operador
	a: in std_logic_vector(3 downto 0); -- Operando a
	b: in std_logic_vector(3 downto 0); -- Operando b
	carry_in: in std_logic;

	s: out std_logic_vector(3 downto 0); -- Saída
	overflow, zero, sinal: out std_logic -- zero == '1' quando s == "0000" e sinal == '1' para indicar que a saída é negativa
    );
END ULA;


ARCHITECTURE Structural OF ULA IS

component Somador is
	PORT (a: IN  std_logic_vector(3 downto 0);
    		b: IN  std_logic_vector(3 downto 0);
    		carry_in: IN  std_logic;

    		s: OUT  std_logic_vector(3 downto 0);
    		carry_out: OUT  std_logic);
	end component;

component Inversor is
	PORT (a: in std_logic_vector (3 downto 0);
    		s: out std_logic_vector (3 downto 0));
	end component;

component Incremento is
	PORT (a: in std_logic_vector (3 downto 0);
    		s: out std_logic_vector (3 downto 0);
    		carry_out      : OUT  std_logic);
	end component;

component Subtrair is
	PORT (a        	: IN  std_logic_vector(3 DOWNTO 0);      
    		 b        	: IN std_logic_vector(3 DOWNTO 0);
    		 carry_in      : IN  std_logic;
      	 s		    	: OUT std_logic_vector(3 DOWNTO 0);
    		 sinal      	: OUT  std_logic);
	end component;

component Complemento_a_2 is
	PORT (a: in std_logic_vector (3 downto 0);
    		s: out std_logic_vector (3 downto 0));
	end component;

component Paridade is
	PORT (a: in std_logic_vector (3 downto 0);
    		s: out std_logic_vector (3 downto 0));
	end component;

component And_port is
	PORT (a: in std_logic_vector (3 downto 0);
		b: in std_logic_vector (3 downto 0);
    		s: out std_logic_vector (3 downto 0));
	end component;

component ShiftRight is
	PORT (a: in std_logic_vector (3 downto 0);
    		s: out std_logic_vector (3 downto 0));
	end component;


signal 	x_s0, x_s1, x_s2, x_s3, x_s4, x_s5, x_s6, x_s7, temp_s	:std_logic_vector(3 downto 0);

signal	x_sinal, x_carryout0, x_carryout1	:std_logic;	


BEGIN

	som: Somador PORT MAP(
		a => a,
		b => b,
		carry_in => carry_in,
		s => x_s0,
		carry_out => x_carryout0
	);
	
	inv: Inversor PORT MAP(
		a => a,
		s => x_s1
	);

	inc: Incremento PORT MAP(
		a => a,
		s => x_s2,
		carry_out => x_carryout1
	);

	sub: Subtrair PORT MAP(
		a => a,
		b => b,
		carry_in => carry_in,
		s => x_s3,
		sinal => x_sinal
	);

	com: Complemento_a_2 PORT MAP(
		a => a,
		s => x_s4
	);

	par: Paridade PORT MAP(
		a => a,
		s => x_s5
	);

	an: And_port PORT MAP(
		a => a,
		b => b,
		s => x_s6
	);

	shi: ShiftRight PORT MAP(
		a => a,
		s => x_s7
	);

	-- Atribuição de saída dada a operação escolhida
	temp_s <= x_s0 WHEN (k = "000") ELSE
			x_s1 WHEN (k = "001") ELSE
			x_s2 WHEN (k = "010") ELSE
			x_s3 WHEN (k = "011") ELSE
			x_s4 WHEN (k = "100") ELSE
			x_s5 WHEN (k = "101") ELSE
			x_s6 WHEN (k = "110") ELSE
			x_s7 WHEN (k = "111");

	s <= temp_s;

	-- Atribui '1' à saída sinal caso a saída s é negativa
	sinal <= 	x_sinal WHEN (k = "011") ELSE
				NOT(carry_in) WHEN (k = "100") ELSE
				'0';

	-- Decide se houve overflow nas operações de soma e incremento
	overflow <= x_carryout0 WHEN (k = "000") ELSE
				x_carryout1 WHEN (k = "010") ELSE
				'0';

	-- Verifica se a saída é "0000"
	zero <= NOT(temp_s(0) OR temp_s(1) OR temp_s(2) OR temp_s(3));

	

END Structural;
