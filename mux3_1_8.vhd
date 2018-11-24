library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity mux3_1_8 is
  port(a,b,c : in std_logic_vector(7 downto 0);
       ctl: in std_logic_vector(1 downto 0);
       s: out std_logic_vector(7 downto 0));
end mux3_1_8;

architecture mux3_1_8_beh of mux3_1_8 is
begin
  s <= a when ctl="00" else
       b when ctl="01" else
       c when ctl="10" else
       "XXXXXXXX";
end mux3_1_8_beh;
