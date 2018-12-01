library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity rom_prog is
    port(
            addr : in  std_logic_vector (6 downto 0);
            output : out  std_logic_vector (15 downto 0)
        );
end rom_prog;

architecture rom_prog_beh of rom_prog is
    begin
        process(addr)
        begin
            case addr is
                -- <INSTRUCCION><RS><RD> 
                -- 0: in <RD> --> in r3 
                when "0000000" => output <= "0000000100000011";
		-- prueba... lo mando al output
                --when "0000001" => output <= "0000001000000011";
                -- 1: lda <RS> --> lda r3
                when "0000001" => output <= "0000010000110000";
                -- 2: add <RD> <RS> --> add r4, r3
                when "0000010" => output <= "0000101000110100";
                -- 3: sub <RD> <RS> --> sub r5,r4
                when "0000011" => output <= "0000101101000101";
                -- 4: or <RD> <RS> --> or r6, r4
                when "0000100" => output <= "0000110101000110";
                -- 5: and <RD> <RS> --> and r7, r0
                when "0000101" => output <= "0000110000000111";
                -- 6: mov <RD> <RS> --> mov r14, r4
                when "0000110" => output <= "0000001101001110";
                -- 7: out <RS> --> out r3
                when "0000111" => output <= "0000001000110000";
                -- 8: out r4
                when "0001000" => output <= "0000001001000000";
                -- 9: out r5
                when "0001001" => output <= "0000001001010000";
                -- 10: out r6
                when "0001010" => output <= "0000001001100000";
                -- 11: out r7
                when "0001011" => output <= "0000001001110000";
                -- 12: out r8
                when "0001100" => output <= "0000001010000000";
                -- 13: out r13
                when "0001101" => output <= "0000001011010000";
                -- 14: out r14
                when "0001110" => output <= "0000001011100000";
                when others => output <= "XXXXXXXXXXXXXXXX";
            end case;
        end process;      
    end rom_prog_beh;
