library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
use STD.TEXTIO.ALL;

------------------------------------------------------------------
-- TESTBENCH DE DEBUG - controlador da esteira
--
-- Roda com o clock REAL de 50 MHz e os valores reais do divisor
-- (sem parametros reduzidos). Em vez de varios "OK" soltos, ele conta
-- o que esta acontecendo, em ordem cronologica, com estas etiquetas:
--
--   CENARIO  o que o testbench esta fazendo agora
--   ENTRADA  mudanca em rst / sentido / pausa / modo
--   DIVISOR  medidas de sinal_div (tempo em alto, em baixo, periodo)
--   NUCLEO   regra de negocio aplicada em N, P e erro
--            (calculada por um MODELO DE REFERENCIA escrito aqui)
--   SAIDAS   o que o hardware mostra no display e nos LEDs
--   CONFERE  previsto x observado (valores escritos a mao no cenario)
--   FALHA    qualquer divergencia
------------------------------------------------------------------
entity tb_controlador_esteira is
end entity;

architecture sim of tb_controlador_esteira is

    ----------------------------------------------------------------
    -- Parametros da equipe (iguais aos usados no DUT)
    ----------------------------------------------------------------
    constant C_T        : integer := 40;           -- capacidade
    constant L_T        : integer := 30;           -- limiar de alerta
    constant F_T        : integer := 1;            -- frequencia em Hz (1, 2 ou 5)
    constant CLK_FREQ_T : integer := 50_000_000;   -- clock real da placa

    -- false = pula a etapa 8 (encher ate C), que e a mais demorada
    constant ETAPA_ENCHIMENTO : boolean := true;

    ----------------------------------------------------------------
    -- Constantes de tempo
    ----------------------------------------------------------------
    constant T_CLK    : time    := 20 ns;
    constant T_MEIO   : time    := 10 ns;
    constant UM_NS    : time    := 1 ns;
    constant UM_US    : time    := 1 us;
    constant UM_MS    : time    := 1 ms;
    constant METADE_T : integer := CLK_FREQ_T / (2 * F_T);   -- ciclos por semiciclo
    constant T_PER    : time    := 2 * METADE_T * T_CLK;     -- periodo de sinal_div

    ----------------------------------------------------------------
    -- Sinais
    ----------------------------------------------------------------
    signal clk     : std_logic := '0';
    signal rst     : std_logic := '1';
    signal sentido : std_logic := '0';
    signal pausa   : std_logic := '0';
    signal modo    : std_logic_vector(1 downto 0) := "00";

    signal led_cheio, led_vazio, led_alerta, led_erro, led_div : std_logic;
    signal display1, display0 : std_logic_vector(6 downto 0);

    signal bcd_t : std_logic_vector(3 downto 0) := "0000";
    signal seg_t : std_logic_vector(6 downto 0);

    signal fim      : boolean := false;
    signal silencio : boolean := false;   -- true = leituras rapidas de modo nao poluem o log

    -- Modelo de referencia (regra de negocio do PDF)
    signal N_m     : integer range 0 to 99 := 0;
    signal P_m     : integer range 0 to 99 := 0;
    signal erro_m  : std_logic := '0';
    signal acao_m  : integer := 0;
    signal n_pulsos : integer := 0;
    signal n_desc   : integer := 0;

    -- Contadores de verificacoes
    signal chk_div, fal_div, chk_core, fal_core : integer := 0;

    ----------------------------------------------------------------
    -- Tabela dos 10 digitos (ativo em 0, ordem gfedcba)
    ----------------------------------------------------------------
    type tab_seg_t is array (0 to 9) of std_logic_vector(6 downto 0);
    constant TAB_SEG : tab_seg_t := (
        "1000000", "1111001", "0100100", "0110000", "0011001",
        "0010010", "0000010", "1111000", "0000000", "0010000");

    ----------------------------------------------------------------
    -- Funcoes auxiliares
    ----------------------------------------------------------------
    function b2i(b : boolean) return integer is
    begin
        if b then
            return 1;
        else
            return 0;
        end if;
    end function;

    function s2i(s : std_logic) return integer is
    begin
        if s = '1' then
            return 1;
        else
            return 0;
        end if;
    end function;

    function sl(b : boolean) return std_logic is
    begin
        if b then
            return '1';
        else
            return '0';
        end if;
    end function;

    function sl_str(s : std_logic) return string is
    begin
        if s = '1' then
            return "1";
        elsif s = '0' then
            return "0";
        else
            return "X";
        end if;
    end function;

    function slv_str(v : std_logic_vector) return string is
        variable r : string(1 to v'length);
        variable k : integer := 1;
    begin
        for i in v'range loop
            if v(i) = '1' then
                r(k) := '1';
            elsif v(i) = '0' then
                r(k) := '0';
            else
                r(k) := 'X';
            end if;
            k := k + 1;
        end loop;
        return r;
    end function;

    function lpad(s : string; n : integer) return string is
        variable r : string(1 to n) := (others => ' ');
    begin
        if s'length >= n then
            return s;
        end if;
        r(n - s'length + 1 to n) := s;
        return r;
    end function;

    function rpad(s : string; n : integer) return string is
        variable r : string(1 to n) := (others => ' ');
    begin
        if s'length >= n then
            return s;
        end if;
        r(1 to s'length) := s;
        return r;
    end function;

    function zpad(v : integer; n : integer) return string is
        constant s : string := integer'image(v);
        variable r : string(1 to n) := (others => '0');
    begin
        if s'length >= n then
            return s;
        end if;
        r(n - s'length + 1 to n) := s;
        return r;
    end function;

    -- Tempo absoluto em segundos: "  1.200000 s"
    function fmt_t(t : time) return string is
        variable micro, seg, resto : integer;
    begin
        micro := t / UM_US;
        seg   := micro / 1000000;
        resto := micro mod 1000000;
        return lpad(integer'image(seg), 3) & "." & zpad(resto, 6) & " s";
    end function;

    -- Duracao curta: "20 ns", "100 ms"
    function fmt_dt(t : time) return string is
        variable v : integer;
    begin
        if t < UM_US then
            v := t / UM_NS;
            return integer'image(v) & " ns";
        elsif t < UM_MS then
            v := t / UM_US;
            return integer'image(v) & " us";
        else
            v := t / UM_MS;
            return integer'image(v) & " ms";
        end if;
    end function;

    function disp_txt(v : integer) return string is
    begin
        if v < 0 then
            return "--";
        else
            return zpad(v, 2);
        end if;
    end function;

    function sent_txt(s : std_logic) return string is
    begin
        if s = '0' then
            return "colocar pecas";
        else
            return "retirar pecas";
        end if;
    end function;

    function modo_txt(m : std_logic_vector(1 downto 0)) return string is
    begin
        case m is
            when "00"   => return "00 (display mostra N, quantidade atual)";
            when "01"   => return "01 (display mostra C - N, espacos disponiveis)";
            when "10"   => return "10 (display mostra P, pico desde o reset)";
            when others => return "11 (display mostra C, capacidade)";
        end case;
    end function;

    function acao_txt(a : integer) return string is
    begin
        case a is
            when 1      => return "sentido=colocar e N<C  -> N+1 (P acompanha se for novo recorde)";
            when 2      => return "sentido=retirar e N>0  -> N-1";
            when 3      => return "sentido=colocar e N=C  -> N permanece em C, erro passa a 1";
            when 4      => return "sentido=retirar e N=0  -> N permanece em 0, erro passa a 1";
            when others => return "(nenhuma)";
        end case;
    end function;

    -- Valor que o display deve mostrar em cada modo
    function esperado_modo(m : std_logic_vector(1 downto 0); n, p : integer) return integer is
    begin
        case m is
            when "00"   => return n;
            when "01"   => return C_T - n;
            when "10"   => return p;
            when others => return C_T;
        end case;
    end function;

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

    function ok_txt(b : boolean) return string is
    begin
        if b then
            return "[OK: igual ao modelo]";
        else
            return "[DIVERGE do modelo!]";
        end if;
    end function;

    ----------------------------------------------------------------
    -- Impressao (texto limpo, sem os cabecalhos do report)
    ----------------------------------------------------------------
    procedure imprime(s : string) is
        variable l : line;
    begin
        write(l, s);
        writeline(output, l);
    end procedure;

    procedure ev(t : time; tag : string; txt : string) is
    begin
        imprime("[" & fmt_t(t) & "] " & rpad(tag, 8) & " " & txt);
    end procedure;

begin

    ----------------------------------------------------------------
    -- DUT e decodificador isolado
    ----------------------------------------------------------------
    dut : entity work.controlador_esteira
        generic map (C => C_T, L => L_T, F => F_T, CLK_FREQ => CLK_FREQ_T)
        port map (
            clk_50 => clk, rst => rst, sentido => sentido, pausa => pausa, modo => modo,
            led_cheio => led_cheio, led_vazio => led_vazio, led_alerta => led_alerta,
            led_erro => led_erro, led_div => led_div,
            display1 => display1, display0 => display0);

    u_dec : entity work.decodificador_7seg
        port map (bcd => bcd_t, seg => seg_t);

    ----------------------------------------------------------------
    -- Clock de 50 MHz (periodo de 20 ns)
    ----------------------------------------------------------------
    clock : process
    begin
        while not fim loop
            clk <= '0';
            wait for T_MEIO;
            clk <= '1';
            wait for T_MEIO;
        end loop;
        wait;
    end process;

    ----------------------------------------------------------------
    -- MODELO DE REFERENCIA
    -- Escrito direto da tabela de regras do PDF. O pulso_avanco e
    -- identificado pela subida de sinal_div; o nucleo consome o pulso
    -- na borda de clock seguinte (1 ciclo de latencia), amostrando
    -- pausa e sentido nesse instante.
    ----------------------------------------------------------------
    modelo : process
    begin
        wait on led_div, rst;

        if rst = '1' then
            N_m    <= 0;
            P_m    <= 0;
            erro_m <= '0';

        elsif led_div = '1' and led_div'event then
            wait on rst for T_CLK;                     -- ate a borda que consome o pulso

            if rst = '1' then                          -- reset chegou antes: pulso perdido
                N_m    <= 0;
                P_m    <= 0;
                erro_m <= '0';

            elsif pausa = '1' then                     -- pausa tem prioridade
                n_desc <= n_desc + 1;

            else
                n_pulsos <= n_pulsos + 1;
                if sentido = '0' then                  -- colocar
                    if N_m < C_T then
                        N_m <= N_m + 1;
                        if N_m + 1 > P_m then
                            P_m <= N_m + 1;
                        end if;
                        acao_m <= 1;
                    else
                        erro_m <= '1';
                        acao_m <= 3;
                    end if;
                else                                   -- retirar
                    if N_m > 0 then
                        N_m <= N_m - 1;
                        acao_m <= 2;
                    else
                        erro_m <= '1';
                        acao_m <= 4;
                    end if;
                end if;
            end if;
        end if;
    end process;

    ----------------------------------------------------------------
    -- MEDIDOR DO DIVISOR
    -- Mede 1a subida, tempos em alto/baixo e periodo de sinal_div
    ----------------------------------------------------------------
    medidor : process
        variable bloq, ant_bloq : boolean := true;
        variable ant_div : std_logic := '0';
        variable t_libera, t_sobe, t_desce, edge1 : time := 0 ns;
        variable t_dur : time;
        variable espera_primeira, tem_periodo, tem_desce : boolean := false;
        variable k, ciclos, chk, fal : integer := 0;
    begin
        wait on led_div, rst, pausa;

        bloq := (rst = '1') or (pausa = '1');

        if ant_bloq and not bloq then
            t_libera        := now;
            espera_primeira := true;
            tem_periodo     := false;
            tem_desce       := false;
            ev(now, "DIVISOR", "divisor liberado: contador em 0, sinal_div em 0 (conta " & integer'image(METADE_T) & " bordas ate a 1a subida)");
        elsif bloq and not ant_bloq then
            espera_primeira := false;
            tem_periodo     := false;
            tem_desce       := false;
        end if;
        ant_bloq := bloq;

        if led_div /= ant_div then
            ant_div := led_div;

            if led_div = '1' then
                ----------------------------------------------------- SUBIDA
                if espera_primeira then
                    k      := (t_libera - T_MEIO) / T_CLK;
                    edge1  := T_MEIO + (k + 1) * T_CLK;          -- 1a borda de clk habilitada
                    ciclos := (now - edge1) / T_CLK + 1;
                    chk    := chk + 1;
                    if ciclos = METADE_T then
                        ev(now, "DIVISOR", "sinal_div SOBE (1a subida) apos " & integer'image(ciclos) & " bordas de clk = 1 semiciclo (esperado " & integer'image(METADE_T) & ")  [OK]");
                    else
                        fal := fal + 1;
                        ev(now, "FALHA", "*** 1a subida apos " & integer'image(ciclos) & " bordas; esperado " & integer'image(METADE_T));
                    end if;
                    espera_primeira := false;
                elsif tem_periodo then
                    t_dur := now - t_sobe;
                    chk   := chk + 1;
                    if t_dur = T_PER then
                        ev(now, "DIVISOR", "sinal_div SOBE: periodo = " & fmt_dt(t_dur) & " (esperado " & fmt_dt(T_PER) & ", F = " & integer'image(F_T) & " Hz)  [OK]");
                    else
                        fal := fal + 1;
                        ev(now, "FALHA", "*** periodo = " & fmt_dt(t_dur) & " (" & time'image(t_dur) & "), esperado " & fmt_dt(T_PER));
                    end if;
                    if tem_desce then
                        t_dur := now - t_desce;
                        chk   := chk + 1;
                        if t_dur = METADE_T * T_CLK then
                            ev(now, "DIVISOR", "            tempo em baixo = " & fmt_dt(t_dur) & " (esperado " & fmt_dt(METADE_T * T_CLK) & ")  [OK]");
                        else
                            fal := fal + 1;
                            ev(now, "FALHA", "*** tempo em baixo = " & time'image(t_dur));
                        end if;
                    end if;
                end if;
                ev(now, "DIVISOR", "            pulso_avanco = 1 durante 1 ciclo de clk (" & fmt_dt(T_CLK) & "); o nucleo o consome na proxima borda");
                t_sobe      := now;
                tem_periodo := true;
                tem_desce   := false;

            else
                ----------------------------------------------------- DESCIDA
                if bloq then
                    ev(now, "DIVISOR", "sinal_div DESCE a 0 forcado por pausa/reset: fase do divisor reiniciada");
                    tem_periodo := false;
                    tem_desce   := false;
                else
                    t_dur := now - t_sobe;
                    chk   := chk + 1;
                    if t_dur = METADE_T * T_CLK then
                        ev(now, "DIVISOR", "sinal_div DESCE: tempo em alto = " & fmt_dt(t_dur) & " (esperado " & fmt_dt(METADE_T * T_CLK) & ", duty 50%)  [OK]");
                    else
                        fal := fal + 1;
                        ev(now, "FALHA", "*** tempo em alto = " & time'image(t_dur));
                    end if;
                    t_desce   := now;
                    tem_desce := true;
                end if;
            end if;
        end if;

        chk_div <= chk;
        fal_div <= fal;
    end process;

    ----------------------------------------------------------------
    -- MONITOR: narra tudo e compara DUT x modelo de referencia
    ----------------------------------------------------------------
    monitor : process
        variable ant_rst, ant_sent, ant_pausa : std_logic := '0';
        variable ant_modo : std_logic_vector(1 downto 0) := "00";
        variable ant_N, ant_P, ant_pulsos, ant_desc : integer := 0;
        variable ant_erro : std_logic := '0';
        variable ant_cheio, ant_vazio, ant_alerta, ant_ledr : std_logic := 'U';
        variable ant_disp : integer := -99;
        variable obs_disp, esp_disp : integer;
        variable esp_cheio, esp_vazio, esp_alerta : std_logic;
        variable ok : boolean;
        variable t_ev : time;
        variable n_chk, n_fal : integer := 0;
    begin
        wait on rst, sentido, pausa, modo, N_m, P_m, erro_m, n_pulsos, n_desc,
                led_cheio, led_vazio, led_alerta, led_erro, display1, display0;
        wait for 1 ns;                    -- deixa os sinais assentarem
        t_ev := now - 1 ns;

        obs_disp   := le_disp(display1, display0);
        esp_disp   := esperado_modo(modo, N_m, P_m);
        esp_cheio  := sl(N_m = C_T);
        esp_vazio  := sl(N_m = 0);
        esp_alerta := sl(N_m >= L_T);
        ok := (obs_disp = esp_disp) and (led_cheio = esp_cheio) and (led_vazio = esp_vazio)
              and (led_alerta = esp_alerta) and (led_erro = erro_m);

        ------------------------------------------------ ENTRADAS
        if rst /= ant_rst then
            if rst = '1' then
                ev(t_ev, "ENTRADA", "rst = 1  RESET ASSINCRONO: zera N, P, erro e divisor na hora, sem esperar o clock");
            else
                ev(t_ev, "ENTRADA", "rst = 0  reset liberado");
            end if;
            ant_rst := rst;
        end if;

        if sentido /= ant_sent then
            ev(t_ev, "ENTRADA", "sentido = " & sl_str(sentido) & "  (" & sent_txt(sentido) & ")  - so e usado quando um pulso for consumido");
            ant_sent := sentido;
        end if;

        if pausa /= ant_pausa then
            if pausa = '1' then
                ev(t_ev, "ENTRADA", "pausa = 1  PAUSA: preserva N, P e erro; divisor volta ao inicio; avanco pendente descartado");
            else
                ev(t_ev, "ENTRADA", "pausa = 0  pausa liberada: divisor recomeca com sinal_div = 0");
            end if;
            ant_pausa := pausa;
        end if;

        if modo /= ant_modo then
            if not silencio then
                ev(t_ev, "ENTRADA", "modo = " & modo_txt(modo));
            end if;
            ant_modo := modo;
        end if;

        ------------------------------------------------ NUCLEO (modelo)
        if n_desc /= ant_desc then
            ev(t_ev, "NUCLEO", "pulso_avanco DESCARTADO: pausa=1 tem prioridade (N, P e erro preservados)");
            ant_desc := n_desc;
        end if;

        if n_pulsos /= ant_pulsos then
            ev(t_ev, "NUCLEO", "pulso_avanco CONSUMIDO: " & acao_txt(acao_m));
            ant_pulsos := n_pulsos;
        end if;

        if (N_m /= ant_N) or (P_m /= ant_P) or (erro_m /= ant_erro) then
            if rst = '1' then
                ev(t_ev, "NUCLEO", "RESET -> N: " & integer'image(ant_N) & " -> " & integer'image(N_m)
                                   & " | P: " & integer'image(ant_P) & " -> " & integer'image(P_m)
                                   & " | erro: " & sl_str(ant_erro) & " -> " & sl_str(erro_m));
            else
                ev(t_ev, "NUCLEO", "N: " & integer'image(ant_N) & " -> " & integer'image(N_m)
                                   & " | P: " & integer'image(ant_P) & " -> " & integer'image(P_m)
                                   & " | erro: " & sl_str(ant_erro) & " -> " & sl_str(erro_m));
            end if;
            ant_N    := N_m;
            ant_P    := P_m;
            ant_erro := erro_m;
        end if;

        ------------------------------------------------ SAIDAS (hardware)
        if (obs_disp /= ant_disp) or (led_cheio /= ant_cheio) or (led_vazio /= ant_vazio)
           or (led_alerta /= ant_alerta) or (led_erro /= ant_ledr) then
            if not silencio then
                ev(t_ev, "SAIDAS", "display = " & disp_txt(obs_disp) & " (modo " & slv_str(modo) & ")"
                                   & " | LEDs: cheio=" & sl_str(led_cheio) & " vazio=" & sl_str(led_vazio)
                                   & " alerta=" & sl_str(led_alerta) & " erro=" & sl_str(led_erro)
                                   & "  " & ok_txt(ok));
            end if;
            ant_disp   := obs_disp;
            ant_cheio  := led_cheio;
            ant_vazio  := led_vazio;
            ant_alerta := led_alerta;
            ant_ledr   := led_erro;
        end if;

        ------------------------------------------------ COMPARACAO
        n_chk := n_chk + 1;
        if not ok then
            n_fal := n_fal + 1;
            ev(t_ev, "FALHA", "*** DUT x modelo | display obs=" & disp_txt(obs_disp) & " esp=" & disp_txt(esp_disp)
                              & " | cheio " & sl_str(led_cheio) & "/" & sl_str(esp_cheio)
                              & " vazio " & sl_str(led_vazio) & "/" & sl_str(esp_vazio)
                              & " alerta " & sl_str(led_alerta) & "/" & sl_str(esp_alerta)
                              & " erro " & sl_str(led_erro) & "/" & sl_str(erro_m) & "  (obs/esp)");
        end if;
        chk_core <= n_chk;
        fal_core <= n_fal;
    end process;

    ----------------------------------------------------------------
    -- CENARIO (estimulos + previsoes escritas a mao)
    ----------------------------------------------------------------
    cenario : process
        variable chk, fal, fal_total : integer := 0;

        procedure titulo(n : integer; nome : string) is
        begin
            imprime("");
            imprime("=====================================================================================");
            imprime(" ETAPA " & integer'image(n) & ": " & nome);
            imprime("=====================================================================================");
        end procedure;

        procedure regra(s : string) is
        begin
            imprime(" REGRA: " & s);
        end procedure;

        procedure acao(s : string) is
        begin
            ev(now, "CENARIO", s);
        end procedure;

        procedure confere(obs, esp : integer; msg : string; mostra : boolean) is
        begin
            chk := chk + 1;
            if obs = esp then
                if mostra then
                    ev(now, "CONFERE", msg & ": previsto=" & integer'image(esp) & "  observado=" & integer'image(obs) & "  -> OK");
                end if;
            else
                fal := fal + 1;
                ev(now, "FALHA", "*** " & msg & ": previsto=" & integer'image(esp) & "  observado=" & integer'image(obs));
            end if;
        end procedure;

        -- le N pelo display (modo 00 ja selecionado)
        procedure le_n(esp : integer; msg : string) is
        begin
            confere(le_disp(display1, display0), esp, msg, true);
        end procedure;

        -- troca o modo so por um instante para ler outro valor (sem poluir o log)
        procedure le_modo(m : std_logic_vector(1 downto 0); esp : integer; msg : string) is
        begin
            silencio <= true;
            modo <= m;
            wait for 2 ns;
            confere(le_disp(display1, display0), esp, msg & " [modo " & slv_str(m) & "]", true);
            modo <= "00";
            wait for 2 ns;
            silencio <= false;
        end procedure;

        -- troca de modo visivel no log (fica no modo escolhido)
        procedure mostra_modo(m : std_logic_vector(1 downto 0); esp : integer; msg : string) is
        begin
            modo <= m;
            wait for 2 ns;
            confere(le_disp(display1, display0), esp, msg, true);
        end procedure;

        -- reset assincrono por 2 clocks, solto na borda de descida
        procedure reseta is
        begin
            wait until falling_edge(clk);
            rst <= '1';
            wait until falling_edge(clk);
            wait until falling_edge(clk);
            rst <= '0';
        end procedure;

        procedure espera_subida is
        begin
            wait until rising_edge(led_div) for 3 * T_PER;
            if not (led_div = '1' and led_div'event) then
                chk := chk + 1;
                fal := fal + 1;
                ev(now, "FALHA", "*** TIMEOUT: sinal_div nao subiu em 3 periodos");
            end if;
        end procedure;

        -- espera uma subida de sinal_div e o nucleo atualizar (1 ciclo depois)
        procedure passo is
        begin
            espera_subida;
            wait for T_CLK + 1 ns;
        end procedure;

    begin
        imprime("");
        imprime("#####################################################################################");
        imprime("#  DEBUG DA ESTEIRA - clock REAL de 50 MHz, sem parametros reduzidos");
        imprime("#####################################################################################");
        imprime(" Parametros: C=" & integer'image(C_T) & "  L=" & integer'image(L_T) & "  F=" & integer'image(F_T)
                & " Hz  clock=" & integer'image(CLK_FREQ_T / 1000000) & " MHz");
        imprime(" Divisor: semiciclo = " & integer'image(METADE_T) & " ciclos de clk = " & fmt_dt(METADE_T * T_CLK)
                & " | periodo de sinal_div = " & fmt_dt(T_PER)
                & " | contador conta de 0 a " & integer'image(METADE_T - 1));
        imprime(" Cada avanco da esteira leva " & fmt_dt(T_PER) & " de tempo simulado.");
        imprime(" Legenda: CENARIO / ENTRADA / DIVISOR / NUCLEO (regra do PDF) / SAIDAS (hardware) / CONFERE / FALHA");

        sentido <= '0';
        pausa   <= '0';
        modo    <= "00";

        ------------------------------------------------------------
        titulo(1, "RESET E ESTADO INICIAL");
        regra("rst=1 zera N, P, erro e o divisor. Apos o reset: modos 00 e 10 mostram 00; modos 01 e 11 mostram C.");
        reseta;
        le_modo("00", 0,   "N apos o reset");
        le_modo("01", C_T, "C - N apos o reset");
        le_modo("10", 0,   "P apos o reset");
        le_modo("11", C_T, "C apos o reset");
        confere(s2i(led_vazio),  1, "LED vazio",  true);
        confere(s2i(led_cheio),  0, "LED cheio",  true);
        confere(s2i(led_alerta), 0, "LED alerta", true);
        confere(s2i(led_erro),   0, "LED erro",   true);
        confere(s2i(led_div),    0, "LED sinal_div",   true);

        ------------------------------------------------------------
        titulo(2, "DIVISOR DE FREQUENCIA E CONTAGEM CRESCENTE (colocar pecas)");
        regra("sinal_div: onda quadrada de F Hz com 50% de duty; 1a subida apos 1 semiciclo. Cada subida gera 1 pulso_avanco e N+1.");
        sentido <= '0';
        for i in 1 to 4 loop
            passo;
            le_n(i, "N apos a subida " & integer'image(i));
            le_modo("10", i, "P acompanha o maior N");
        end loop;

        ------------------------------------------------------------
        titulo(3, "RETIRAR PECAS E TROCAR O SENTIDO ENTRE AVANCOS");
        regra("sentido=1 e N>0 decrementa. Trocar o sentido nao altera N na hora nem reinicia o divisor; vale so no proximo pulso. P nao diminui.");
        sentido <= '1';
        passo;
        le_n(3, "N apos retirar");
        le_modo("10", 4, "P preservado na retirada");
        passo;
        le_n(2, "N apos retirar");
        acao("trocando o sentido para colocar, entre dois avancos");
        sentido <= '0';
        wait for 2 ns;
        le_n(2, "N nao muda ao trocar o sentido");
        passo;
        le_n(3, "N sobe no proximo avanco, ja no novo sentido");

        ------------------------------------------------------------
        titulo(4, "MODOS DE VISUALIZACAO (N=3, P=4)");
        regra("modo 00=N, 01=C-N, 10=P, 11=C. A troca de modo altera so a visualizacao.");
        mostra_modo("00", 3,       "modo 00 = N");
        mostra_modo("01", C_T - 3, "modo 01 = C - N");
        mostra_modo("10", 4,       "modo 10 = P");
        mostra_modo("11", C_T,     "modo 11 = C");
        modo <= "00";
        wait for 2 ns;

        ------------------------------------------------------------
        titulo(5, "PAUSA");
        regra("pausa=1 preserva N, P e erro, reinicia a fase do divisor e descarta avanco pendente. Pausa tem prioridade sobre o pulso.");
        acao("5a) pausa no MEIO de um periodo, com sinal_div em alto");
        sentido <= '0';
        passo;
        le_n(4, "N antes da pausa");
        pausa <= '1';
        wait for 3 * T_CLK;
        confere(s2i(led_div), 0, "sinal_div volta a 0 com a pausa", true);
        wait for T_PER;
        le_n(4, "N preservado durante a pausa (sem avanco)");
        wait until falling_edge(clk);
        pausa <= '0';
        passo;
        le_n(5, "1o avanco depois de retomar (fase reiniciada)");
        acao("5b) pausa JUNTO de um avanco (pulso_avanco ativo)");
        espera_subida;
        wait for 5 ns;
        pausa <= '1';
        wait for 3 * T_CLK;
        le_n(5, "avanco descartado pela pausa");
        wait until falling_edge(clk);
        pausa <= '0';
        passo;
        le_n(6, "N avanca normalmente depois de retomar");

        ------------------------------------------------------------
        titulo(6, "RESET ASSINCRONO");
        regra("rst=1 tem prioridade sobre tudo, age entre bordas de clock e descarta um avanco em andamento.");
        acao("6a) reset ENTRE bordas de clock (N=6, P=6)");
        wait until rising_edge(clk);
        wait for 5 ns;
        rst <= '1';
        wait for 2 ns;
        le_n(0, "N zerado sem esperar borda de clk");
        le_modo("10", 0, "P zerado");
        confere(s2i(led_div), 0, "sinal_div zerado", true);
        wait until falling_edge(clk);
        wait until falling_edge(clk);
        rst <= '0';
        passo;
        le_n(1, "1o avanco depois do reset (fase do divisor reiniciada)");
        acao("6b) reset JUNTO de um avanco (N iria de 1 para 2)");
        espera_subida;
        wait for 5 ns;
        rst <= '1';
        wait for 2 * T_CLK;
        le_n(0, "avanco descartado pelo reset (N=0, e nao 2)");
        le_modo("10", 0, "P zerado");
        wait until falling_edge(clk);
        rst <= '0';

        ------------------------------------------------------------
        titulo(7, "LIMITE INFERIOR E ERRO PERSISTENTE");
        regra("Retirar com N=0: N permanece em 0 e erro passa a 1. O erro so volta a 0 com reset.");
        sentido <= '1';
        confere(s2i(led_erro), 0, "erro antes da tentativa", true);
        passo;
        le_n(0, "N satura em 0");
        confere(s2i(led_erro), 1, "erro ativado", true);
        confere(s2i(led_vazio), 1, "LED vazio", true);
        sentido <= '0';
        passo;
        le_n(1, "N volta a subir");
        confere(s2i(led_erro), 1, "erro persiste ate o reset", true);
        reseta;
        confere(s2i(led_erro), 0, "reset limpa o erro", true);
        le_n(0, "N apos o reset");

        ------------------------------------------------------------
        if ETAPA_ENCHIMENTO then
            titulo(8, "LIMITE SUPERIOR E INDICADORES (alerta, cheio, erro)");
            regra("alerta=1 quando N>=L; cheio=1 quando N=C. Colocar com N=C: N permanece em C e erro passa a 1. P=C.");
            acao("enchendo a bandeja ate C=" & integer'image(C_T) & " (L=" & integer'image(L_T) & ")");
            sentido <= '0';
            for i in 1 to C_T loop
                passo;
                confere(le_disp(display1, display0), i, "N", false);
                confere(s2i(led_alerta), b2i(i >= L_T), "alerta com N=" & integer'image(i),
                        (i = L_T - 1) or (i = L_T));
                confere(s2i(led_cheio), b2i(i = C_T), "cheio com N=" & integer'image(i), i = C_T);
            end loop;
            le_modo("10", C_T, "P = C");
            confere(s2i(led_erro), 0, "ainda sem erro", true);
            acao("tentando colocar mais uma peca com a bandeja cheia");
            passo;
            le_n(C_T, "N satura em C");
            confere(s2i(led_erro), 1, "erro ativado", true);
            acao("retirando pecas ate cruzar L para baixo");
            sentido <= '1';
            for i in C_T - 1 downto L_T - 1 loop
                passo;
                confere(le_disp(display1, display0), i, "N", false);
                confere(s2i(led_alerta), b2i(i >= L_T), "alerta com N=" & integer'image(i),
                        (i = L_T) or (i = L_T - 1));
                confere(s2i(led_cheio), 0, "cheio com N=" & integer'image(i), i = C_T - 1);
            end loop;
            le_modo("10", C_T, "P preservado nas retiradas");
        end if;

        ------------------------------------------------------------
        titulo(9, "DECODIFICADOR BCD -> 7 SEGMENTOS (ativo em 0, ordem gfedcba)");
        regra("Digitos 0 a 9 geram o padrao do segmento; codigos BCD 10 a 15 apagam todos os segmentos.");
        for i in 0 to 15 loop
            bcd_t <= std_logic_vector(to_unsigned(i, 4));
            wait for 10 ns;
            if i <= 9 then
                confere(b2i(seg_t = TAB_SEG(i)), 1, "BCD " & integer'image(i) & " -> " & slv_str(seg_t), true);
            else
                confere(b2i(seg_t = "1111111"), 1, "BCD invalido " & integer'image(i) & " -> " & slv_str(seg_t) & " (apagado)", true);
            end if;
        end loop;

        ------------------------------------------------------------
        titulo(10, "RESUMO");
        wait for 5 ns;
        fal_total := fal + fal_div + fal_core;
        imprime(" Previsto x observado (cenario):      " & integer'image(chk) & " verificacoes, " & integer'image(fal) & " falhas");
        imprime(" Medidas de tempo do divisor:         " & integer'image(chk_div) & " verificacoes, " & integer'image(fal_div) & " falhas");
        imprime(" Hardware x modelo de referencia:     " & integer'image(chk_core) & " conferencias, " & integer'image(fal_core) & " divergencias");
        if fal_total = 0 then
            imprime(" RESULTADO: TUDO CONFERE COM A REGRA DE NEGOCIO");
        else
            imprime(" RESULTADO: HA FALHAS - procure as linhas FALHA acima");
        end if;
        imprime("");
        fim <= true;
        wait;
    end process;

end architecture;