# Informe de trabajo práctico - Procesador
#### Cursada
Diseño lógico 2018

##### Alumnos
Chavez Matías

Lottero Bruno

### Índice

 - [Descripción del diseño](#descripción-del-diseño)
	 - [Memoria de instrucciones](#memoria-de-instrucciones-rom)
	 - [Registro de instrucción](#registro-de-instrucción-ir)
	 - [Contador de programa](#contador-de-programa-pc)
	 - [Unidad de decodificación](#unidad-de-decodificación-decode)
	 - [Banco de registros](#banco-de-registros-regs)
	 - [Registro acumulador y Registro de salida](#registro-acumulador-reg_a-y-registro-de-salida-reg_out)
	 - [Unidad aritmético lógica](#unidad-aritmético-lógica-alu)
	 - [MUX de tres entradas de 8 bits](#mux-de-tres-entradas-de-8-bits)
 - [Problemas encontrados y sus respectivas soluciones](#problemas-encontrados-y-sus-respectivas-soluciones)
 - [Programa a ejecutar](#programa-a-ejecutar)
 - [Conclusiones](#conclusiones)

## Descripción del diseño

Para el desarrollo del procesador se decidió llevar a cabo un diseño jerárquico *bottom-up*, en donde el procesador se describe por instanciación de componentes más pequeños. 

Uno de los beneficios que encontramos sobre esta forma de diseño es que nos permitió hacer testbench de manera temprana sobre cada uno de los componentes, brindando una mejor seguridad sobre el correcto funcionamiento del desarrollo final.

Sobre el diseño del procesador, podemos observar que su nivel de abstracción es RTL (Register-Transfer level) ya que en el mismo se declaran registros y lógica que opera entre estos. Por lo tanto, podemos pensar que no debería haber mayores problemas para sintetizar la descripción realizada.

A continuación se exponen detalles de diseño de cada uno de los componentes:

### Memoria de instrucciones (ROM)

 - Estilo de descripción
	 - algorítmico

### Contador de programa (PC)

 - Estilo de descripción
	 - algorítmico

### Registro de instrucción (IR)

 - Estilo de descripción
	 - algorítmico

### Unidad de decodificación (Decode)

 - Estilo de descripción
	 - algorítmico

En un principio fué descripto por *flujo de datos*:

```vhdl
architecture decode_beh of decode is
begin
	bus_sel <= "10" when input=x"01" else "01" when input=x"05" else "00";
	reg_a_we <= '1' when (input=x"04" or input=x"05") else '0';
	...
	...
end decode_beh;
```
Pero finalmente fué descartado por no contemplar el estado deconocido forzado.

Nos resultaría interesante saber de qué manera beneficia en este punto la minimización a pesar de que en la cursada no pudimos ver dicho tema.

### Banco de registros (Regs)

 - Estilo de descripción
	 - algorítmico

### Registro acumulador (Reg_a) y Registro de salida (Reg_out)
 
 - Se instancian del mismo componente (reg8) 
 - Estilo de descripción
	 - algorítmico

### Unidad aritmético lógica (ALU)

 - Estilo de descripción
	 - Flujo de datos
	 
### MUX de tres entradas de 8 bits

- Estilo de descripción
	 - Flujo de datos 

## Problemas encontrados y sus respectivas soluciones

 - No se logró utilizar la función *conv_integer()* en el esqueleto provisto de *Regs.vhd*
	 - Solución: Se decidió utilizar *to_integer()* de la librería *IEEE.NUMERIC_STD*

 - Hay una inconsistencia en las conexiones del banco de registros entre el esquemático y la tabla de descripción de instrucción. En la tabla figura ***instrucción + rd + rs*** y en el esquema ***rd*** y ***rs*** figuran al revés.
	 - Solución: Se asumió que la descripción correcta es la de la tabla.

 - En el programa indicado (Pto. 3) hay instrucciones **OUT** sobre registros (**r8** y **r13**) en los que nunca se escribe.
	 - Solución: Decidimos cambiar el conjunto de instrucciones para que se escriba sobre dichos registros y como extra para probar el resto de las instrucciones que el programa original no contempla. Ver [Programa a ejecutar](#programa-a-ejecutar)

## Programa a ejecutar

Hicimos algunos cambios al programa almacenado, para utilizar los registros faltantes y probar las demás instrucciones.

| índice | instrucción | valor |
|--|--|--|
| 0 | IN r3 | 00000011 |
| 1 | LDA r3 | |
| 2 | ADD r4, r3 |
| 3 | SUB r5,r4 |
| 4 | OR r6,r4 |
| 5 | AND r7,r0 |
| 6 | MOV r14,r4 |
| 7 | LDI | 10101010 |
| 8 | IN r8 | 00000011 |
| 9 | XOR r13,r8 |
| 10 | SHR r9,r8 |
| 11 | SHL r10,r13 |
| 12 | OUT r3 |
| 13 | OUT r4 |
| 14 | OUT r5 |
| 15 | OUT r6 |
| 16 | OUT r7 |
| 17 | OUT r8 |
| 18 | OUT r9 |
| 19 | OUT r10 |
| 20 | OUT r13 |
| 21 | OUT r14 |

## Conclusiones

#### Sobre el lenguaje y la herramienta (ModelSim)
Nos resultó positivo que la herramienta esté disponible para estudiantes con licencia gratuita de seis meses de duración. Por otro lado quisieramos remarcar que fué dificultoso trabajar en conjunto y de forma remota sobre el mismo proyecto utilizando un repositorio, ya que los archivos de proyecto (.mpf) parecen guardar rutas absolutas, haciendo dificil trabajar en diferentes computadoras.

En el apartado del aprendizaje del lenguaje, coincidimos en que las mayores dificultades se presentaron sobre los primeros contactos con VHDL y el simulador, siendo quizás los errores de compilación los problemas que mas nos llevó tiempo comprender. Luego de algunas horas de práctica notamos que la curva de aprendizaje fué mas sencilla.

Por último, queremos concluír que VHDL nos resultó una herramienta muy poderosa para realizar esta simulación. Por otro lado, el trabajo que nos ha servido como puerta de entrada al lenguaje, nos deja con la expectativa a futuro de experimentar con herramientas de síntesis y tal vez con una FPGA.

