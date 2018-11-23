library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity mux3_1_8_tb is
end mux3_1_8_tb;

architecture mux3_1_8_test of mux3_1_8_tb is

  component mux3_1_8 is
    port(a,b,c : in std_logic_vector(7 downto 0);
         ctl: in std_logic_vector(1 downto 0);
         s: out std_logic_vector(7 downto 0));
  end component;

  signal a,b,c: std_logic_vector(7 downto 0);
  signal ctl: std_logic_vector(1 downto 0);
  signal s: std_logic_vector(7 downto 0);

begin
  uut: entity work.mux3_1_8(mux3_1_8_beh) port map(a => a, b => b, c => c, ctl => ctl, s => s);
  process
  begin
    
    a <= "11111111"; b <= "10101010"; c <="00000001";
    ctl <= "00";
    wait for 10 ns;
    assert s="11111111" report "Falla con ctl=00" severity failure;

    ctl <= "01";
    wait for 10 ns;
    assert s="10101010" report "Falla con ctl=01" severity failure;

    ctl <= "10";
    wait for 10 ns;
    assert s="00000001" report "Falla con ctl=10" severity failure;
 
    wait;

  end process;
end mux3_1_8_test;
