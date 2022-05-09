5) El siguiente programa multiplica por 2 los elementos de un arreglo llamado datos y genera un nuevo arreglo llamado res.
Ejecutar el programa en el simulador winmips64 con la opción Delay Slot habilitada.
.data
cant: .word 8
datos: .word 1, 2, 3, 4, 5, 6, 7, 8
res: .word 0
.code
dadd r1, r0, r0
ld r2, cant(r0)
loop: ld r3, datos(r1)
daddi r2, r2, -1
dsll r3, r3, 1
sd r3, res(r1)
daddi r1, r1, 8
bnez r2, loop
nop
halt
#EL PROGRAMA EN SI: multiplica por 2 todos los numeros de la tabla datos. es decir, muevo un bit a la izquierda. (dsll)

a) ¿Qué efecto tiene habilitar la opción Delay Slot (salto retardado)?.
#Activar el metodo de delay slot hace que tomemos en cuenta la siguiente instruccion de un salto condicional, y la incluyamos en el pipeline.
#De este modo, sin importar si el salto condicional va a saltar o no, la instruccion posterior a ese salto, tambien va a ser efectuada. 
b) ¿Con qué fin se incluye la instrucción NOP? ¿Qué sucedería si no estuviera?.
#Se incluye debido a que esta el metodo de delay slot activado, si este no estuviera, al estar unicamente la instruccion halt luego del salto condicional. Este halt se tendria en cuenta y entraria dentro del pipeline, para posteriormente ser ejecutado. 
#Esto mismo afectaria la semantica del programa, entonces utilizamos una instruccion nula (NOP), para evitar que el programa en s'i se "rompa".
c) Tomar nota de la cantidad de ciclos, la cantidad de instrucciones y los CPI luego de ejecutar el programa.
#88 CICLOS, 59 INSTRUCCIONES, CPI: 1.492, 25 ATASCOS RAW
d) Modificar el programa para aprovechar el „Delay Slot‟ ejecutando una instrucción útil. Simular y comparar número de ciclos, instrucciones y CPI obtenidos con los de la versión anterior.
#Obtenemos los mismos ciclos, instruciones y CPI, ya que la instruccion NOP, es esto, una instruccion, por m'as que sea nula es contabilizada en las estadisticas del simulador.