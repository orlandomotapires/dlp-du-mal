library ieee;
use ieee.std_logic_1164.all;
 
entity lista_1_questao_1_a is
    port (
        A, B, C : in  std_logic;
        D, E, F : out std_logic
    );
end entity lista_1_questao_1_a;
 
architecture dataflow of lista_1_questao_1_a is
    signal nB  : std_logic;  -- inversor de B
    signal nnB : std_logic;  -- inversor no meio do desenho (entrada = nB)
    signal nC  : std_logic;  -- inversor de C
    signal g1  : std_logic;  -- NOR superior      (A, nB)
    signal g2  : std_logic;  -- NAND do meio      (nB, nC)
    signal g3  : std_logic;  -- AND inferior     (nB, nC)
begin
    nB  <= not B;
    nnB <= not nB;
    nC  <= not C;
 
    g1  <= not (A or nB);
    g2  <= not (nB and nC);
    g3  <= not (nB and nC);
 
    D <= g1 xor (not g2);    -- XOR com bolha na entrada inferior
    E <= g2 or  (not nnB);   -- OR com bolha na entrada inferior
    F <= g2 xor g3;          -- XOR
end architecture dataflow;