library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

------------------------------------------------------------------
-- Decodificador BCD -> 7 segmentos (ativo em 0, ordem gfedcba)
-- Códigos 10 a 15 apagam todos os segmentos
------------------------------------------------------------------
entity decodificador_7seg is
    port (
        bcd : in  std_logic_vector(3 downto 0);
        seg : out std_logic_vector(6 downto 0)
    );
end entity;

architecture rtl of decodificador_7seg is
begin
    with bcd select
        seg <= "1000000" when "0000",  -- 0
               "1111001" when "0001",  -- 1
               "0100100" when "0010",  -- 2
               "0110000" when "0011",  -- 3
               "0011001" when "0100",  -- 4
               "0010010" when "0101",  -- 5
               "0000010" when "0110",  -- 6
               "1111000" when "0111",  -- 7
               "0000000" when "1000",  -- 8
               "0010000" when "1001",  -- 9
               "1111111" when others;  -- 10..15 apagado
end architecture;

------------------------------------------------------------------
-- Controlador da esteira
------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity controlador_esteira is
    generic (
        C        : integer := 30;          -- Capacidade (20 <= C <= 79)
        L        : integer := 25;          -- Limiar de alerta (1 <= L < C)
        F        : integer := 1;           -- Frequência em Hz (1, 2 ou 5)
        CLK_FREQ : integer := 50_000_000;  -- 50 MHz
        H_SIM    : integer := 0            -- 0 = valor real; >= 2 = simulação reduzida
    );
    port (
        clk_50   : in  std_logic;
        rst      : in  std_logic;                     -- ativo em 1, assíncrono
        sentido  : in  std_logic;                     -- 0: colocar; 1: retirar
        pausa    : in  std_logic;
        modo     : in  std_logic_vector(1 downto 0);

        led_cheio  : out std_logic;
        led_vazio  : out std_logic;
        led_alerta : out std_logic;
        led_erro   : out std_logic;
        led_div    : out std_logic;

        display1 : out std_logic_vector(6 downto 0);  -- Dezena
        display0 : out std_logic_vector(6 downto 0)   -- Unidade
    );
end entity;

architecture rtl of controlador_esteira is

    -- H = ciclos de clk_50 por semiciclo = CLK_FREQ / (2*F)
    -- F=1 -> 25.000.000 | F=2 -> 12.500.000 | F=5 -> 5.000.000
    function calc_h(h_sim, clk_freq, f : integer) return integer is
    begin
        if h_sim = 0 then
            return clk_freq / (2 * f);
        else
            return h_sim;
        end if;
    end function;

    constant H : integer := calc_h(H_SIM, CLK_FREQ, F);

    -- 1. Divisor
    signal cont_div     : integer range 0 to H - 1 := 0;
    signal sinal_div    : std_logic := '0';
    signal pulso_avanco : std_logic := '0';

    -- 2. Núcleo
    signal N    : integer range 0 to 99 := 0;
    signal P    : integer range 0 to 99 := 0;
    signal erro : std_logic := '0';

    -- 4. Seletor (duas versões equivalentes)
    signal val_when : integer range 0 to 99;
    signal val_with : integer range 0 to 99;
    signal val_exibicao : integer range 0 to 99;

    -- 5. BCD
    signal bcd_dez, bcd_uni : std_logic_vector(3 downto 0);

begin

    ------------------------------------------------------------------
    -- 1. DIVISOR DE FREQUÊNCIA
    -- Contador síncrono + comparador (cont = H-1) + FF T (sinal_div)
    -- pulso_avanco é um FF D: sobe junto com a borda de subida de
    -- sinal_div e dura 1 ciclo de clk_50.
    -- pausa = 1: contador, sinal_div e pulso voltam ao estado inicial.
    ------------------------------------------------------------------
    process(clk_50, rst)
    begin
        if rst = '1' then
            cont_div     <= 0;
            sinal_div    <= '0';
            pulso_avanco <= '0';
        elsif rising_edge(clk_50) then
            pulso_avanco <= '0';                      -- padrão: 1 ciclo apenas

            if pausa = '1' then
                cont_div  <= 0;
                sinal_div <= '0';
            elsif cont_div = H - 1 then
                cont_div  <= 0;
                sinal_div <= not sinal_div;           -- FF T
                if sinal_div = '0' then               -- vai subir agora
                    pulso_avanco <= '1';
                end if;
            else
                cont_div <= cont_div + 1;
            end if;
        end if;
    end process;

    led_div <= sinal_div;

    ------------------------------------------------------------------
    -- 2. NÚCLEO SEQUENCIAL (N, P e erro)
    -- Latência: N atualiza 1 ciclo de clk_50 (20 ns) após a borda de
    -- subida de sinal_div, pois pulso_avanco é registrado.
    ------------------------------------------------------------------
    process(clk_50, rst)
    begin
        if rst = '1' then
            N    <= 0;
            P    <= 0;
            erro <= '0';
        elsif rising_edge(clk_50) then
            if pausa = '0' and pulso_avanco = '1' then
                if sentido = '0' then                 -- colocar
                    if N < C then
                        N <= N + 1;
                        if N + 1 > P then
                            P <= N + 1;
                        end if;
                    else
                        erro <= '1';
                    end if;
                else                                  -- retirar
                    if N > 0 then
                        N <= N - 1;
                    else
                        erro <= '1';
                    end if;
                end if;
            end if;
        end if;
    end process;

    ------------------------------------------------------------------
    -- 3. INDICADORES (combinacional)
    ------------------------------------------------------------------
    led_cheio  <= '1' when N = C else '0';
    led_vazio  <= '1' when N = 0 else '0';
    led_alerta <= '1' when N >= L else '0';
    led_erro   <= erro;

    ------------------------------------------------------------------
    -- 4. SELETOR DE EXIBIÇÃO (duas versões equivalentes)
    -- 00: N | 01: C - N | 10: P | 11: C
    ------------------------------------------------------------------
    -- Versão A: when ... else
    val_when <= N     when modo = "00" else
                C - N when modo = "01" else
                P     when modo = "10" else
                C;

    -- Versão B: with ... select
    with modo select
        val_with <= N     when "00",
                    C - N when "01",
                    P     when "10",
                    C     when others;

    -- Versão integrada na FPGA (troque por val_when para testar a outra)
    val_exibicao <= val_with;

    -- Verificação de equivalência (apenas simulação)
    assert val_when = val_with
        report "Seletores diferentes!" severity error;

    ------------------------------------------------------------------
    -- 5. CONVERSÃO BCD E DECODIFICAÇÃO
    ------------------------------------------------------------------
    bcd_dez <= std_logic_vector(to_unsigned(val_exibicao / 10,  4));
    bcd_uni <= std_logic_vector(to_unsigned(val_exibicao mod 10, 4));

    DEC_DEZ : entity work.decodificador_7seg port map (bcd => bcd_dez, seg => display1);
    DEC_UNI : entity work.decodificador_7seg port map (bcd => bcd_uni, seg => display0);

end architecture;