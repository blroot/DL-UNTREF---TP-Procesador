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
                -- <INSTRUCCION><RD><RS> 
                -- 0: in <RD> --> in r3 
                when "0000000" => output <= "0000000100110000";
                -- 1: lda <RS> --> lda r3
                when "0000001" => output <= "0000010000000011";
                -- 2: add <RD> <RS> --> add r4, r3
                when "0000010" => output <= "0000101001000011";
                -- 3: sub <RD> <RS> --> sub r5,r4
                when "0000011" => output <= "0000101101010100";
                -- 4: or <RD> <RS> --> or r6, r4
                when "0000100" => output <= "0000110101100100";
                -- 5: and <RD> <RS> --> and r7, r0
                when "0000101" => output <= "0000110001110000";
                -- 6: mov <RD> <RS> --> mov r14, r4
                when "0000110" => output <= "0000001111100100";
                -- ===================================================================
		-- AGREGAMOS PARA USAR LOS REGISTROS FALTANTES Y OTRAS INSTRUCCIONES
                -- 7: ldi <valor> --> ldi "10101010"
                when "0000111" => output <= "0000010110101010";
                -- 8: in <RD> --> in r8
                when "0001000" => output <= "0000000110000000";
                -- 9: xor <RD> <RS> --> xor r13, r8
                when "0001001" => output <= "0000111011011000";
                -- 10: shr <RD> <RS> --> shr r9, r8
                when "0001010" => output <= "0001010110011000";
                -- 11: shl <RD> <RS> --> shl r10, r13
                when "0001011" => output <= "0001010010101101";
                -- ===================================================================
		-- 12: out <RS> --> out r3
                when "0001100" => output <= "0000001000000011";
                -- 13: out r4
                when "0001101" => output <= "0000001000000100";
                -- 14: out r5
                when "0001110" => output <= "0000001000000101";
                -- 15: out r6
                when "0001111" => output <= "0000001000000110";
                -- 16: out r7
                when "0010000" => output <= "0000001000000111";
                -- 17: out r8
                when "0010001" => output <= "0000001000001000";
                -- ===================================================================
		-- AGREGAMOS LOS OUT PARA LAS INSTRUCCIONES NUEVAS
                -- 18: out r9
                when "0010010" => output <= "0000001000001001";
                -- 19: out r10
                when "0010011" => output <= "0000001000001010";
                -- ===================================================================
                -- 20: out r13
                when "0010100" => output <= "0000001000001101";
                -- 21: out r14
                when "0010101" => output <= "0000001000001110";
                when others => output <= "XXXXXXXXXXXXXXXX";
            end case;
        end process;      
    end rom_prog_beh;
