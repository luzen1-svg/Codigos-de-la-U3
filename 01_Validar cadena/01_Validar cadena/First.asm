; ------------------------------------------------------
; Materia: Lenguajes de Interfaz / Ensamblador
; Nombre: Carrea Enriquez Luz Zuszeth
; Horario: 9:00 - 10:00 hrs
; Docente: Jose Luis Medina 
; Práctica 01: Validar Cadena
; -----------------------------------------------------

INCLUDE Irvine32.inc

.data
 ; son todos los mensajes que mostrara el programa

    Bienvenida    BYTE "INICIO DE PROGRAMA ", 0
	Cad BYTE "ESCRIBE UNA CADENA (TEXTO) : ",0
	Inv BYTE "NO EXISTE LA CADENA ", 0
	Val BYTE "LA CADENA SI EXISTE  ", 0
	palabra BYTE 20 DUP(0)
	msg_Fin    BYTE "ACABO EL PROGRAMA ",0
 
.code
main PROC
	mov edx , OFFSET Bienvenida  ; apunta al inicio del mensaje Bienvenida
	call WriteString
	call Crlf

	mov edx , OFFSET Cad  ; apunta al msj Cad
	call WriteString
	call Crlf

	mov edx,OFFSET palabra   ; es la direccion del buffer donde se guardara lo que escriba el usuario
	mov ecx, SIZEOF palabra  ; es el tamaño maximo a leer

	call ReadString
	call Crlf
	 
	call ValidarCad   ; es el numero de caracteres leidos

	mov edx , OFFSET msg_Fin  ; apunta al mensaje msj_Fin
	call WriteString
	call Crlf
	
   exit

   main ENDP

   ValidarCad PROC
	cmp eax, 0           ; compara los caracteres leidos con 0
	jle invalido         ; si eax=0 salta a invalido
	mov edx, OFFSET Val  ; si escribio algo, edx apunta al msj Val
	jmp mostrar          ; salta a mostrar para no ejecutar el mensaje Invalido
invalido:
	mov edx, OFFSET Inv  ; edx apunta al msj Inv
mostrar:
	call WriteString   ; imprime el msj de acuerdo a la validacion correspondiente
	call Crlf
	ret
   ValidarCad   ENDP

END main