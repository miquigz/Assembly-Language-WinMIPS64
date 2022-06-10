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

subru:  lbu     $t1, 0($a1)
        lbu     $t2, 0($a2) 
        daddi  $s1, $s1, 1
        beq	    $t1, $t2, iguales
        beqz    $t1, fin
        beqz    $t2, fin
sigNum: daddi   $a1, $a1, 1
        daddi   $a2, $a2, 1
        j subru
iguales:    bnez    $t1, sigNum
        daddi   $s1, $0, -1
fin:    jr      r31

#           Documentacion de Registros usados:
#$a1 Contiene la [direccion] de cadena1 (Argumento de subrutina)
#$a2 Contiene la [direccion] de cadena2 (Argumento de subrutina)
# $t1 Contiene un elemento de la cadena1, (sujeto a cambios durante la subrutina)
# $t2 , Idem $t1, pero con cadena2
#$s1 Contiene el valor de las posiciones que van incrementandose a medida que recorremos las cadenas de texto, (Registro salvado, valor a retornar)
#Etiqueta(mem) "Pos": Contendra el resultado una vez terminado el programa