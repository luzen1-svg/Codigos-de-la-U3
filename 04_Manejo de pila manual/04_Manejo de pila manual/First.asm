; ------------------------------------------------------
; Materia: Lenguajes de Interfaz / Ensamblador
; Nombre: Carrea Enriquez Luz Zuszeth
; Horario: 9:00 - 10:00 hrs
; Docente: Jose Luis Medina 
; Práctica 04: Manejo de pila manual
; -----------------------------------------------------

INCLUDE Irvine32.inc

.data

.code
main PROC
	mov ebx, 999   ;guardamos 999 en ebx

	push 3          ; mandamos primero el 3 abajo de la pila
	push 25         ; el 25 queda arriba de la pila
	call SumarPila  ; empujamos la direccion de retorno
	nop
	exit

main ENDP

	SumarPila PROC
	push ebp         ; guardamos el valor anterior de ebp
	mov ebp, esp     ; ebp esta apuntando a la suma de la pila

	push ebx         ; guarda ebx 

	mov eax, [ebp+8]     ; es 25: ebp+4 es la direccion de retorno y el + 8 el parametro
	mov ebx, [ebp+12]    ; es 3

	imul eax, ebx        ;realiza la multiplicacion de los 2 numeros y los guarda en eax

	pop ebx  ; restaura el valor de ebx (999)

	pop ebp  ; restaura ebp

	ret 8   ; regresa 8 bytes
SumarPila ENDP

END main
