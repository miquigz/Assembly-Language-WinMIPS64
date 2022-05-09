        .data
cadena: .asciiz "ifloseallslipandfall" #ASCCIZ -STRING Q TERMINA EN 0 . 1 byte por char, ... NO AVANZO DE A 8, SINO DE A 1 EN 1.
char:   .asciiz "s"
cant:   .word   0

        .text
        dadd		$t7, $0, $0
        lb		$t0, cadena($t7)
        lb		$t1, char($0)
        lb		$t2, cant($0)
loop:   bne		$t0, $t1, sigNum
        daddi		$t2, $t2, 1
sigNum: daddi		$t7, $t7, 1
        lb		$t0, cadena($t7)
        bnez            $0, loop
        sb		$t2, cant($0)
        halt
        #T0 cadena, t1 char a analizar,t2 cant, t7 reg para desplazarme