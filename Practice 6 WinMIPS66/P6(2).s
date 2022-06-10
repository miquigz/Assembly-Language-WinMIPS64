2) Escriba un programa que utilice sucesivamente dos subrutinas: La primera, denominada ingreso, debe solicitar el
ingreso por teclado de un número entero (de un dígito), verificando que el valor ingresado realmente sea un dígito. La
segunda, denominada muestra, deberá mostrar en la salida estándar del simulador (ventana Terminal) el valor del
número ingresado expresado en letras (es decir, si se ingresa un ‘4’, deberá mostrar ‘CUATRO’). Establezca el pasaje de
parámetros entre subrutinas respetando las convenciones para el uso de los registros y minimice las detenciones del cauce
(ejercicio similar al ejercicio 6 de Práctica 2).



        .data
control: .word32    0x10000
data:    .word32    0x10008


        .text
        lwu     $a0,    control($0)
        lwu     $a1,    data($0)
        jal ingreso

ingreso: daddi  $t0, $0, 8
        sb  $t0, 0($a0)
        lbu     $t1, 0($a1) #$t1 cargo DATA, ..., tengo Num ingresado
        slti	$t0, $t1, 10 # t1 < 10, t0 = 1, SINO t0=0
        $t0 = 0, ..., $t1 es mayor a 10 o igual
        beqz      $t0, Digitos
        dadd $s0, $0, $t1
        j UnDigito
Digitos: daddi $a2, $a2, 10
UnDigito: 



