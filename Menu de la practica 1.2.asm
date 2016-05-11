#ESTRUCTURA DE COMPUTADORES
#CURSO 2013-2014
#EJEMPLO DE MENÚ GENÉRICO CON BIFURCACIONES Y CONTROL SOBRE LOS DATOS INTRODUCIDOS
#Copyright PEDRO GARCÍA GUILLÉN

.data
Si: 	 .word   's'
cadena1: .asciiz "\n\n MENU DE OPERACIONES\n"
cadena2: .asciiz "1.- Sumar números\n"
cadena3: .asciiz "2.- Restar números\n"
cadena4: .asciiz "3.- Multiplicar números\n"
cadena5: .asciiz "5.- Salir\n\t"
cadena6: .asciiz "Introduce opcion: "
cadena61:.asciiz "Opción no válida.\n"
cadena7: .asciiz "Introduce el primer número: "
cadena8: .asciiz "Introduce el segundo número: "
cadena9: .asciiz "La suma es "
cadena10: .asciiz "La resta es "
cadena11: .asciiz "El producto es "
cadena12: .asciiz "\n\nFin del programa. Adios ..."
cadena13: .asciiz "4.- Dividir numeros\n"
cadena14: .asciiz "El cociente es "
cadena15: .asciiz "\nEl resto es "
cadena16: .asciiz "No se puede dividir entre 0!!!!!\n"
cadena17: .asciiz "\nDesea realizar otra operacion (S/N)"
cadena18: .asciiz "Division no entera\n"
cadena19: .asciiz "Resultado de la operación mayor de 99. Vuelve a intentarlo\n"
cadena20: .asciiz "Resultado de la operación menor de 0. Vuelve a intentarlo\n"
cadena21: .asciiz "No puedes introducir un numero negativo\n"


 .text
 main:
 
 menu:
 li $v0, 4			# LLamada a imprimir cadena
 la $a0, cadena1		# Muestra la cadena por pantalla
 syscall
 li $v0, 4
 la $a0, cadena2
 syscall
 li $v0, 4
 la $a0, cadena3
 syscall
 li $v0, 4
 la $a0, cadena4
 syscall
 li $v0, 4
 la $a0, cadena13
 syscall
 li $v0, 4
 la $a0, cadena5
 syscall
 valmaxmin:
 li $t8,1			# Almacena el valor mínimo posible de la opción
 li $t9,5			# Almacena el valor máximo posible de la opción
 opcion:
 la $a0, cadena6
 li $v0,4
 syscall
 li $v0, 5			# Lee el valor introducido por teclado
 syscall
 move $t1,$v0			# Almacena el valor leído de $v0 a $t1
 blt $t1,$t8,volver		# Compara el valor leído con el valos mínimo. Si es menor que 1 salta a la subrutina volver:
 bgt $t1,$t9,volver		# Compara el valor leído con el valor máximo. Si es mayor que 4 salta a volver:
 seleccion:
 move $s0,$v0	
 beq $s0,1, sumar		# Si el valor introducido es 1 salta a sumar:
 beq $s0,2, restar		# Si el valor introducido es 2 salta a restar
 beq $s0,3, multiplicar		# Si el valor introducido es 3 salta a multiplicar
 beq $s0,4, dividir		# Si el valor introducido es 4 salta a dividir
 beq $s0,5, fin			# Finaliza la ejecución si es 5
 
 sumar:
 li $v0, 4
 la $a0, cadena7
 syscall
 li $v0, 5
 syscall
 move $t0, $v0
 li $v0, 4
 la $a0, cadena8
 syscall
 li $v0, 5
 syscall
 move $t1, $v0
 li $t9, 99
 li $t8, 0
 add $a0, $t0, $t1
 bgt $a0, $t9, error_suma	# Comprobamos si el resultado de la suma es mayor que 99. Si lo es salta a la etiqueta error_suma
 blt $a0, $t8, error_suma2	# Comprobamos si el resultado de la suma es menor que 0. Si lo es salta a la etiqueta error_suma2
 li $v0, 4
 la $a0, cadena9
 syscall
 add $a0, $t0, $t1		# Realizamos la suma de los numeros introducidos y almacenamos el resultado en el registro $a0	
 li $v0, 1			# Para mostrar el resultado por pantalla
 syscall
 add $t7, $t0, $t1		# Volvemos a realizar la suma y almacenamos el resultado en $t7
 j display			# Saltamos a display
 
 restar:
 li $v0, 4
 la $a0, cadena7
 syscall
 li $v0, 5
 syscall
 move $t0, $v0
 li $v0, 4
 la $a0, cadena8
 syscall
 li $v0, 5
 syscall
 move $t1, $v0
 li $t9, 99
 li $t8, 0
 sub $a0, $t0, $t1
 bgt $a0, $t9, error_resta	# Comprobamos si el resultado de la resta es mayor que 99. Si lo es, salta a la etiqueta error_resta
 bltz $a0, error_resta2		# Comprobamos si el resultado de la resta es menor que 0. Si lo es, salta a la etiqueta error_resta2
 li $v0, 4
 la $a0, cadena10
 syscall
 sub $a0, $t0, $t1		# Realizamos la resta de los numeros introducidos y almacenamos el resultado en el registro $a0		
 li $v0, 1			# Para mostrar el resultado por pantalla
 syscall
 sub $t7, $t0, $t1		# Volvemos a realizar la resta y almacenamos el resultado en $t7
 j display			# Saltamos a display
 
 multiplicar:
 li $v0, 4
 la $a0, cadena7
 syscall
 li $v0, 5
 syscall
 move $t0, $v0
 li $v0, 4
 la $a0, cadena8
 syscall
 li $v0, 5
 syscall
 move $t1, $v0
 li $t9, 99
 li $t8, 0
 mul $a0, $t0, $t1
 bgt $a0, $t9, error_mult	# Comprobamos si el resultado de la multiplicacion es mayor que 99. Si lo es salta a la etiqueta error_mult
 blt $a0, $t8, error_mult2	# Comprobamos si el resultado de la multiplicacion es menor que 0. Si lo es salta a la etiqueta error_mult2
 li $v0, 4
 la $a0, cadena11
 syscall
 mul $a0, $t0, $t1		# Realizamos la multiplicacion de los numeros introducidos y almacenamos el resultado en el registro $a0
 li $v0, 1			# Para mostrar el resultado por pantalla
 syscall
 mul $t7, $t0, $t1		# Volvemos a realizar la multiplicación y almacenamos el resultado en $t7
 j display			# Saltamos a display
 
 dividir:
 li $v0, 4
 la $a0, cadena7		# Mostramos por pantalla un mensaje
 syscall
 li $v0, 5			# Dejamos que el usuario introduzca por pantalla un numero
 syscall
 blez $v0, error_div2
 move $t0, $v0
 li $v0, 4
 la $a0, cadena8		# Mostramos por pantalla un segundo mensaje
 syscall
 li $v0, 5			# Dejamos que el usuario introduzca por pantalla otro numero
 syscall
 j comprobacion1
 
 comprobacion1:
 beqz $v0, mensajito		# Si el segundo numero introducido (divisor) es igual a 0 la condicion se cumple y saltamos a la etiqueta mensajito que contiene el mensaje de cadena16.
 j comprobacion2		# La etiqueta mensajito saltará a la etiqueta dividir de nuevo. Si no se cumple salta a laparte 2 de la division.
 
 comprobacion2:
 blt  $t0,$v0, mensajito2	# Si el primer numero introducido es menor que el segundo (divisor > dividendo) salta a la etiqueta mensajito2 (al final del programa)
 j parte2			# si no, continua con la división
 
 			
 parte2:
 blez $v0, error_div2
 move $t1, $v0
 li $t9, 99
 li $t8, 0
 div $a0, $t0, $t1
 bgt $a0, $t9, error_div	# Comprobamos si el resultado de la division es mayor que 99. Si lo es salta a la etiqueta error_div
 li $v0, 4
 la $a0, cadena14		# Mostramos por pantalla el mensaje del cociente de la division
 syscall
 div $t0, $t1			
 mflo $a0			# Como el cociente se encuentra en la parte baja (low) lo movemos a $a0 con la instruccion mflo
 li $v0, 1			# Y lo mostramos por pantalla
 syscall
 li $v0, 4 
 la $a0, cadena15		# Mostramos por pantalla el memnsaje del resto de la division
 syscall
 div $t0, $t1
 mfhi $a0			# Como el resto se encuentra en la parte alta (high) lo movemos a $a0 con la instruccion mfhi
 li $v0, 1			# Y lo moastramos por pantalla
 syscall
 div $t0, $t1
 mflo $t7			# Cargamos el cociente en el registro $t7
 mfhi $t5			# Cargamos el resto en el registro $t5
 li $t4, 1			# Cargamos en $t4 un 1, que para nuestro programa, indicará que se ha hecho una division
 j display			# Saltamos a display
 
 fin:
 la $a0, cadena12
 li $v0,4
 syscall
 li $v0,10
 syscall
  
 volver:
 la $a0,cadena61
 li $v0,4
 syscall			# muestra por pantalla el mensaje Opción no válida
 j opcion			# Muestra el menú de operaciones
 
 mensajito:
 li $v0, 4
 la $a0, cadena16
 syscall
 j dividir			# Si queremos que el programa no vaya a dividir sino a menu o que acabe la ejecución cambiamos j dividir por j menu o j fin 
 
 mensajito2:
 li $v0, 4
 la $a0, cadena18
 syscall
 j dividir			# Si queremos que el programa no vaya a dividir sino a menu o que acabe la ejecución cambiamos j dividir por j menu o j fin 
 
 error_suma:
 li $v0, 4
 la $a0, cadena19
 syscall 
 j sumar
 
 error_suma2:
 li $v0, 4
 la $a0, cadena20
 syscall
 j sumar
 
 error_resta:
 li $v0, 4
 la $a0, cadena19
 syscall 
 j restar
 
 error_resta2:
 li $v0, 4
 la $a0, cadena20
 syscall
 j restar
 
 error_mult:
 li $v0, 4
 la $a0, cadena19
 syscall 
 j multiplicar
 
 error_mult2:
 li $v0, 4
 la $a0, cadena20
 syscall
 j multiplicar
 
 error_div:
 li $v0, 4
 la $a0, cadena19
 syscall 
 j dividir
 
 error_div2:
 li $v0, 4
 la $a0, cadena21
 syscall
 j dividir
 

 

 display:
 li $s0, 0xFFFF0010 	# carga dirección base del display derecho
 li $s1, 0xFFFF0011 	# carga dirección base del display izquierdo
 li $t6, 10		# Cargamos en $t6 el numero 10 para dividirlo entre el resultado de la operación que se ha realizado previamente y así obtener dos numeros
 
 div $t7, $t6
 mflo $t9
 mfhi $t8
 
