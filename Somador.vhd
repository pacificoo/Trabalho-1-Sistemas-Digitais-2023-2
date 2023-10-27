LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY Somador IS -- Soma as entradas a e b
  PORT (
    a      : IN  std_logic_vector(3 downto 0); -- Operando a
    b      : IN  std_logic_vector(3 downto 0); -- Operando b
    carry_in      : IN  std_logic;

    s      : OUT  std_logic_vector(3 downto 0); -- Saída
    carry_out      : OUT  std_logic
    );
END Somador;

ARCHITECTURE Behavioral OF Somador IS

signal temp1: std_logic;
signal temp2: std_logic;
signal temp3: std_logic;

BEGIN 
        s(0) <= (a(0) XOR b(0)) XOR carry_in;
        temp1 <= (a(0) AND b(0)) OR ((a(0) XOR b(0)) AND carry_in);
            
        s(1) <= (a(1) XOR b(1)) XOR temp1;
        temp2 <= (a(1) AND b(1)) OR ((a(1) XOR b(1)) AND temp1);
            
        s(2) <= (a(2) XOR b(2)) XOR temp2;
        temp3 <= (a(2) AND b(2)) OR ((a(2) XOR b(2)) AND temp2);
            
        s(3) <= (a(3) XOR b(3)) XOR temp3;
            
        carry_out <= (a(3) AND b(3)) OR ((a(3) XOR b(3)) AND temp3);


END Behavioral;
