        .data
cantX: .word     0
Corte:  .word       88 # 11 * 8 = 88
X:      .word       14
TABLA:  .word       2
        .word       19
        .word       8
        .word       15
        .word       19
        .word       24
        .word       7
        .word       62
        .word       2
        .word       87

        .text
        lb			$t1, TABLA($0)
        lb          $t2, X($0)
        dadd        $t7, $0, $0# ContadorMayorX
        daddi       $t8, $t8, 1
        lb          $t5, Corte($0)
        dadd        $t0, $0, $0# ContadorBits

loop:   slt	$t9, $t2, $t1
        bne	$t9, $t8, sigNum
        daddi   $t7, $t7, 1
        dadd    $t9, $0, $0
        nop
        nop
sigNum: daddi   $t0, $t0, 8
        bne		$t0, $t5, loop
        sb			$t7, cantX($0)
        halt

        #t0 Contador bits en tabla,     $t7 ContadorMayorX
        #$t5 Valor de corte(88 bits), 
        #$t8 Valor 1, para comparar bne con t9
        #$t1 tabla, #t2 valor X, $t9 Valor Destino para SLT
