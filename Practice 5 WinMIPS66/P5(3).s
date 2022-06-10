3) * Escribir un programa que calcule la superficie de un triángulo rectángulo de base 5,85 cm y altura 13,47 cm.
Pista: la superficie de un triángulo se calcula como:
Superficie = (base x altura) / 2

        .data
base:   .double     5.85
altura: .double     13.47
superficie:     .double     0

        .text
        l.d        f0, base($0)
        l.d        f1, altura($0)

        mul.d      f3, f0, f1 # base * altura

        daddi      r2, r0, 2
        mtc1       r2, f4
        cvt.d.l    f5, f4 #Convierto f5 a 2.0

        div.d      f6, f3, f5 # F6 =(f0 * f1) / f5 
        s.d        f6, superficie($0)
        halt