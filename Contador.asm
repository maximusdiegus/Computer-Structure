
.data

cadena1: .asciiz "Introduce el valor inicial: "
cadena2: .asciiz "Introduce el valor final: "
cadena3: .asciiz "Introduce el valor del incremento: "
cadena4: .asciiz "El valor no puede ser mayor de 99\n"
cadena5: .asciiz "El valor no puede ser menor de 0\n"

.text
 main:

 li $t9, 99

 valor_inicial:
 li $v0, 4
 la $a0, cadena1			# Mostramos por pantala el mensaje de la cadena 1
 syscall
 li $v0, 5
 syscall
 bgt $v0, $t9, error_valor_inicial	# Comprobamos que el numero introducido no sea mayor de 99. Si lo es, saltara a la etiqueta correspondiente dando un mensaje de error
 bltz  $v0, error_valor_inicial2	# Comprobamos que el numero introducido no sea menor de 0. Si lo es, saltara a la etiqueta correspondiente dando un mensaje de error
 move $t0, $v0				# Movemos el valor introducido al registro $t0
 j valor_final

 valor_final:
 li $v0, 4
 la $a0, cadena2			# Mostramos por pantala el mensaje de la cadena 2
 syscall
 li $v0, 5
 syscall
 bgt $v0, $t9, error_valor_final	# Comprobamos que el numero introducido no sea mayor de 99. Si lo es, saltara a la etiqueta correspondiente dando un mensaje de error
 bltz $v0, error_valor_final2		# Comprobamos que el numero introducido no sea menor de 0. Si lo es, saltara a la etiqueta correspondiente dando un mensaje de error
 move $t3, $v0 				# Movemos el valor introducido al registro $t3
 j incremento

 incremento:
 li $v0, 4
 la $a0, cadena3			# Mostramos por pantala el mensaje de la cadena 3
 syscall
 li $v0, 5
 syscall
 bgt $v0, $t9, error_incremento		# Comprobamos que el numero introducido no sea mayor de 99. Si lo es, saltara a la etiqueta correspondiente dando un mensaje de error
 bltz $v0, error_incremento2		# Comprobamos que el numero introducido no sea menor de 0. Si lo es, saltara a la etiqueta correspondiente dando un mensaje de error
 move $t4, $v0				# Movemos el valor introducido al registro $t4
 j bucle


# Inicio del bucle for
 bucle:
 bgt $t0, $t3, fin_bucle
 
# Contador

 li $s0, 0xFFFF0010 	# carga dirección base del display derecho
 li $s1, 0xFFFF0011 	# carga dirección base del display izquierdo
 li $t5, 10		# Cargamos en $t6 el numero 10 para dividirlo entre el resultado de la operación que se ha realizado previamente y así obtener dos numeros
 
 div $t0, $t5
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
 j n1			# Salto a la comprobación del numero 1
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
 bne $t9,9, final 
 li $t2, 0x6F		# El número 9
 sb $t2, 0($s1) 	# almacena en dirección del display izquierdo el valor de $t2
 j final
###########################################################################################################################################################################
 
 final:
 add $t0, $t0, $t4	
 j bucle
 
 fin_bucle:
 li $v0, 10
 syscall

 error_valor_inicial:
 li $v0, 4
 la $a0, cadena4
 syscall
 j valor_inicial
 
 error_valor_inicial2:
 li $v0, 4
 la $a0, cadena5
 syscall
 j valor_inicial
 
 error_valor_final:
 li $v0, 4
 la $a0, cadena4
 syscall 
 j valor_final
 
 error_valor_final2:
 li $v0, 4
 la $a0, cadena5
 syscall
 j valor_final
 
 error_incremento:
 li $v0, 4
 la $a0, cadena4
 syscall 
 j incremento
 
 error_incremento2:
 li $v0, 4
 la $a0, cadena5
 syscall
 j incremento
