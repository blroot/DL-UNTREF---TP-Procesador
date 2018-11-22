library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity clock_tb is
end clock_tb;

architecture clock_test of clock_tb is

  component clock is
    port(clk: out std_logic);
  end component;

  signal clk: std_logic;

begin
  uut: entity work.clock(clock_architecture) port map(clk => clk);
  process
    begin
      
      wait for 1 ns;
      assert clk='0' report "Falla en 0" severity failure;
      wait for 35 ns;
      assert clk='1' report "Falla en 1" severity failure;

      wait;
  end process;
end clock_test;
