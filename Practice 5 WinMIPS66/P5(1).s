1) Simular el siguiente programa de suma de números en punto flotante y analizar minuciosamente la ejecución paso a
paso. Inhabilitar Delay Slot y mantener habilitado Forwarding.

        .data
n1:     .double 9.13
n2:     .double 6.58
res1:   .double 0.0
res2:   .double 0.0

        .text
        l.d     f1, n1(r0)
        l.d     f2, n2(r0)
        add.d   f3, f2, f1
        mul.d   f4, f2, f1
        s.d     f3, res1(r0)
        s.d     f4, res2(r0)
        halt
a) Tomar nota de la cantidad de ciclos, instrucciones y CPI luego de la ejecución del programa.
# 16 Ciclos, 7 instrucciones, CPI 2.286
b) ¿Cuántos atascos por dependencia de datos se generan? Observar en cada caso cuál es el dato en conflicto y las
instrucciones involucradas.
#4 atascos por dependencia de datos(RAW).
#Los atascos en instrucciones en punto flotante son producidos en la etapa de EX, en cambio en las instrucciones de enteros son producidas en la etapa de ID(decodificacion).
#El primer atasco es producido, debido a que: la instruccion load todavia no termina de escribir el registro f2, por lo tanto, la instruccion de ADD en punto flotante, quiere tomar ese valor, pero aun no tiene un valor intrinseco cargado.'
#Los Dos atascos RAW siguientes, producidos en la instruccion SD, son debido a que la instruccion de add, a'un no llega a la etapa de MEM(por forwarding en esa etapa ya tendriamos el valor de f3).

c) ¿Por qué se producen los atascos estructurales? Observar cuales son las instrucciones que los generan y en qué
etapas del pipeline aparecen.
#Se producen debido a que queremos acceder a una misma estructura(hardware) del pipeline al mismo tiempo en 2 o mas instrucciones, por lo tanto, se produce dicho stall. Un ejemplo son los 2 stall de este mismo programa, en los que se intenta acceder a memoria, cuando ya hay otra instruccion accediendo a memoria. En estos casos, se determina cual va a ser el que va a acceder primero; la instruccion que antes haya sido iniciada.
d) Modificar el programa agregando la instrucción mul.d f1, f2, f1 entre las instrucciones add.d y mul.d.
Repetir la ejecución y observar los resultados. ¿Por qué aparece un atasco tipo WAR?
#
e) Explicar por qué colocando un NOP antes de la suma, se soluciona el RAW de la instrucción ADD y como consecuencia se elimina el WAR.
#
