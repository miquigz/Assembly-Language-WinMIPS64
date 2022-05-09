        .data
A:      .word       5 #multiplicando
B:      .word       23#multiplicador
Res:    .word       0 #Res(producto)

        .text
        lb		$t0, A($0)#valor A 
        lb		$t1, B($0)#
        beq             $t1, $0, fin    #       [CASO B = 0]
loop:   daddi		$t1, $t1, -1    # DEC B
        dadd            $t7, $t7, $t0   # Res= Res + valor A
        bne             $t1, $0, loop	# Si B <> 0, then jump to loop
fin:    sb              $t7, Res($0) 
        halt