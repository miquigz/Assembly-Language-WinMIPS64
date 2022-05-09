        .data
A:      .word   6
X:      .word   0
Y:      .word   2
        .text
        lb			$t0, A($0)
        lb			$t2, Y($0)
        lb			$t1, X($0)
        beqz		$t0, fin #CASO A = 0
loop:   daddi       $t0, $t0, -1
        dadd		$t1, $t1, $t2
        bnez		$t0, loop#if $t0 <> 0 then jump to loop
fin:    sb			$t1, X($0)
        halt
        #si A <> 0, ..., a > 0
        #Damos por sentado que A es un valor entero positivo