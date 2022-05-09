        .data
A:      .word   2 #.word = 8 bits
B:      .word   3
C:      .word   3
D:      .word   0

        .text
        lb			$t0, A($0)			# 
        lb			$t1, B($0)			# 
        lb			$t2, C($0)			# 
        lb          $t3, D($0)
        beq			$t0, $t1, caso1	# if A == B then caso1
#SI NO SALTA ES PORQ ESTOY EN: CASO2
        beq         $t0, $t2, fin2
#si no salte, entonces hago otra comp
        bne         $t1, $t2, fin # SI C != B, then jump to fin, d=0
        #En cambio si  C == B, sumo a continuacion, D = 2
fin2:   daddi       $t3, $t3, 2
        j            fin
caso1:  daddi		$t3, $t3, 2
        bne         $t0, $t2, fin# if A != C then jump to fin
        daddi       $t3, $t3, 1
#        j			fin				# jump to fin
fin:    sb          $t3, D($0)	#vuelco el valor de t3 en D  
        halt