# 0 #######################################################################################################################################################################
 bne $t8,0, n0.5	# Compara si $t8 es igual al numero 0, si lo es carga en $t1 el numero 0 y pasa a la siguiente comprobación si no, no carga nada en el registro $t1
 li $t1, 0x3F		# El número 0
 sb $t1, 0($s0)  	# almacena en dirección del display derecho el valor de $t1.
 j n0.5
 
 n0.5:
 bne $t9,0, n1		# Compara si $t9 es igual al numero 0, si lo es carga en $t2 el numero 0 y pasa a la siguiente comprobación si no, no carga nada en el registro $t1
 li $t2, 0x3F		# El número 0
 sb $t2, 0($s1) 	# almacena en dirección del display izquierdo el valor de $t2
 j n1
###########################################################################################################################################################################
 
# 1 #######################################################################################################################################################################
 n1:
 bne $t8,1, n1.5
 li $t1, 0x6		# El número 1
 sb $t1, 0($s0)  	# almacena en dirección del display derecho el valor de $t1.
 j n1.5
 
 n1.5:
 bne $t9,1, n2
 li $t2, 0x6		# El número 1
 sb $t2, 0($s1) 	# almacena en dirección del display izquierdo el valor de $t2
 j n2
###########################################################################################################################################################################

# 2 ####################################################################################################################################################################### 
 n2:
 bne $t8,2, n2.5
 li $t1, 0x5B		# El número 2
 sb $t1, 0($s0)  	# almacena en dirección del display derecho el valor de $t1.
 j n2.5
 
 n2.5:
 bne $t9,2, n3
 li $t2, 0x5B		# El número 2
 sb $t2, 0($s1) 	# almacena en dirección del display izquierdo el valor de $t2
 j n3
