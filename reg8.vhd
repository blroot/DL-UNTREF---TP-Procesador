library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity reg8 is
  port(clk: in std_logic;
       we: in std_logic;
       rst: in std_logic;
       din: in std_logic_vector(7 downto 0);
       dout: out std_logic_vector(7 downto 0));
end reg8;

architecture reg8_beh of reg8 is
begin
  process(clk,rst)
  begin
    if (rst='1') then
      dout <= (others => '0');
    elsif (rising_edge(clk)) then
      if we='1' then
        dout <= din;
      end if;
    end if;
  end process;
end reg8_beh;
