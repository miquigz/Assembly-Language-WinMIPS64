#a) dadd r1, r2, r0

En este caso sumo r2 con el registro 0, el cual siempre vale 0.
Por lo tanto se podria decir que solamente estoy moviendo el valor al registro1. (Hago un mov r1, r2) 

#b) daddi r3, r0, 5

Para este caso, al igual que el anterior,
podemos tomarlo como si fuese un mov con direccionamiento inmediato. ya que muevo el valor 5 al registro 3

#c) dsub r4, r4, r4

resto un mismo registro y finalmente el resultado lo muevo hacia el mismo registro
Se podria decir que es un mov r4, 0

#d) daddi r5, r5, -1

Resto una unidad al registro r5, por lo tanto, esto es el equivalente a la instruccion DEC en el simulador MSX88 con arquitectura CISC.

#e) xori r6, r6, 0xffffffffffffffff

El equivalente a hacer un: xor r6, 0FFh  en el simulador MSX88 