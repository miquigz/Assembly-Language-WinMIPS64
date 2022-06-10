8) * Escriba una subrutina que reciba como parámetros las direcciones del comienzo de dos cadenas terminadas en cero y
retorne la posición en la que las dos cadenas difieren. En caso de que las dos cadenas sean idénticas, debe retornar -1.

        .data
CAD1:   .asciiz "holacomoandas"
CAD2:   .asciiz "holacomoestas"
Pos:    .byte   0

        .text
        daddi $a1, $a1, CAD1
        daddi $a2, $a2, CAD2

        jal subru
        sw  $s1, Pos($0)
        halt

subru:  lbu     $t1, 0($a1) #Cargo ELE cad1
        lbu     $t2, 0($a2) #Cargo ELE cad1
        daddi  $s1, $s1, 1 # Sumo posiciones movidas
        beq	    $t1, $t2, iguales# El hipotetico caso donde las dos cadenas terminen al mismo tiempo es donde las dos sean iguales a 0, por lo tanto pregunto primeramente esta condicion.
        beqz    $t1, fin
        beqz    $t2, fin
sigNum: daddi   $a1, $a1, 1 # Sumo 1 byte ambas cadenas
        daddi   $a2, $a2, 1
        j subru
iguales:    bnez    $t1, sigNum # Es indistinto $t1 o $t2(ya que si llegue a esta instancia deben ser iguales), por lo tanto pregunto directamente en $t1 si es igual a 0.
        daddi   $s1, $0, -1 # Si es igual a 0, quiere decir que ambas son identicas en cuanto a longitud de cadena. por lo tanto retorno -1 en $s1

fin:    jr      r31
