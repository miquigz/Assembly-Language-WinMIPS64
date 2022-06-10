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

