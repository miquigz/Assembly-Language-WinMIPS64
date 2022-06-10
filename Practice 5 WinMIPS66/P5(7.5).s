        .data
M:      .word  345
Tabla:  .word  352, 342, 124, 461, 24, 124, 52, 23, 41, 631
CantEle:  .byte  10
cantidad: .byte 0

        .text
        daddi   $a1, $0, Tabla
        ld      $a0, M($0)
        ld      $a2. CantEle($0)
        sb      $a3, cantidad($0)
        jal     subru
        halt

subru:  ld  $t7, 0($a1)
        slt    $t0, $a1, $t7
        bnez   $t0, sigNum
        daddi  $a3, $a3, 1
sigNum: daddi  $t0, $0, 0
        daddi  $a0, $a0, 8 # Sumo 8 bytes a la direccion, (64 bits)
        daddi  $a2, $a2, -1 # Resto CantEle
        bnez   $a2, subru # Si $a2 <> 0 , salto subru
        jr     $ra