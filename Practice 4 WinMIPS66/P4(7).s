        .data
cantidad: .word     0
Corte:  .word       88 # 11 * 8 = 88
X:      .word       14
TABLA:  .word       2
        .word       6
        .word       8
        .word       15
        .word       19
        .word       24
        .word       7
        .word       62
        .word       2
        .word       87

        .text
        lb			$t1, TABLA($0)#t1 = tabla
        lb          $t2, X($0)#t2 = valor X

        daddi       $t8, $t8, 1 #Valor1
        lb          $t5, Corte($0) # $Corte(88)
        daddi       $t0, $t0, 0 # t0 = registro contador
loop:   slt		$t9, $t2, $t1	#$t9 = (X < eleTabla) ,$t9(1 o 0 )
# Si X es menor a ELE TABLA, cuento que hay un ele mayor a X, \ t9 =1
        bne		$t9, $t8, sigNum #if $t9 != 1 then sigNum
        dadd    $t9, $0, $0 # $t9 = 0
        daddi   $t7, $t7, 1 #INCREMENTO 1, Mayores a X
sigNum: daddi   $t0, $t0, 8# Avanzo en tabla
        bne		$t0, $t5, loop
        sw			$t7, cantidad($0)
        halt


        #t0 Contador bits en tabla,     $t7 ContadorMayorX
        #$t5 Valor de corte(88 bits), 
        #$t8 Valor 1, para comparar bne con $t9
        #$t1 tabla, #t2 valor X, $t9 Valor Destino para SLT