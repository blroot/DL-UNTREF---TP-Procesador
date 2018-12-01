library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity ir is
  port(clk: in std_logic;
       we: in std_logic;
       rst: in std_logic;
       din: in std_logic_vector(15 downto 0);
       dout: out std_logic_vector(15 downto 0));
end ir;

architecture ir_beh of ir is
  signal s_buf : STD_LOGIC_VECTOR  (15 downto 0);
begin
  process(clk,rst)
  begin
    if (rst='1') then
      s_buf <= (others => '0');
    elsif (rising_edge(clk)) then
      if we='1' then
        s_buf <= din;
      end if;
    end if;
  end process;

dout <= s_buf;

end ir_beh;
