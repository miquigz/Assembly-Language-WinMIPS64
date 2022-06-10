        .data
M:      .word  345
Tabla:  .word  352, 342, 124, 461, 24, 124, 52, 23, 41, 631
CantEle:  .byte  10
cantidad: .byte 0

        .text
        daddi   $a1, $0, Tabla 
        ld      $a0, M($0)
        jal     subru
        sb      $a3, cantidad($0)
        halt

subru:  ld  $t7, 0($a1)
lazo:   slt    $t0, $a1, $t7
        bnez   $t0, sigNum
        daddi  $a3, $a3, 1 
sigNum: daddi  $t0, $0, 0
        daddi  $a0, $a0, 8 # Sumo 8 bytes a la direccion, (64 bits)
        ld  $t7, 0($a0)#Repito codigo(malas practicas, mejorar).
        bnez   $t7, lazo
        jr     $ra

#       - Documentacion Variables/registros: -
#$a1 Contiene la direccion en memoria de tabla
#$t7 contiene el elemento actual de la tabla
#$a0 Contiene el valor de M
#$a3 Registro contador de elementos mayores a M
#$t0 registro usado de AUX, para SLT
#$t5 Registro utilizado para movernos en la tabla de numeros ($a1)