#include "p16F628a.inc"    ;incluir librerias relacionadas con el dispositivo
 __CONFIG _FOSC_INTOSCCLK & _WDTE_OFF & _PWRTE_OFF & _MCLRE_OFF & _BOREN_OFF & _LVP_OFF & _CPD_OFF & _CP_OFF    
;configuraci�n del dispositivotodo en OFF y la frecuencia de oscilador
;es la del "reloj del oscilador interno" (INTOSCCLK)     
RES_VECT  CODE    0x0000            ; processor reset vector
    GOTO    START                   ; go to beginning of program
; TODO ADD INTERRUPTS HERE IF USED
MAIN_PROG CODE                      ; let linker place main program
;variables para el contador:
i equ 0x30
j equ 0x31
k equ 0x32
f equ 0x33
m equ 0x34
;inicio del programa: 
START
    MOVLW 0x07 ;Apagar comparadores
    MOVWF CMCON
    BCF STATUS, RP1 ;Cambiar al banco 1
    BSF STATUS, RP0 
    MOVLW b'00000000' ;Establecer puerto B como salida (los 8 bits del puerto)
    MOVWF TRISB     
    BCF STATUS, RP0 ;Regresar al banco 0
    CLRF PORTB
    


begin                            
    
        MOVLW b'00100001'
	MOVWF PORTB
	call tiempolargo
	MOVLW b'00100010'
	MOVWF PORTB
	call tiempocorto
	nop
	nop
	nop
	MOVLW b'00001100'
	MOVWF PORTB
	call tiempolargo
	MOVLW b'00010100'
	MOVWF PORTB
	call tiempocorto
	nop
	
        goto begin                    
    

tiempolargo:
    ;nop
    movlw d'155' ;establecer valor de la variable m
    movwf m
    mlooplargo:
	nop
	decfsz m,f
	goto mlooplargo
	movlw d'98' ;establecer valor de la variable i
	movwf i
    ilooplargo:
	nop ;NOPs de relleno (ajuste de tiempo)
	movlw d'147' ;establecer valor de la variable j
	movwf j
    jlooplargo:
	nop ;NOPs de relleno (ajuste de tiempo)
	nop
	nop
	movlw d'85' ;establecer valor de la variable k
	movwf k
    klooplargo:
	nop
	decfsz k,f
	goto klooplargo
	decfsz j,f
	goto jlooplargo
	decfsz i,f
	goto ilooplargo
	return ;salir de la rutina de tiempo y regresar al
  
    
    
tiempocorto:
    ;nop
    nop
    movlw d'151' ;establecer valor de la variable m
    movwf m
    mloopcorto:
    ;nop
    decfsz m,f
    goto mloopcorto
    movlw d'43' ;establecer valor de la variable i
    movwf i
    iloopcorto:
    nop ;NOPs de relleno (ajuste de tiempo)
    movlw d'70' ;establecer valor de la variable j
    movwf j
    jloopcorto:
    ;nop ;NOPs de relleno (ajuste de tiempo)
    movlw d'82' ;establecer valor de la variable k
    movwf k
    kloopcorto:
    nop
    decfsz k,f
    goto kloopcorto
    decfsz j,f
    goto jloopcorto
    decfsz i,f
    goto iloopcorto
    return ;salir de la rutina de tiempo y regresar al

 

 


            
END