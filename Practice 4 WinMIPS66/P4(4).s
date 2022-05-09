4) * Dado el siguiente programa:
.data
tabla: .word 20, 1, 14, 3, 2, 58, 18, 7, 12, 11
num: .word 7
long: .word 10
.code
ld r1, long(r0)
ld r2, num(r0)
dadd r3, r0, r0
dadd r10, r0, r0
loop: ld r4, tabla(r3)
beq r4, r2, listo
daddi r1, r1, -1
daddi r3, r3, 8
bnez r1, loop
j fin
listo: daddi r10, r0, 1
fin: halt

a) Ejecutar en simulador con Forwarding habilitado. ¿Qué tarea realiza? ¿Cuál es el resultado y dónde queda indicado?

#Va recorriendo una tabla de elementos(numeros), cada elemento vale 8 bytes, por lo tanto se va desplazando de a 8 bits mediante el registro R3. 
#Esto mismo sucede hasta que la tabla se termine, o previamente encontremos un elemento en dicha tabla, que sea igual al valor num (alojado en el registro2). Por lo tanto se hacen 2 comparaciones en dicho recorrido; si X elemento es == a R2, y si la LongitudTabla == 0. 

#Si encontre o no encontre dicho elemento igual a valor del reg2; queda indicado en registro r10 (con un 1 = true), 0 = false.

b) Re-Ejecutar el programa con la opción Configure/Enable Branch Target Buffer habilitada. Explicar la ventaja de usar este método y cómo trabaja.

#Este metodo guarda un historico de saltos, por lo cual reduce considerablemente la cantidad de veces que se producen atascos de Branch Taken (En dicho Atasco: incorporamos erroneamente instrucciones al pipeline, atascos producidos por saltos).
#La primera ejecucion de un salto guarda ese salto en el historico, por lo cual, la primera vez falla, posteriormente las instrucciones son acertadas, a excepcion de la 'ultima, que es donde el salto condicional no se cumple. Por lo tanto, avanzo hacia una siguiente instruccion.
# De este modo, el Branch Target Buffer 'unicamente falla la primera y la 'ultima ejecucion de un salto condicional. Esto mismo provee una gran ventaja cuando las iteraciones son considerablemente grandes.
c) Confeccionar una tabla que compare número de ciclos, CPI, RAWs y Branch Taken Stalls para los dos casos anteriores.
#Con forwarding activado: 71 CICLOS, 43 instrucciones, CPI: 1.651, 16 ATASCOS RAW, 8 ATASCOS BRANCH TAKEN
#Con Branch Taken Stalls: 75 CICLOS, 43 instrucciones, CPI: 1.744, 24 ATASCOS RAW, 4 ATASCOS BRANCH TAKEN

#Ambos activados:         67 CICLOS, 43 instrucciones, CPI:1.558, 17 ATASCOS RAW, 4 ATASCOS BRANCH TAKEN

#SI EJECUTAMOS FORWARDING Y Branch target Buffer habilitados, el CPI sigue mejorando considerablemente.