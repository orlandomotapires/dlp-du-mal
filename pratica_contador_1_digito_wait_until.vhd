library ieee;
use ieee.std_logic_1164.all;

entity pratica_contador_1_digito_wait_until is
    port (
        clk : in  std_logic;
        digit : out integer range 0 to 9
    );
end entity pratica_contador_1_digito_wait_until;
 
architecture dataflow of pratica_contador_1_digito_wait_until is
begin
    count: process
        variable temp: integer range 0 to 10;
    begin
        loop
            wait until clk'event and clk = '1'; 
                temp := temp + 1;

                
            if (temp=10) then 
                temp := 0;
            end if;
            
            digit <= temp;
        end loop;
    end process count;
end dataflow;
