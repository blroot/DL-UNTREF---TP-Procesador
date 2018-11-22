
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
USE ieee.numeric_std.ALL;

entity regs is
    Port ( clk : in  STD_LOGIC;
           rst : in  STD_LOGIC;
           we : in  STD_LOGIC;
           rd : in  STD_LOGIC_VECTOR (3 downto 0);
           rs : in  STD_LOGIC_VECTOR (3 downto 0);
           din : in  STD_LOGIC_VECTOR (7 downto 0);
           dout : out  STD_LOGIC_VECTOR (7 downto 0));
end regs;

architecture registers_table_arq of regs is

  constant reg_tam : INTEGER := 16;
  type mem is array(reg_tam-1 downto 0) of STD_LOGIC_VECTOR(7 downto 0);
  signal reg: mem;
  
begin 

  process (clk,rst)
  begin
    if rst= '1' then
      for i in 0 to reg_tam-1 loop
        reg(i) <= (others => '0');
      end loop; 
    elsif (clk'event and clk = '1') then
      if (we = '1') then
        reg(to_integer(unsigned(rd))) <= din;
      end if;
    end if; 
  end process; 

dout <= reg(to_integer(unsigned(rs))); 


end registers_table_arq;


