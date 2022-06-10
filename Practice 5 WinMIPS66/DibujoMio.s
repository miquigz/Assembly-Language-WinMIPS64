            .data
CONTROL:    .word32     0x10000
DATA:       .word32     0x10008
COLOR:      .byte       139, 25, 52

            .text
            LWU     $a0,    CONTROL($0)
            LWU     $a1,    DATA($0)


            daddi       $t1, $0, 25
            sb          $t1, 4($a1)
            daddi       $t1, $0, 25
            sb          $t1, 5($a1)

            daddi       $t5, $0, 5
            sb          $t5, 0($a0)


            daddi       $a2, $a2,


puntoEn:    sw          $a3, 0($a1)
            





            #Hacer una subrutina que haga un punto con los argumentos pasados por mi, DATA, CONTROL, X - Y
            halt