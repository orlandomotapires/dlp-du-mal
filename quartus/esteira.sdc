# Restricoes de timing do top_de0cv (DE0-CV, clock de 50 MHz)
create_clock -name CLOCK_50 -period 20.000 [get_ports CLOCK_50]
derive_clock_uncertainty

# Botao e chaves (velocidade humana) e saidas para LEDs/displays: sem requisito de tempo
set_false_path -from [get_ports {KEY3 SW[*]}]
set_false_path -to [get_ports {LEDR[*] HEX*}]
