library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity reg8_tb is
end reg8_tb;

architecture reg8_test of reg8_tb is

  component reg8 is
    port(clk: in std_logic;
         we: in std_logic;
         rst: in std_logic;
         din: in std_logic_vector(7 downto 0);
         dout: out std_logic_vector(7 downto 0));   
  end component;

  signal clk,we,rst: std_logic;
  signal din,dout: std_logic_vector(7 downto 0);

begin
  clk1: entity work.clock(clock_architecture) port map(clk => clk);
  uut: entity work.reg8(reg8_beh) 
    port map(clk => clk, we => we, rst => rst, din => din, dout => dout);

  process
  begin
    rst <= '1';
    wait for 31 ns;
    assert dout="00000000" report "Falla reset" severity failure;

    rst <= '0';
    din <= "10101010";
    -- pongo we=1 aca para aprovechar ciclo
    -- we <= '1';
    wait for 31 ns;
    assert dout="00000000" report "Falla we" severity failure;

    rst <= '0';
    din <= "10101010";
    we <= '1';
    wait for 31 ns;
    assert dout="10101010" report "Falla escritura" severity failure;

    wait;
  end process;
end reg8_test;
