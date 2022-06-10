        .data
M:      .word  345
Tabla:  .word  352, 342, 124, 461, 24, 124, 52, 23, 41, 631
finT:   .byte  0
cantidad: .byte 0

        .text
        daddi   $a1, $0, Tabla #  DIRECCION de TABLA
        ld      $a0, M($0) # VALOR de M
        #ld     $a2, finT($0) # Valor de 0
        jal     subru
        sb      $a3, cantidad($0) # Al volver vuelco el resultado en mem
        halt

subru:  sd  $t7, $a0($t5)
        slt    $t0, $a1, $a0 #Si ele < M, $t0 = 1
        bnez   $t0, sigNum# Si es <> de 0, quiere decir que elemento es Menor, ..., no lo cuento.
        daddi  $a3, $a3, 1 #Voy sumando la cantidad de elementos mayor a M
sigNum: daddi  $t0, $0, 0 #Nuevo num = establezco en 0 a $t0
        daddi  $t5, $t5, 8 # SUMO 8 al registro $A0
        daddi  $a0, 
        bnez   $a0, lazo
        jr     $ra
        #me muevo de a 8posiciones, 8*8 = 64 bits
        #probar comparacion de bne con dato inmediato en vez de $t1
        #PRIMER CASO: ELEMENTO < M, QIERE DECIR ES = A 1
        #SEGUNDO CASO: ELEMENTO > M, quiere decir que T0 = A 0



#$t5 Registro utilizado para movernos en la tabla de numeros ($a1)
#