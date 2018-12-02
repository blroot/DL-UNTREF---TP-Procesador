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

 -- CLOCK DEL PROCESADOR 10 ns
 constant clock : time:= 10 ns;

begin
    uut: entity work.proc(Beh_Proc) 
    port map(
                  clk => sg_clk
                , rst => sg_rst
                , input => sg_input
                , output => sg_output
            );

    -- señal de clock
      Pclk:  process
        begin
          sg_clk <= '0';
          wait for clock;
          sg_clk<= '1';
          wait for clock;  
      end process;

      -- proceso de reset se le da un periodo multiplicado por 30 para dar un tiempo extra y que se ejecuten TODAS las instrucciones  
     PReset :process
       begin
       sg_rst <= '1';
       wait for clock/4;
       sg_rst <= '0';
       wait for clock*32;
     end process;
      
      --Estimulo de entrada
      IN_preset: process
        begin
        sg_input <= x"03";
        wait;
      end process;

end proc_test; 
