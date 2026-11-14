; ------------------------------------------------------
; Materia: Lenguajes de Interfaz / Ensamblador
; Nombre: Carrea Enriquez Luz Zuszeth
; Horario: 9:00 - 10:00 hrs
; Docente: Jose Luis Medina 
; Práctica 05: Macros
; -----------------------------------------------------

INCLUDE Irvine32.inc

MostrarMensaje MACRO texto
mov edx, OFFSET texto    ; edx: direccion de la cadena recibida como parametro
call WriteString         ; imprime la cadena
call Crlf
ENDM

CalcularImporte MACRO precio, cantidad
mov eax, precio       ; eax: precio
imul eax, cantidad    ; hace la multiplicacion de eax * cantidad
ENDM

.data
; mensajes a mostrar

MensajeBienvenida BYTE "Que pasa calabaza", 0
MensajeFin BYTE "Me piro vampiro ", 0
precio DWORD 50
cantidad DWORD 3
importe DWORD ?

.code
main PROC
MostrarMensaje MensajeBienvenida   ; imprime el mensaje (dentro del codigo se hace una expansion)

CalcularImporte precio, cantidad   ; dentro del codigo se expandio esta parte
mov importe, eax    ; guarda el resultado en la varible importe

call WriteInt     ; imprime eax como entero con signo (+150)
call Crlf

MostrarMensaje MensajeFin

exit
main ENDP
END main