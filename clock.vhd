library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity clock is
  port(clk: out std_logic);
end clock;

architecture clock_architecture of clock is
begin
  process
  begin
    clk <= '0';
    wait for 30 ns;
    clk <= '1';
    wait for 30 ns;
  end process;
end clock_architecture;
