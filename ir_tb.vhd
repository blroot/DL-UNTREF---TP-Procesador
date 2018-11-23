library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity ir_tb is
end ir_tb;

architecture ir_test of ir_tb is

  component ir is
    port(clk: in std_logic;
         we: in std_logic;
         rst: in std_logic;
         din: in std_logic_vector(15 downto 0);
         dout: out std_logic_vector(15 downto 0));   
  end component;

  signal clk,we,rst: std_logic;
  signal din,dout: std_logic_vector(15 downto 0);

begin
  clk1: entity work.clock(clock_architecture) port map(clk => clk);
  uut: entity work.ir(ir_beh) 
    port map(clk => clk, we => we, rst => rst, din => din, dout => dout);

  process
  begin
    rst <= '1';
    wait for 31 ns;
    assert dout="0000000000000000" report "Falla reset" severity failure;

    rst <= '0';
    din <= "1010101010101010";
    wait for 31 ns;
    assert dout="0000000000000000" report "Falla we" severity failure;

    rst <= '0';
    din <= "1010101010101010";
    we <= '1';
    wait for 31 ns;
    assert dout="1010101010101010" report "Falla escritura" severity failure;

    wait;
  end process;
end ir_test;
