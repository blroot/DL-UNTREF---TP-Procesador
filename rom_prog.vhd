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
                -- 0: in r3 
                when "0000000" => output <= "0000000100110000";
                -- 1: lda r3
                when "0000001" => output <= "0000010000110000";
                -- 2: add r4, r3
                when "0000010" => output <= "0000101001000011";
                -- 3: sub r5,r4
                when "0000011" => output <= "0000101101010100";
                -- 4: or r6, r4
                when "0000100" => output <= "0000110101100100";
                -- 5: and r7, r0
                when "0000101" => output <= "0000110001110000";
                -- 6: mov r14, r4
                when "0000110" => output <= "0000001111100100";
                -- 7: out r3
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
