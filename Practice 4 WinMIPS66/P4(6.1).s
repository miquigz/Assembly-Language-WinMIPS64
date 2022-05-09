        .data
A:      .word   2
B:      .word   3
C:      .word   3
D:      .word   0

        .text
        lb			$t0, A($0)			 
        lb			$t1, B($0)			 
        lb			$t2, C($0)			
        lb          $t3, D($0)
        beq			$t0, $t1, caso1
        beq         $t0, $t2, fin2
        bne         $t1, $t2, fin
fin2:   daddi       $t3, $t3, 2
        j            fin
caso1:  daddi		$t3, $t3, 2
        bne         $t0, $t2, fin
        daddi       $t3, $t3, 1
fin:    sb			$t3, D($0)
        halt