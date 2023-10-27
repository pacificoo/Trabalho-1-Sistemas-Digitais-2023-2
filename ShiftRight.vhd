library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity ShiftRight is -- Desloca todos os bits da entrada a para a direita. O novo bit mais significativo é '0'.
    Port (
        a : in STD_LOGIC_VECTOR (3 downto 0); -- Operando
        s : out STD_LOGIC_VECTOR (3 downto 0) -- Saída
    );
end ShiftRight;

architecture Dataflow of ShiftRight is
begin
     -- Realiza o shift right
     s(0) <= a(1);
     s(1) <= a(2);
     s(2) <= a(3);
     s(3) <= '0';
end Dataflow;