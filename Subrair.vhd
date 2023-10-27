LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY Subtrair IS -- Realiza a operação a - b. Sinal é 1 se o resultado é um negativo e 0 caso positivo.
  PORT (
    a        		: IN  std_logic_vector(3 DOWNTO 0);      
    b        		: IN std_logic_vector(3 DOWNTO 0);

    carry_in      	: IN  std_logic;
   
    s		    	: OUT std_logic_vector(3 DOWNTO 0);
    sinal      	: OUT  std_logic
    );
END Subtrair;

ARCHITECTURE Behavioral OF Subtrair IS

component Complemento_a_2 is 
	PORT (a: in std_logic_vector (3 downto 0);
    		s: out std_logic_vector (3 downto 0));
	end component;

component Somador is
	PORT (a: IN  std_logic_vector(3 downto 0);
    		b: IN  std_logic_vector(3 downto 0);
    		carry_in: IN  std_logic;

    		s: OUT  std_logic_vector(3 downto 0);
    		carry_out: OUT  std_logic);
	end component;


signal comp_b: std_logic_vector(3 downto 0);
signal temp1, temp2: std_logic_vector(3 downto 0);
signal x, y :std_logic;

BEGIN

	-- Transforma 'b' em negativo por complemento a 2
	comp: Complemento_a_2 PORT MAP(
	a => b,
	s => comp_b
	);

	-- Soma 'a' e '-b'
	som: Somador PORT MAP(
	a => a,
	b => comp_b,
	carry_in => '0',
	s => temp1,
	carry_out => x
	)

	-- Converte o resultado da soma anterior em positivo, caso o resultado seja negativo, para que a representação de saída seja em sinal-magnitude
	comp_2: Complemento_a_2 PORT MAP(
	a => temp1,
	s => temp2
	);


	y <= not(x);
	sinal <= y;

	s <= temp1 WHEN y = '0' ELSE
	temp2 WHEN y = '1';

END Behavioral;
