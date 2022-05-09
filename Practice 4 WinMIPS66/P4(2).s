2) * El siguiente programa intercambia el contenido de dos palabras de la memoria de datos, etiquetadas A y B.
    .data
A: .word 1
B: .word 2

    .code
    ld r1, A(r0)
    ld r2, B(r0)
    sd r2, A(r0)
    sd r1, B(r0)
    halt



a) Ejecutarlo en el simulador con la opción Configure/Enable Forwarding deshabilitada. Analizar paso a paso su
funcionamiento, examinar las distintas ventanas que se muestran en el simulador y responder:
- ¿Qué instrucción está generando atascos (stalls) en el cauce (ó pipeline) y por qué?
#  es un atasco por dependencia de datos (RAW)
#la instruccion ld r2 (LOAD R2), todavia no esta en la etapa de WB, ...
#el sd r2(STORE R2), no puede acceder al registro r2, ya que el valor no fue cargado(todavia). Una vez finalizada la etapa de Writeback (WB) de la instruccion ld r2, recien puedo concretar el ciclo EX de la instruccion SD.  

- ¿Qué tipo de „stall‟ es el que aparece?
# Tipo: RAW 
- ¿Cuál es el promedio de Ciclos Por Instrucción (CPI) en la ejecución de este programa bajo esta configuración?
# El promedio es 2.2 ciclos por instruccion

b) Una forma de solucionar los atascos por dependencia de datos es utilizando el Adelantamiento de Operandos o Forwarding.
Ejecutar nuevamente el programa anterior con la opción Enable Forwarding habilitada y responder:
- ¿Por qué no se presenta ningún atasco en este caso? Explicar la mejora.
# Debido a que esta el adelantamiento activado (forwarding), nos permite 
- ¿Qué indica el color de los registros en la ventana Register durante la ejecución?
# Indica que dicho registro esta siendo modificado, ya sea cargandole valor/datos o haciendo alguna operacion aritmetica.
- ¿Cuál es el promedio de Ciclos Por Instrucción (CPI) en este caso? Comparar con el anterior.
# El promedio es de 1.8 ciclos por instruccion mucho menor al anterior.
