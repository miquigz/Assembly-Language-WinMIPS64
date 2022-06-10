        .data
M:      .word  345
Tabla:  .word  352, 342, 124, 461, 24, 124, 52, 23, 41, 631
finT:   .byte  0
cantidad: .byte 0

        .text
        daddi   $a1, $0, Tabla 
        ld      $a0, M($0)
        jal     subru
        sb      $a3, cantidad($0)
        halt

subru:  sb  $t7, $a0($t5)
        slt    $t0, $a1, $a0
        bnez   $t0, sigNum
        daddi  $a3, $a3, 1 
sigNum: daddi  $t0, $0, 0
        daddi  $t5, $t5, 8
        bnez   $a0, lazo
        jr     $ra

#       - Documentacion Variables/registros: -
#$a1 Contiene la direccion en memoria de tabla
#$a0 Contiene el valor de M
#$a3 Registro contador de elementos mayores a M
#$t0 registro usado de AUX, para SLT
#$t5 Registro utilizado para movernos en la tabla de numeros ($a1)