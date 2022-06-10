6) Como ya se observó anteriormente, muchas instrucciones que normalmente forman parte del repertorio de un
procesador con arquitectura CISC no existen en el MIPS64. En particular, el soporte para la invocación a subrutinas es
mucho más simple que el provisto en la arquitectura x86 (pero no por ello menos potente). El siguiente programa
muestra un ejemplo de invocación a una subrutina.

            .data
valor1:     .word 16
valor2:     .word 4
result:     .word 0

            .text
            ld      $a0, valor1($zero) #argumento0 = 16
            ld      $a1, valor2($zero) #arg1       = 4
            jal     a_la_potencia #Salto a subrutina
            sd      $v0, result($zero) 
            halt

a_la_potencia:  daddi $v0, $zero, 1 # Valor de Retorno, agrego 1
lazo:       slt      $t1, $a1, $zero #Compara $Arg1 con 0
            bnez $t1, terminar # si ($a1 < 0), then jump to etiq
            daddi $a1, $a1, -1 # voy restando arg1
            dmul $v0, $v0, $a0 #Multiplico Arg0 con valor de retorno 1
            j lazo
terminar:   jr $ra





a) ¿Qué hace el programa? ¿Cómo está estructurado el código del mismo?
# El programa lleva a la potencia el valor1, volcado en el registro argumento0, dicha potencia es dictada(valor2) por el valor del registro $a1(argumento1)
# ... se produce una subrutina la cual tiene un bucle/ciclo de iteracciones hasta que el valor1 sea potenciado al valor2, finalmente termina el programa volcando el resultado (el cual es cargado en las iteraciones del bucle en $v0(registro valor de retorno)) en memoria en la etiq result.
b) ¿Qué acciones produce la instrucción jal? ¿Y la instrucción jr?
# La instruccion jal salta a una subrutina, ... salta a la etiqueta especificada en dicha instruccion, esta etiqueta contiene la direccion en memoria de la subrutina.
#La instruccion JR vuelve al programa principal, tomando el valor del registro r31($ra), dicho reg contiene la direccion de retorno de la subrutina, (contiene la direccion de la instruccion inmediata posterior a el jal tomado anteriormente) ... lo que hace JR es saltar en memoria al valor contedio de r31($ra)
c) ¿Qué valor se almacena en el registro $ra? ¿Qué función cumplen los registros $a0 y $a1? ¿Y el registro $v0?
#$ra almacena la direccion siguiente a la instruccion JAL(JUMP AND LINK), LA INSTRUCCION INMEDIATA POSTERIOR AL JAL. Por lo tanto $RA contiene la direccion de retorno
# $a0 y $a1 son parametros(argumentos), enviados a la subrutina para que sean posteriormente utilizados por la misma, dichos registros son previamente cargados en el programa principal.
# el registro $v0 es utilizado para retornar datos de la subrutina llamada. (Ya sea para que los use el programa principal, u otra subrutina declarada(en caso de que haya anidamiento)).
d) ¿Qué sucedería si la subrutina a_la_potencia necesitara invocar a otra subrutina para realizar la multiplicación,
por ejemplo, en lugar de usar la instrucción dmul? ¿Cómo sabría cada una de las subrutinas a que dirección de
memoria deben retornar?
#Para esto deberiamos utilizar la pila, para guardar primeramente la dir de RETORNO de la subrutina primeramente declarada, luego posterior a ello, llamamos a otra subrutina.