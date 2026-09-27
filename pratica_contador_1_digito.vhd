library ieee;
use ieee.std_logic_1164.all;

entity pratica_contador_1_digito is
    port (
        clk : in  std_logic;
        digit : out integer range 0 to 9
    );
end entity pratica_contador_1_digito;
 
architecture dataflow of pratica_contador_1_digito is
begin
    count: process(clk)
        variable temp: integer range 0 to 10;
    begin
        loop
            if clk'event and clk = '1' then 
                temp := temp + 1;
            end if;

            if (temp=10) then 
                temp := 0;
            end if;
            
            digit <= temp;
        end loop;
    end process count;
end dataflow;
