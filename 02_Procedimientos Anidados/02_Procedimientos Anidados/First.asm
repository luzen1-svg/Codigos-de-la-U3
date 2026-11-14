; ------------------------------------------------------
; Materia: Lenguajes de Interfaz / Ensamblador
; Nombre: Carrea Enriquez Luz Zuszeth
; Horario: 9:00 - 10:00 hrs
; Docente: Jose Luis Medina 
; Práctica 02: Procedimientos Anidados
; -----------------------------------------------------

INCLUDE Irvine32.inc

.data
    ; mensaje que mostrara el programa 

    Bienvenida   BYTE "INICIO DE PROGRAMA ", 0
	msjProc   BYTE "ESTOY EN EL PROCEDIMIENTOOOOOOOOOO AJAJ XD ",0
	msjProc2   BYTE "ESTOY EN EL  OTRO PROCEDIMIENTOOOOOOOOOO AJAJ XD ",0

	Fin   BYTE "ACABO EL PROGRAMA ",0

   
.code
main PROC
	mov edx , OFFSET Bienvenida   ; apunta al msj Bienvenida
	call WriteString
	call Crlf

	;primera llamada
	call MensajeAviso   ; llama al procedimiento que a la vez llama al mensajeAviso2

	mov eax,10   ; eax toma el valor de 10 


	mov eax,20   ; eax= 20

	mov edx , OFFSET Fin   ; apunta al msj Fin
	call WriteString
	call Crlf
	

   exit

   main ENDP

   MensajeAviso PROC

	mov edx , OFFSET msjProc  ; edx: es la direcccion del msj del primer procedimiento
	call WriteString       
	call Crlf

	call MensajeAviso2     ; llama al segundo procedimiento (la direccion de retorno se apila)
	
	ret  ; regresa al main, despues del call MensajeAviso

   MensajeAviso ENDP

   MensajeAviso2 PROC

	mov edx , OFFSET msjProc2    ; edx: es la direccion del 2 procedimiento
	call WriteString
	call Crlf
	ret   ; regresa a MensajeAviso


   MensajeAviso2 ENDP

END main