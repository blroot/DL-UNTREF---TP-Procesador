library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity decode is
  port (input : in  std_logic_vector (15 downto 8);
	reg_we : out  std_logic;
	out_we : out  std_logic;
	reg_a_we: out  std_logic;
	alu_op : out  std_logic_vector (2 downto 0);
	bus_sel : out  std_logic_vector (1 downto 0));
end decode; 

architecture decode_beh of decode is
begin
  process(input)
  begin
    case input is
        -- IN
        when x"01" => bus_sel <= "10";
                      alu_op <= "000";
                      reg_a_we <= '0';
                      out_we <= '0';
                      reg_we <= '1';
        -- OUT
        when x"02" => bus_sel <= "00";
                      alu_op <= "000";
                      reg_a_we <= '0';
                      out_we <= '1';
                      reg_we <= '0';
        -- MOV
        when x"03" => bus_sel <= "00";
                      alu_op <= "000";
                      reg_a_we <= '0';
                      out_we <= '0';
                      reg_we <= '1';
        -- LDA
        when x"04" => bus_sel <= "00";
                      alu_op <= "000";
                      reg_a_we <= '1';
                      out_we <= '0';
                      reg_we <= '0';
        -- LDI
        when x"05" => bus_sel <= "01";
                      alu_op <= "000";
                      reg_a_we <= '1';
                      out_we <= '0';
                      reg_we <= '0';
        -- ADD
        when x"10" => bus_sel <= "00";
                      alu_op <= "010";
                      reg_a_we <= '0';
                      out_we <= '0';
                      reg_we <= '1';
        -- SUB
        when x"11" => bus_sel <= "00";
                      alu_op <= "011";
                      reg_a_we <= '0';
                      out_we <= '0';
                      reg_we <= '1';
        -- AND
        when x"12" => bus_sel <= "00";
                      alu_op <= "100";
                      reg_a_we <= '0';
                      out_we <= '0';
                      reg_we <= '1';
        -- OR
        when x"13" => bus_sel <= "00";
                      alu_op <= "101";
                      reg_a_we <= '0';
                      out_we <= '0';
                      reg_we <= '1';
        -- XOR
        when x"14" => bus_sel <= "00";
                      alu_op <= "110";
                      reg_a_we <= '0';
                      out_we <= '0';
                      reg_we <= '1';
        -- SHL
        when x"20" => bus_sel <= "00";
                      alu_op <= "001";
                      reg_a_we <= '0';
                      out_we <= '0';
                      reg_we <= '1';
        -- SHR
        when x"21" => bus_sel <= "00";
                      alu_op <= "111";
                      reg_a_we <= '0';
                      out_we <= '0';
                      reg_we <= '1';
        when others => bus_sel <= "XX";
                       alu_op <= "XXX";
                       reg_a_we <= 'X';
                       out_we <= 'X';
                       reg_we <= 'X';
    end case;
  end process;
end decode_beh;
