library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Regs_tb is
end Regs_tb;

architecture regs_test of Regs_tb is

  component Regs is
    port(
	   clk : in  STD_LOGIC;
           rst : in  STD_LOGIC;
           we : in  STD_LOGIC;
           rd : in  STD_LOGIC_VECTOR (3 downto 0);
           rs : in  STD_LOGIC_VECTOR (3 downto 0);
           din : in  STD_LOGIC_VECTOR (7 downto 0);
           dout : out  STD_LOGIC_VECTOR (7 downto 0)
	);
  end component;
  
  signal clk : STD_LOGIC;
  signal rst : STD_LOGIC;
  signal we : STD_LOGIC;
  signal rd : STD_LOGIC_VECTOR (3 downto 0);
  signal rs : STD_LOGIC_VECTOR (3 downto 0);
  signal din : STD_LOGIC_VECTOR (7 downto 0);
  signal dout : STD_LOGIC_VECTOR (7 downto 0);
  --signal clko: std_logic;

begin
  uut: entity work.Regs(registers_table_arq) 
    port map(clk => clk, rst => rst, we => we, rd => rd, rs => rs, din => din, dout => dout);
  
  -- señal de clock
  process
  begin
    clk <= '0';
    wait for 30 ns;
    clk <= '1';
    wait for 30 ns;
  end process;

  process
    begin

      rst <= '1';
      we <= '0';
      rs <= "0000";
      wait for 10 ns;
      assert dout = "00000000" report "Falla memoria en pos 0000 no contiene CERO" severity failure;

      rst <= '0';
      we <= '1';
      wait for 1 ns;
      rd <= "0011";
      din <= "10101011";
      wait for 20 ns;
      rs <= "0011";
      wait for 1 ns;
      assert dout="10101011" report "Falla lectura en pos 0011" severity failure;

      rs <= "0111";
      wait for 30 ns;
      assert dout="00000000" report "Falla lectura en pos 0111" severity failure;

      wait;
  end process;
end regs_test; 
