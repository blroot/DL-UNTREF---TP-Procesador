library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity alu_tb is
end alu_tb;

architecture alu_test of alu_tb is

  component alu is
    port(op: in  std_logic_vector(2 downto 0);
         a,b : in  std_logic_vector (7 downto 0);
         s : out  std_logic_vector (7 downto 0));
  end component;
  
  signal op: std_logic_vector(2 downto 0);
  signal a,b: std_logic_vector(7 downto 0);
  signal s: std_logic_vector(7 downto 0);

begin
  uut: entity work.alu(alu_architecture) port map(op => op, a => a, b => b, s => s);
  process
    begin
      
      a <= "10101010"; b <= "01010101";
      op <= "000";
      wait for 10 ns;
      assert s="10101010" report "Falla instruccion cod.: 000" severity failure;

      a <= "10101010"; b <= "01010101";
      op <= "001";
      wait for 10 ns;
      assert s="01010100" report "Falla instruccion cod.: 001" severity failure;

      a <= "10101010"; b <= "01010101";
      op <= "010";
      wait for 10 ns;
      assert s="11111111" report "Falla instruccion cod.: 010" severity failure;

      a <= "10101010"; b <= "01010101";
      op <= "011";
      wait for 10 ns;
      assert s="01010101" report "Falla instruccion cod.: 011" severity failure;

      a <= "10101010"; b <= "01010101";
      op <= "100";
      wait for 10 ns;
      assert s="00000000" report "Falla instruccion cod.: 100" severity failure;

      a <= "10101010"; b <= "01010101";
      op <= "101";
      wait for 10 ns;
      assert s="11111111" report "Falla instruccion cod.: 101" severity failure;

      a <= "10101010"; b <= "01010101";
      op <= "110";
      wait for 10 ns;
      assert s="11111111" report "Falla instruccion cod.: 110" severity failure;

      a <= "10101010"; b <= "01010101";
      op <= "111";
      wait for 10 ns;
      assert s="01010101" report "Falla instruccion cod.: 111" severity failure;

      wait;
  end process;
end alu_test; 
