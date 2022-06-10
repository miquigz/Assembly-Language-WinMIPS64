9) * Escriba la subrutina ES_VOCAL, que determina si un carácter es vocal o no, ya sea mayúscula o minúscula. La rutina
debe recibir el carácter y debe retornar el valor 1 si el carácter es una vocal, o 0 en caso contrario

        .data
CHAR:   .asciiz "M"
Res:     .byte   16 # Res = a F , hasta q cargue valor

        .text
        lbu       $a0,   CHAR($0)# no tengo cuenta en signo, ya q es ASCII
        jal		  ES_VOCAL
        sb		  $s0, Res($0)
        halt

ES_VOCAL:





