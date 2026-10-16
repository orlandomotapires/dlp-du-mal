library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

------------------------------------------------------------------
-- Testbench do controlador da esteira (testes 1 a 10 do PDF)
-- O teste 11 (FPGA com divisao real) nao e feito em simulacao.
--
-- Estrategia: caixa-preta. N, P e C_N sao lidos pelos proprios
-- displays, trocando o modo, o que tambem testa seletor e decodificador.
------------------------------------------------------------------
entity tb_controlador_esteira is
end entity;

architecture sim of tb_controlador_esteira is

    ----------------------------------------------------------------
    -- Parametros reduzidos (SO PARA SIMULACAO). Rode pelo menos com
    -- dois valores de H_T (ex.: 4 e 6) e anote o periodo medido.
    ----------------------------------------------------------------
    constant C_T   : integer := 12;   -- capacidade
    constant L_T   : integer := 10;   -- limiar de alerta
    constant H_T   : integer := 4;    -- ciclos de clk por semiciclo (>= 2)
    constant T_CLK : time    := 20 ns;

    signal clk     : std_logic := '0';
    signal rst     : std_logic := '1';
    signal sentido : std_logic := '0';
    signal pausa   : std_logic := '0';
    signal modo    : std_logic_vector(1 downto 0) := "00";

    signal led_cheio, led_vazio, led_alerta, led_erro, led_div : std_logic;
    signal display1, display0 : std_logic_vector(6 downto 0);

    -- Sinais do teste do decodificador isolado
    signal bcd_t : std_logic_vector(3 downto 0) := "0000";
    signal seg_t : std_logic_vector(6 downto 0);

    signal fim : boolean := false;

    ----------------------------------------------------------------
    -- Tabela dos 10 digitos (ativo em 0, ordem gfedcba)
    ----------------------------------------------------------------
    type tab_seg_t is array (0 to 9) of std_logic_vector(6 downto 0);
    constant TAB_SEG : tab_seg_t := (
        "1000000", "1111001", "0100100", "0110000", "0011001",
        "0010010", "0000010", "1111000", "0000000", "0010000");

    function seg_para_int(seg : std_logic_vector(6 downto 0)) return integer is
    begin
        for i in 0 to 9 loop
            if seg = TAB_SEG(i) then
                return i;
            end if;
        end loop;
        return -1;                       -- apagado ou invalido
    end function;

    function le_disp(d1, d0 : std_logic_vector(6 downto 0)) return integer is
        variable a, b : integer;
    begin
        a := seg_para_int(d1);
        b := seg_para_int(d0);
        if a < 0 or b < 0 then
            return -1;
        end if;
        return a * 10 + b;
    end function;

    function b2i(b : boolean) return integer is
    begin
        if b then return 1; else return 0; end if;
    end function;

    function s2i(s : std_logic) return integer is
    begin
        if s = '1' then return 1; else return 0; end if;
    end function;