###########################################################################################################################################################################
 
# 3 ####################################################################################################################################################################### 
 n3:
 bne $t8,3, n3.5
 li $t1, 0x4F		# El número 3
 sb $t1, 0($s0)  	# almacena en dirección del display derecho el valor de $t1.
 j n3.5
 
 n3.5:
 bne $t9,3, n4
 li $t2, 0x4F		# El número 3
 sb $t2, 0($s1) 	# almacena en dirección del display izquierdo el valor de $t2
 j n4
###########################################################################################################################################################################
 
# 4 ####################################################################################################################################################################### 
 n4:
 bne $t8,4, n4.5
 li $t1, 0x66		# El número 4
 sb $t1, 0($s0)  	# almacena en dirección del display derecho el valor de $t1.
 j n4.5
 
 n4.5:
 bne $t9,4, n5
 li $t2, 0x66		# El número 4
 sb $t2, 0($s1) 	# almacena en dirección del display izquierdo el valor de $t2
 j n5
###########################################################################################################################################################################
 
# 5 ####################################################################################################################################################################### 
 n5:
 bne $t8,5, n5.5
 li $t1, 0x6D		# El número 5
 sb $t1, 0($s0)  	# almacena en dirección del display derecho el valor de $t1.
 j n5.5
 
 n5.5:
 bne $t9,5, n6
 li $t2, 0x6D		# El número 5
 sb $t2, 0($s1) 	# almacena en dirección del display izquierdo el valor de $t2
 j n6
