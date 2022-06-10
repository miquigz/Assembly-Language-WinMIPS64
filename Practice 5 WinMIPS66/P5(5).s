El procesador MIPS64 posee 32 registros, de 64 bits cada uno, llamados r0 a r31 (también conocidos como $0 a $31).
Sin embargo, resulta más conveniente para los programadores darles nombres más significativos a esos registros.
La siguiente tabla muestra la convención empleada para nombrar a los 32 registros mencionados:
Registros Nombres ¿Para que se los utiliza? ¿Preservado?
r0 $zero            #Siempre vale 0
r1 $at              #
r2-r3 $v0-$v1       #    
r4-r7 $a0-$a3       #
r8-r15 $t0-$t7      #   
r16-r23 $s0-$s7     #   
r24-r25 $t8-$t9     #   
r26-r27 $k0-$k1     #   
R28 $gp             #
R29 $sp             #   
R30 $fp             #
R31 $ra             #

Complete la tabla anterior explicando el uso que normalmente se le da cada uno de los registros nombrados. Marque
en la columna “¿Preservado?” si el valor de cada grupo de registros debe ser preservado luego de realizada una
llamada a una subrutina. Puede encontrar información útil en el apunte Programando sobre MIPS64