begin

    ----------------------------------------------------------------
    -- DUT (nome da instancia: dut)
    ----------------------------------------------------------------
    dut : entity work.controlador_esteira
        generic map (C => C_T, L => L_T, F => 1, CLK_FREQ => 50_000_000, H_SIM => H_T)
        port map (
            clk_50 => clk, rst => rst, sentido => sentido, pausa => pausa, modo => modo,
            led_cheio => led_cheio, led_vazio => led_vazio, led_alerta => led_alerta,
            led_erro => led_erro, led_div => led_div,
            display1 => display1, display0 => display0);

    -- Decodificador isolado (teste 10)
    u_dec : entity work.decodificador_7seg
        port map (bcd => bcd_t, seg => seg_t);

    ----------------------------------------------------------------
    -- Clock de 50 MHz (periodo de 20 ns)
    ----------------------------------------------------------------
    clock : process
    begin
        while not fim loop
            clk <= '0'; wait for T_CLK / 2;
            clk <= '1'; wait for T_CLK / 2;
        end loop;
        wait;
    end process;

    ----------------------------------------------------------------
    -- Estimulos e verificacoes
    ----------------------------------------------------------------
    estimulos : process
        variable total, falhas : integer := 0;
        variable cnt : integer;
        variable t_r1, t_f1, t_r2, t_f2, t_r3, t_r4 : time;

        -- Compara inteiros
        procedure confere(obs, esp : integer; msg : string) is
        begin
            total := total + 1;
            if obs = esp then
                report "[OK]    " & msg & " = " & integer'image(obs);
            else
                falhas := falhas + 1;
                report "[FALHA] " & msg & " | esperado=" & integer'image(esp)
                       & " obtido=" & integer'image(obs) severity error;
            end if;
        end procedure;

        -- Compara tempos
        procedure confere(obs, esp : time; msg : string) is
        begin
            total := total + 1;
            if obs = esp then
                report "[OK]    " & msg & " = " & time'image(obs);
            else
                falhas := falhas + 1;
                report "[FALHA] " & msg & " | esperado=" & time'image(esp)
                       & " obtido=" & time'image(obs) severity error;
            end if;
        end procedure;

        -- Le N pelo display (modo "00")
        procedure confere_n(esp : integer; msg : string) is
        begin
            confere(le_disp(display1, display0), esp, msg);
        end procedure;

        -- Seleciona um modo, le o display e volta para "00"
        procedure confere_modo(m : std_logic_vector(1 downto 0); esp : integer; msg : string) is
        begin
            modo <= m;
            wait for 1 ns;
            confere(le_disp(display1, display0), esp, msg);
            modo <= "00";
            wait for 1 ns;
        end procedure;

        -- Reset assincrono por 2 clocks, solto na borda de descida
        procedure reseta is
        begin
            wait until falling_edge(clk);
            rst <= '1';
            wait until falling_edge(clk);
            wait until falling_edge(clk);
            rst <= '0';
        end procedure;

        -- Espera uma subida de sinal_div e deixa o N atualizar
        -- (pulso_avanco sobe junto; N muda 1 ciclo depois)
        procedure passo is
        begin
            wait until rising_edge(led_div);
            wait for T_CLK + 1 ns;
        end procedure;

        procedure passos(k : integer) is
        begin
            for j in 1 to k loop
                passo;
            end loop;
        end procedure;

        -- Conta bordas de clk ate sinal_div subir (espera-se H_T)
        procedure conta_ate_subida(variable res : out integer) is
            variable c : integer := 0;
        begin
            loop
                wait until rising_edge(clk);
                wait for 1 ns;
                c := c + 1;
                exit when led_div = '1' or c > 4 * H_T;
            end loop;
            res := c;
        end procedure;

    begin
        report "===== INICIO: C=" & integer'image(C_T) & " L=" & integer'image(L_T)
               & " H=" & integer'image(H_T) & " =====";

        --------------------------------------------------------------
        -- TESTE 1: DIVISOR
        --------------------------------------------------------------
        report "--- Teste 1: Divisor ---";
        reseta;
        conta_ate_subida(cnt);
        confere(cnt, H_T, "1 bordas de clk ate a 1a subida (semiciclo)");
        t_r1 := now - 1 ns;
        wait until falling_edge(led_div); t_f1 := now;
        wait until rising_edge(led_div);  t_r2 := now;
        wait until falling_edge(led_div); t_f2 := now;
        wait until rising_edge(led_div);  t_r3 := now;
        wait until rising_edge(led_div);  t_r4 := now;

        confere(t_f1 - t_r1, H_T * T_CLK,     "1 tempo em alto (1)");
        confere(t_r2 - t_f1, H_T * T_CLK,     "1 tempo em baixo (1)");
        confere(t_f2 - t_r2, H_T * T_CLK,     "1 tempo em alto (2)");
        confere(t_r3 - t_f2, H_T * T_CLK,     "1 tempo em baixo (2)");
        confere(t_r2 - t_r1, 2 * H_T * T_CLK, "1 periodo 1");
        confere(t_r3 - t_r2, 2 * H_T * T_CLK, "1 periodo 2");
        confere(t_r4 - t_r3, 2 * H_T * T_CLK, "1 periodo 3");

        --------------------------------------------------------------
        -- TESTE 2: INTEGRACAO (uma atualizacao por ciclo completo)
        --------------------------------------------------------------
        report "--- Teste 2: Integracao ---";
        reseta;
        sentido <= '0';
        for i in 1 to 4 loop
            passo;
            confere(s2i(led_div), 1, "2 sinal_div em alto apos a atualizacao");
            confere_n(i, "2 N apos a subida");
            wait until falling_edge(led_div);
            wait for 1 ns;
            confere_n(i, "2 N constante durante todo o nivel alto");
        end loop;

        --------------------------------------------------------------
        -- TESTE 3: RESET
        --------------------------------------------------------------
        report "--- Teste 3: Reset ---";
        -- deixa o estado "sujo": erro=1, N=2, P=2
        reseta;
        sentido <= '1';
        passo;
        confere_n(0, "3 N satura em 0");
        confere(s2i(led_erro), 1, "3 erro ativado (retirar em vazio)");
        sentido <= '0';
        passos(2);
        confere_n(2, "3 N antes do reset");
        confere_modo("10", 2, "3 P antes do reset");

        -- (a) reset assincrono entre bordas de clock
        wait until rising_edge(clk);
        wait for 5 ns;
        rst <= '1';
        wait for 1 ns;
        confere_n(0, "3a N zerado sem borda de clk");
        confere_modo("10", 0, "3a P zerado");
        confere(s2i(led_erro), 0, "3a erro zerado");
        confere(s2i(led_div), 0, "3a sinal_div zerado");
        wait until falling_edge(clk);
        wait until falling_edge(clk);
        rst <= '0';
        conta_ate_subida(cnt);
        confere(cnt, H_T, "3a fase do divisor reiniciada (bordas ate subir)");
        wait for T_CLK;
        confere_n(1, "3a primeiro avanco apos o reset");

        -- (b) reset junto de um avanco
        wait until rising_edge(led_div);
        wait for 5 ns;                   -- pulso_avanco esta ativo agora
        rst <= '1';
        wait for 2 * T_CLK;
        confere_n(0, "3b N zerado, avanco pendente descartado");
        confere_modo("10", 0, "3b P zerado");
        confere(s2i(led_div), 0, "3b sinal_div zerado");
        wait until falling_edge(clk);
        rst <= '0';

        --------------------------------------------------------------
        -- TESTE 4: CONTAGEM
        --------------------------------------------------------------
        report "--- Teste 4: Contagem ---";
        reseta;
        sentido <= '0';
        for i in 1 to 10 loop            -- inclui 09 -> 10
            passo;
            confere_n(i, "4 subindo, N");
        end loop;
        confere(s2i(led_erro), 0, "4 sem erro ate aqui");
        sentido <= '1';
        passo; confere_n(9, "4 10 -> 09");
        passo; confere_n(8, "4 descendo, N");
        -- troca de sentido entre avancos
        sentido <= '0';
        wait for 1 ns;
        confere_n(8, "4 trocar sentido nao altera N na hora");
        passo; confere_n(9, "4 sentido=0 -> 09");
        sentido <= '1';
        passo; confere_n(8, "4 sentido=1 -> 08");

        --------------------------------------------------------------
        -- TESTE 5: LIMITES
        --------------------------------------------------------------
        report "--- Teste 5: Limites ---";
        reseta;
        sentido <= '0';
        passos(C_T);
        confere_n(C_T, "5 N chegou em C");
        confere(s2i(led_cheio), 1, "5 cheio");
        confere(s2i(led_erro), 0, "5 erro ainda 0");
        passo;
        confere_n(C_T, "5 N satura em C");
        confere(s2i(led_erro), 1, "5 erro ativado (colocar em cheio)");
        confere_modo("10", C_T, "5 P = C");

        reseta;
        confere(s2i(led_erro), 0, "5 erro zerado pelo reset");
        sentido <= '1';
        passo;
        confere_n(0, "5 N satura em 0");
        confere(s2i(led_erro), 1, "5 erro ativado (retirar em vazio)");

        --------------------------------------------------------------
        -- TESTE 6: PAUSA
        --------------------------------------------------------------
        report "--- Teste 6: Pausa ---";
        reseta;
        sentido <= '0';
        passo;                           -- N=1, sinal_div esta em alto
        confere_n(1, "6a N antes da pausa");
        pausa <= '1';                    -- pausa no meio do periodo
        wait for 2 * T_CLK;
        confere(s2i(led_div), 0, "6a sinal_div volta a 0 com pausa");
        wait for 10 * T_CLK;
        confere(s2i(led_div), 0, "6a sinal_div parado em 0");
        confere_n(1, "6a N preservado na pausa");
        wait until falling_edge(clk);
        pausa <= '0';
        conta_ate_subida(cnt);
        confere(cnt, H_T, "6a fase reiniciada ao retomar");
        wait for T_CLK;
        confere_n(2, "6a um unico avanco apos retomar");

        -- pausa junto de um avanco
        wait until rising_edge(led_div);
        wait for 5 ns;                   -- pulso_avanco ativo
        pausa <= '1';
        wait for 3 * T_CLK;
        confere_n(2, "6b avanco junto da pausa e descartado");
        confere(s2i(led_div), 0, "6b sinal_div reiniciado");
        wait until falling_edge(clk);
        pausa <= '0';
        conta_ate_subida(cnt);
        confere(cnt, H_T, "6b sem avanco pendente (bordas ate subir)");
        wait for T_CLK;
        confere_n(3, "6b avanco normal apos retomar");

        --------------------------------------------------------------
        -- TESTE 7: PICO
        --------------------------------------------------------------
        report "--- Teste 7: Pico ---";
        reseta;
        sentido <= '0';
        passos(5);
        confere_n(5, "7 N=5");
        confere_modo("10", 5, "7 P=5");
        sentido <= '1';
        passos(3);
        confere_n(2, "7 N apos retirar 3");
        confere_modo("10", 5, "7 P preservado na retirada");
        sentido <= '0';
        passos(3);
        confere_n(5, "7 N volta ao pico");
        confere_modo("10", 5, "7 P nao aumenta ao empatar");
        passo;
        confere_n(6, "7 N ultrapassa o pico");
        confere_modo("10", 6, "7 P aumenta so ao superar");

        --------------------------------------------------------------
        -- TESTE 8: INDICADORES
        --------------------------------------------------------------
        report "--- Teste 8: Indicadores ---";
        reseta;
        sentido <= '0';
        confere(s2i(led_vazio), 1, "8 vazio em N=0");
        confere(s2i(led_cheio), 0, "8 cheio em N=0");
        confere(s2i(led_alerta), 0, "8 alerta em N=0");
        for i in 1 to C_T loop           -- subindo: cruza L
            passo;
            confere(s2i(led_vazio),  b2i(i = 0),    "8 vazio, N=" & integer'image(i));
            confere(s2i(led_alerta), b2i(i >= L_T), "8 alerta subindo, N=" & integer'image(i));
            confere(s2i(led_cheio),  b2i(i = C_T),  "8 cheio, N=" & integer'image(i));
        end loop;
        sentido <= '1';
        for i in C_T - 1 downto 0 loop   -- descendo: cruza L
            passo;
            confere(s2i(led_vazio),  b2i(i = 0),    "8 vazio, N=" & integer'image(i));
            confere(s2i(led_alerta), b2i(i >= L_T), "8 alerta descendo, N=" & integer'image(i));
            confere(s2i(led_cheio),  b2i(i = C_T),  "8 cheio, N=" & integer'image(i));
        end loop;
        confere(s2i(led_erro), 0, "8 sem erro ate aqui");
        passo;                           -- retirar em vazio
        confere(s2i(led_erro), 1, "8 erro ativado");
        sentido <= '0';
        passo;
        confere_n(1, "8 N volta a subir");
        confere(s2i(led_erro), 1, "8 erro persiste ate o reset");
        reseta;
        confere(s2i(led_erro), 0, "8 reset limpa o erro");

        --------------------------------------------------------------
        -- TESTE 9: VISUALIZACAO
        --------------------------------------------------------------
        report "--- Teste 9: Visualizacao ---";
        reseta;
        confere_modo("00", 0,   "9 pos-reset modo 00 (N)");
        confere_modo("01", C_T, "9 pos-reset modo 01 (C-N)");
        confere_modo("10", 0,   "9 pos-reset modo 10 (P)");
        confere_modo("11", C_T, "9 pos-reset modo 11 (C)");
        sentido <= '0';
        passos(5);
        sentido <= '1';
        passos(2);                       -- N=3, P=5
        confere_modo("00", 3,       "9 execucao modo 00");
        confere_modo("01", C_T - 3, "9 execucao modo 01");
        confere_modo("10", 5,       "9 execucao modo 10");
        confere_modo("11", C_T,     "9 execucao modo 11");
        pausa <= '1';
        wait for 3 * T_CLK;
        confere_modo("00", 3,       "9 pausa modo 00");
        confere_modo("01", C_T - 3, "9 pausa modo 01");
        confere_modo("10", 5,       "9 pausa modo 10");
        confere_modo("11", C_T,     "9 pausa modo 11");
        pausa <= '0';
        reseta;
        confere_modo("00", 0,   "9 apos novo reset modo 00");
        confere_modo("01", C_T, "9 apos novo reset modo 01");
        confere_modo("10", 0,   "9 apos novo reset modo 10");
        confere_modo("11", C_T, "9 apos novo reset modo 11");

        --------------------------------------------------------------
        -- TESTE 10: DECODIFICACAO
        --------------------------------------------------------------
        report "--- Teste 10: Decodificacao ---";
        for i in 0 to 15 loop
            bcd_t <= std_logic_vector(to_unsigned(i, 4));
            wait for 10 ns;
            if i <= 9 then
                confere(b2i(seg_t = TAB_SEG(i)), 1, "10 digito " & integer'image(i));
            else
                confere(b2i(seg_t = "1111111"), 1, "10 BCD invalido " & integer'image(i) & " apagado");
            end if;
        end loop;

        --------------------------------------------------------------
        -- RESUMO
        --------------------------------------------------------------
        report "===== RESUMO: " & integer'image(total - falhas) & " de "
               & integer'image(total) & " verificacoes OK; falhas="
               & integer'image(falhas) & " =====";
        fim <= true;
        wait;
    end process;

end architecture;