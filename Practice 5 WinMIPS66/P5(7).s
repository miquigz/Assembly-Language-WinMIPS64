#7) Escriba una subrutina que reciba como parámetros un número positivo M de 64 bits, la dirección del comienzo de una tabla que contenga valores numéricos de 64 bits sin signo y la cantidad de valores almacenados en dicha tabla.
#La subrutina debe retornar la cantidad de valores mayores que M contenidos en la tabla.

        .data
M:      .word  345
Tabla:  .word  352, 342, 124, 461, 24, 124, 52, 23, 41, 631
finT:   .byte  0
cantidad: .byte 0

        .text
        ld      $a0, M($0) # Parametros TABLA
        ld      $a1, Tabla($0)
        ld      $a2, finT($0)
        jal     subru
        sb      $a3, cantidad($0)
        halt
subru:  daddi  $t1, $t1, 1 #para comprar con SLT
lazo:   slt    $t0, $a1, $a0 # If ( Tabla[ele] < M ) = $t0 = 1
#Si elemento es menor a M entonces $T0 = 1
#Si elemento es Mayor a M entonces $t0 = 0

        bneq    $t0, $t1, sigNum # Si $t0 NO es IGUAL A 1
        daddi   $a3, $0, 1
        daddi   $t0, $t0, -1
sigNum: daddi  $a0, $a0, 8
        bnez   $a0, lazo #Si no termine la tabla sigo en la subrutina
        jr


        #me muevo de a 8posiciones, 8*8 = 64 bits
        #probar comparacion de bneq con dato inmediato en vez de $t1