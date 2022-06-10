        .data
control:    .word32     0x10000
data:       .word32     0x10008
text        .asciiz     "hi world"
Cargar:     .asciiz     "A"

        .text
        lwu     $a0, control($0)
        lwu		$a1, data($0)			# 
        daddi   $a2,  $0, Cargar

        jal subru   
        daddi   $t0, $0, 4
        sb      $t0,   0($a0)
        halt

subru:  daddi   $t0, $0, 9
loop:   daddi   $t1, $t1, 1
        sb		$t0, 0($a0)# Cargo 9 en Control
        lbu     $t1, 0($a1)#Tomo los 8 bits menos significativos de data, sin tener en cuenta el signo.
        sb      $t1, Cargar($t4)
        daddi   $t4, $t4, 1
        bne	    $t1, ".", loop
        daddi   $t1, $0, "0"
        sb      $t1, Cargar($t4)
        jr		$ra #Vuelvo