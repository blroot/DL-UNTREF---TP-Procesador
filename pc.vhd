library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.numeric_std.all;

entity pc is
  port(clk: in std_logic;
       s: out std_logic_vector(6 downto 0));
end pc;

architecture pc_beh of pc is

-- quizas sea mejor implementar un reset, por ahora inicializamos en 0x00
signal s_buf: std_logic_vector(6 downto 0) := "0000000";

begin
  process(clk)
  begin
    if (rising_edge(clk)) then
      s_buf <= std_logic_vector(unsigned(s_buf) + "1");
      s <= s_buf;
    end if;
  end process;
end pc_beh;
