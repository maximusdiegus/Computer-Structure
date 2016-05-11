#ESTRUCTURA DE COMPUTADORES
#CURSO 2013-2014
#EJEMPLO DE MEN� GEN�RICO CON BIFURCACIONES Y CONTROL SOBRE LOS DATOS INTRODUCIDOS
#Copyright PEDRO GARC�A GUILL�N

.data
cadena1: .asciiz "\n\n MENU DE OPERACIONES\n"
cadena2: .asciiz "1.- Sumar n�meros\n"
cadena3: .asciiz "2.- Restar n�meros\n"
cadena4: .asciiz "3.- Multiplicar n�meros\n"
cadena5: .asciiz "4.- Salir\n\t"
cadena6: .asciiz "Introduce opcion: "
cadena61:.asciiz "Opci�n no v�lida."
cadena7: .asciiz "Introduce el primer n�mero: "
cadena8: .asciiz "Introduce el segundo n�mero: "
cadena9: .asciiz "La suma es "
cadena10: .asciiz "La resta es "
cadena11: .asciiz "El producto es "
cadena12: .asciiz "\n\nFin del programa. Adios ..."

 .text
 main:
 
 menu:
 li $v0, 4		# LLamada a imprimir cadena
 la $a0, cadena1	# Muestra la cadena por pantalla
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
 la $a0, cadena5
 syscall
 valmaxmin:
 li $t8,1		#Almacena el valor m�nimo posible de la opci�n
 li $t9,4		#Almacena el valor m�ximo posible de la opci�n
 opcion:
 la $a0, cadena6
 li $v0,4
 syscall
 li $v0, 5		#Lee el valor introducido por teclado
 syscall
 move $t1,$v0		#Almacena el valor le�do
 blt $t1,$t8,volver	#Compara el valor le�do con el valos m�nimo. Si es menor que 1 salta a la subrutina volver:
 bgt $t1,$t9,volver	#Compara el valor le�do con el valor m�ximo. Si es mayor que 4 salta a volver:
 seleccion:
 move $s0,$v0
 beq $s0,1, sumar	#Si el valor introducido es 1 salta a sumar:
 beq $s0,2, restar	#Idem si es 2
 beq $s0,3, multiplicar	#Idem si es 3
 beq $s0,4, fin		#Finaliza la ejecuci�n si es 4
 
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
 li $v0, 4
 la $a0, cadena9
 syscall
 add $a0, $t0, $t1	#Efect�a la suma	
 li $v0, 1		#Muestra por pantalla el mensaje correspondiente
 syscall
 j menu			#Vuelve a mostrar el men� de operaciones
 
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
 li $v0, 4
 la $a0, cadena10
 syscall
 sub $a0, $t0, $t1
 li $v0, 1
 syscall
 j menu
 
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
 li $v0, 4
 la $a0, cadena11
 syscall
 mul $a0, $t0, $t1
 li $v0, 1
 syscall
 j menu
 
 fin:
 la $a0, cadena12
 li $v0,4
 syscall
 li $v0,10
 syscall
  
 volver:
 la $a0,cadena61
 li $v0,4
 syscall		#muestra por pantalla el mensaje Opci�n no v�lida
 j opcion		#Muestra el men� de operaciones
 
