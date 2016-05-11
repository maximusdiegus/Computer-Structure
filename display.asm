# Ejemplo de displays del periferico Digital Lab Sim

	.text
	
	main:
	
 li $s0, 0xFFFF0010 	# carga dirección base del display derecho
 li $s1, 0xFFFF0011 	# carga dirección base del display izquierdo
 
 
 li $t1, 0x6		# El bit 0 activa el segmento A
 sb $t1, 0($s0)  	# almacena en dirección del display derecho el valor de $t1
 
 li $t1 0x5B 		# El punto decimal
 sb $t1, 0($s1) 	# almacena en dirección del display izquierdo el valor de $t1
 
 li $v0, 10 		# fin del programa 
 syscall 
