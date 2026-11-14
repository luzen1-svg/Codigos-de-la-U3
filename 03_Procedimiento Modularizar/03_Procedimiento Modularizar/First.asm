; ------------------------------------------------------
; Materia: Lenguajes de Interfaz / Ensamblador
; Nombre: Carrea Enriquez Luz Zuszeth
; Horario: 9:00 - 10:00 hrs
; Docente: Jose Luis Medina 
; Práctica 03: Procedimiento Modularizar
; -----------------------------------------------------

INCLUDE Irvine32.inc

.data
    ; mensajes a mostrar en el programa

    Bienvenida   BYTE "INICIO DE PROGRAMA ", 0
	msg_Proc   BYTE "ESTOY EN EL PROCEDIMIENTOOOOOOOOOO AJAJ XD ",0
	Fin   BYTE "ACABO EL PROGRAMA ",0

   
.code
main PROC
	mov edx , OFFSET Bienvenida  ; apunta al msj Bienvenida
	call WriteString
	call Crlf

	;primera llamada
	call MensajeAviso   ; salta al procedimiento

	mov eax,10   ; eax=10

	;segunda llamada
	call MensajeAviso    ; reutilizamos el mismo procedimiento

	mov eax,20   ;eax=20

	mov edx , OFFSET Fin  ; apunta al msj Fin
	call WriteString
	call Crlf
	

   exit

   main ENDP

   MensajeAviso PROC

	mov edx , OFFSET msg_Proc  ; apunta al msj
	call WriteString
	call Crlf
	ret  ; regresa al main


   MensajeAviso ENDP
END main