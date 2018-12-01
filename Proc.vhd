----------------------------------------------------------------------------------
-- Realizado por la catedra  Diseño Lógico (UNTREF) en 2015
-- Tiene como objeto brindarle a los alumnos un template del procesador requerido
-- Profesores Martín Vázquez - Lucas Leiva
----------------------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Proc is
    Port    ( 
                clk : in     std_logic;
                rst : in     std_logic;
                input : in  STD_LOGIC_VECTOR (7 downto 0);
                output : out     std_logic_vector (7 downto 0)
            );
end Proc;

architecture Beh_Proc of Proc is

-- ================
-- Declaración de los componentes utilizados

component regs 
    Port    ( 
                clk : in     std_logic;
                rst : in     std_logic;
                we : in std_logic;
                rd : in std_logic_vector (3 downto 0);
                rs : in std_logic_vector (3 downto 0);
                din : in     std_logic_vector (7 downto 0);
                dout : out  std_logic_vector (7 downto 0)
            );
end component;

component alu 
    port    ( 
                op: in   std_logic_vector(2 downto 0);
                a,b : in     std_logic_vector (7 downto 0);
                s : out std_logic_vector (7 downto 0)
            );
end component;

component rom_prog 
    port    (
                addr : in   std_logic_vector (6 downto 0);
                output : out  std_logic_vector (15 downto 0)
            );
end component; 


component decode 
    port    (
                input : in  std_logic_vector (7 downto 0);
                reg_we : out  std_logic;
                out_we : out  std_logic;
                reg_a_we: out  std_logic;
                alu_op : out  std_logic_vector (2 downto 0);
                bus_sel : out  std_logic_vector (1 downto 0)
            );
end component; 

component reg8
  port(clk: in std_logic;
       we: in std_logic;
       rst: in std_logic;
       din: in std_logic_vector(7 downto 0);
       dout: out std_logic_vector(7 downto 0));
end component;

component pc 
  port(clk,rst: in std_logic;
       s: out std_logic_vector(6 downto 0));
end component;

component ir
  port(clk: in std_logic;
       we: in std_logic;
       rst: in std_logic;
       din: in std_logic_vector(15 downto 0);
       dout: out std_logic_vector(15 downto 0));
end component;

component mux3_1_8
  port(a,b,c : in std_logic_vector(7 downto 0);
       ctl: in std_logic_vector(1 downto 0);
       s: out std_logic_vector(7 downto 0));
end component;
-- ================

-- ================
-- declaración de señales usadas 

-- Conexion entre Program Counter y ROM
signal sg_pc: std_logic_vector(6 downto 0);
-- Conexion entre ROM y el IR
signal sg_rom: std_logic_vector(15 downto 0);
-- Conexion de la salida del IR
signal sg_irout: std_logic_vector(15 downto 0);
-- Bus de datos entre el Banco-Mux-Alu-Reg_A
signal sg_bus1: std_logic_vector(7 downto 0);
-- Bus de datos entre Alu-Banco-Reg_Out
signal sg_bus2: std_logic_vector(7 downto 0);

-- Conexiones del DECODE
-- habilitar escritura banco de registros
signal sg_reg_we : std_logic;
-- habilitar escritura de Reg_Out
signal sg_out_we : std_logic;
-- habilitar escritura de Reg_A
signal sg_reg_a_we: std_logic;
-- Determinar operacion de la Alu
signal sg_alu_op : std_logic_vector (2 downto 0);
-- Seleccionar canal del Multiplexor
signal sg_bus_sel : std_logic_vector (1 downto 0);

-- Conexion del Reg_A con Alu
signal sg_rega_out: std_logic_vector(7 downto 0);

-- Banco de registro
-- senal para escribir en el banco de registro
signal sg_we: std_logic; 

-- ================

begin

-- ================
-- Instaciacion de componentes utilziados

-- Banco de registros
eregs:  regs port map   (
                              clk => clk
                            , rst => rst
                            , we => sg_we
                            , rd => sg_irout(3 downto 0)
                            , rs => sg_irout(7 downto 4)
                            , din => sg_bus2
                            , dout => sg_bus1 
                        ); -- hay que cpmpletar esta instanciación
-- La ALU
eAlu: alu port map  (
                          op => sg_alu_op
                        , a => sg_bus1
                        , b => sg_rega_out
                        , s => sg_bus2
                    );

-- La ROM de programa
eROM_Prog: rom_prog port map    ( 
                                      addr => sg_pc
                                    , output => sg_rom
                                );

-- El decodificador de la instrucción
eDecode: decode port map    ( 
                                  input => sg_irout(15 downto 8)
                                , reg_we => sg_reg_we
                                , out_we => sg_out_we
                                , reg_a_we => sg_reg_a_we
                                , alu_op => sg_alu_op
                                , bus_sel => sg_bus_sel
                            );

-- ================


-- ================
-- Descripción de mux que funciona como "bus"
-- controlado por bus_sel

elMux: mux3_1_8 port map    ( 
                                  a => sg_bus1
                                , b => sg_irout(7 downto 0)
                                , c => input
                                , ctl => sg_bus_sel
                                , s => sg_bus1
                            );

-- ================

-- ================
-- Descripción de los almacenamientos
-- Los almacenamientos que se deben decribir aca son: 
-- <reg_a> 8 bits
elRegA: reg8 port map
	(
        clk => clk
       ,we =>  sg_reg_a_we
       ,rst  => rst
       ,din => sg_bus1
       ,dout => sg_rega_out
        );

-- <reg_out> de 8 bits
elRegOut: reg8 port map
	(
        clk => clk
       ,we => sg_out_we
       ,rst  => rst
       ,din => sg_bus2
       ,dout => output
        );
-- <pc> de 8 bits
elPC: pc port map  (
                          clk => clk
                        , rst => rst
                        , s => sg_pc
                    );
-- <ir> de 16 bits
elIR: ir port map
	(
        clk => clk
       ,we => '1'
       ,rst  => rst
       ,din => sg_rom
       ,dout => sg_irout
        );

    --process (clk, rst)
    --begin
    --     if (rst='1') then           
    --      elsif (rising_edge(clk)) then          
    --      end if;          
    --end process;
-- ================


end Beh_Proc;
