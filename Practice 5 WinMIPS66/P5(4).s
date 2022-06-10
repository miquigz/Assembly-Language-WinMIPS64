        .data
peso:   .double     55.7
altura: .double     1.79
IMC:    .double     0
dos:    .double     2

        .text
        l.d         f2, altura($0)
        l.d         f3, dos($0) #cambiar; Malas practicas, usar r2, pasasr a F, y luego F a PF en un reg F
        l.d         f1, peso($0)
        mul.d       f4, f2, f3
        div.d       f5, f4, f1
        s.d			f5, IMC($0)
        halt