###########################################################################################################################################################################
 
# 6 ####################################################################################################################################################################### 
 n6:
 bne $t8,6, n6.5
 li $t1, 0x7D		# El número 6
 sb $t1, 0($s0)  	# almacena en dirección del display derecho el valor de $t1.
 j n6.5
 
 n6.5:
 bne $t9,6, n7
 li $t2, 0x7D		# El número 6
 sb $t2, 0($s1) 	# almacena en dirección del display izquierdo el valor de $t2
 j n7
###########################################################################################################################################################################
 
# 7 #######################################################################################################################################################################  
 n7:
 bne $t8,7, n7.5
 li $t1, 0x7		# El número 7
 sb $t1, 0($s0)  	# almacena en dirección del display derecho el valor de $t1.
 j n7.5
 
 n7.5:
 bne $t9,7, n8
 li $t2, 0x7		# El número 7
 sb $t2, 0($s1) 	# almacena en dirección del display izquierdo el valor de $t2
 j n8
###########################################################################################################################################################################
 
# 8 #######################################################################################################################################################################  
 n8:
 bne $t8,8, n8.5
 li $t1, 0x7F		# El número 8
 sb $t1, 0($s0)  	# almacena en dirección del display derecho el valor de $t1.
 j n8.5
 
 n8.5:
 bne $t9,8, n9
 li $t2, 0x7F		# El número 8
 sb $t2, 0($s1) 	# almacena en dirección del display izquierdo el valor de $t2
 j n9
###########################################################################################################################################################################
 
# 9 ####################################################################################################################################################################### 
 n9:
 bne $t8,9, n9.5
 li $t1, 0x6F		# El número 9
 sb $t1, 0($s0)  	# almacena en dirección del display derecho el valor de $t1.
 j n9.5
 
 n9.5:
 bne $t9,9, resto2
 li $t2, 0x6F		# El número 9
 sb $t2, 0($s1) 	# almacena en dirección del display izquierdo el valor de $t2
 j resto2
###########################################################################################################################################################################
 
 resto2:		# Esto es una comprobación de que se ha efectuado una división, para que el programa vuelva al display y carge el resto de la division y la muestre por pantalla
 bne $t4, 1, fin	# Sumamos 1 al registro $t4 para que la siguiente vez que haga la comprobación, $t4 ya no valga 1 y la condición no se cumpla
 move $t7, $t5
 add $t4, $t4, $t4	
 j display
