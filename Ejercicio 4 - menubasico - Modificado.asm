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
 li $v0, 4
 la $a0, cadena9
 syscall
 add $a0, $t0, $t1		# Efectúa la suma	
 li $v0, 1			# Muestra por pantalla el mensaje correspondiente
 syscall
 j menu				# Vuelve a mostrar el menú de operaciones
 
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
 
 dividir:
 li $v0, 4
 la $a0, cadena7		# Mostramos por pantalla un mensaje
 syscall
 li $v0, 5			# Dejamos que el usuario introduzca por pantalla un numero
 syscall
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
 move $t1, $v0
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
 
