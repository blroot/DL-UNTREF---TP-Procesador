library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity rom_prog is
  port (addr : in  std_logic_vector (6 downto 0);
        output : out  std_logic_vector (15 downto 0));
end rom_prog;

architecture rom_prog_beh of rom_prog is
begin
  process(addr)
  begin
    case addr is 
      when "0000000" => output <= "0000000000000000";
      when others => output <= "XXXXXXXXXXXXXXXX";
    end case;
  end process;      
end rom_prog_beh;