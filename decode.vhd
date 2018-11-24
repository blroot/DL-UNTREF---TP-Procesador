library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity decode is
  port (input : in  std_logic_vector (7 downto 0);
	reg_we : out  std_logic;
	out_we : out  std_logic;
	reg_a_we: out  std_logic;
	alu_op : out  std_logic_vector (2 downto 0);
	bus_sel : out  std_logic_vector (1 downto 0));
end decode; 

-- aplicamos minimizacion a las funciones de decode
architecture decode_beh of decode is
begin
  bus_sel <= "10" when input=x"01" else "01" when input=x"05" else "00";
  alu_op <= "010" when input=x"10" else "011" when input=x"11" else "100" when input=x"12" else
            "101" when input=x"13" else "110" when input=x"14" else "001" when input=x"20" else
            "111" when input=x"21" else "000";
  reg_a_we <= '1' when (input=x"04" or input=x"05") else '0';
  out_we <= '1' when input=x"02" else '0';
  reg_we <= '0' when (input=x"02" or input=x"04" or input=x"05") else '1';
end decode_beh;
