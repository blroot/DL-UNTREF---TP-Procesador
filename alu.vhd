library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.numeric_std.all;

entity alu is
  port(op: in  std_logic_vector(2 downto 0);
       a,b : in  std_logic_vector (7 downto 0);
       s : out  std_logic_vector (7 downto 0));
end alu;

architecture alu_architecture of alu is
begin
  s <= a when op="000" else
       a(6 downto 0) & '0' when op="001" else
       std_logic_vector(unsigned(a) + unsigned(b)) when op="010" else
       std_logic_vector(unsigned(a) - unsigned(b)) when op="011" else
       a and b when op="100" else
       a or b when op="101" else
       a xor b when op="110" else
       '0' & a(7 downto 1);
end architecture;
