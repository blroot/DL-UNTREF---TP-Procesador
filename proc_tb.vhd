library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity proc_tb is
end proc_tb;

architecture proc_test of proc_tb is

    component proc is
    port(   clk : in     std_logic;
            rst : in     std_logic;
            input : in  std_logic_vector (7 downto 0);
            output : out     std_logic_vector (7 downto 0)
        );
    end component;
  
    signal sg_clk: std_logic;
    signal sg_rst: std_logic;
    signal sg_input: std_logic_vector (7 downto 0);
    signal sg_output: std_logic_vector (7 downto 0);

begin
    uut: entity work.proc(Beh_Proc) 
    port map(
                  clk => sg_clk
                , rst => sg_rst
                , input => sg_input
                , output => sg_output
            );

    -- señal de clock
    process
    begin
        sg_clk <= '0';
        wait for 10 ns;
        sg_clk <= '1';
        wait for 10 ns;
        sg_clk <= '0';
        wait for 10 ns;
        sg_clk <= '1';
        wait for 10 ns;
        sg_clk <= '0';
        wait for 10 ns;
        sg_clk <= '1';
        wait for 10 ns;
        sg_clk <= '0';
        wait for 10 ns;
        sg_clk <= '1';
        wait for 10 ns;
        sg_clk <= '0';
        wait for 10 ns;
        sg_clk <= '1';
        wait for 10 ns;
        sg_clk <= '0';
        wait for 10 ns;
        sg_clk <= '1';
        wait for 10 ns;
        sg_clk <= '0';
        wait for 10 ns;
        sg_clk <= '1';
        wait for 10 ns;
        sg_clk <= '0';
        wait for 10 ns;
        sg_clk <= '1';
        wait for 10 ns;
        sg_clk <= '0';
        wait for 10 ns;
        sg_clk <= '1';
        wait for 10 ns;
        sg_clk <= '0';
        wait for 10 ns;
        sg_clk <= '1';
        wait for 10 ns;
        sg_clk <= '0';
        wait for 10 ns;
        sg_clk <= '1';
        wait for 10 ns;
        sg_clk <= '0';
        wait for 10 ns;
        sg_clk <= '1';
        wait for 10 ns;
    end process;

    -- cuerpo del test
    process
    begin

        sg_input <= "10101010"; 
        sg_output <= "00000000"; 
	sg_rst <= '0';
        wait for 11 ns;
	sg_rst <= '0';
        wait for 11 ns;
	sg_rst <= '0';
        wait for 11 ns;
	sg_rst <= '0';
        wait for 11 ns;
	sg_rst <= '0';
        wait for 11 ns;
	sg_rst <= '0';
        wait for 11 ns;
	sg_rst <= '0';
        wait for 11 ns;
	sg_rst <= '0';
        wait for 11 ns;
	sg_rst <= '0';
        wait for 11 ns;
	sg_rst <= '0';
        wait for 11 ns;
	sg_rst <= '0';
        wait for 11 ns;
	sg_rst <= '0';
        wait for 11 ns;
	sg_rst <= '0';
        wait for 11 ns;
	sg_rst <= '0';
        wait for 11 ns;
	sg_rst <= '0';
        wait for 11 ns;
	sg_rst <= '0';
        wait for 11 ns;
	sg_rst <= '0';
        wait for 11 ns;        
	
        wait;
    end process;
end proc_test; 
