#include "p16F628a.inc"    ;incluir librerias relacionadas con el dispositivo
 __CONFIG _FOSC_INTOSCCLK & _WDTE_OFF & _PWRTE_OFF & _MCLRE_OFF & _BOREN_OFF & _LVP_OFF & _CPD_OFF & _CP_OFF    
;configuración del dispositivotodo en OFF y la frecuencia de oscilador
;es la del "reloj del oscilador interno" (INTOSCCLK)     
RES_VECT  CODE    0x0000            ; processor reset vector
    GOTO    START                   ; go to beginning of program
; TODO ADD INTERRUPTS HERE IF USED
MAIN_PROG CODE                      ; let linker place main program
;variables para el contador:
cblock 0x20
	 	
	 i
	 j
	 k
	 f
	 m; used by delay fucnction
endc
;inicio del programa: 
START
    MOVLW 0x07 ;Apagar comparadores
    MOVWF CMCON
    BCF STATUS, RP1 ;Cambiar al banco 1
    BSF STATUS, RP0 
    MOVLW b'00000000' ;Establecer puerto B como salida (los 8 bits del puerto)
    MOVWF TRISB     
    BCF STATUS, RP0 ;Regresar al banco 0
    

begin 
	movlw b'11111111' 
	movwf PORTB		    ;All LED at PORTB should be light up now
	Call DELAY05		    ; call subroutine for 1s delay
	movlw b'0000000'		; Move '0b00000000' to PORTB register
	movwf PORTB			; All LED at PORTB should be dimmed now
	Call DELAY04			; call subroutine for 1s delay
	goto begin
    
    
 DELAY05:
	nop
	nop
	
	nop
	movlw d'114' ;establecer valor de la variable m
	movwf m
	mloopcortol:
	    ;nop
	    nop
	    decfsz m,f
	    goto mloopcortol
	   
	    movlw d'43' ;establecer valor de la variable i
	    movwf i
	iloopcortol:
	    ;nop ;NOPs de relleno (ajuste de tiempo)
	    movlw d'69' ;establecer valor de la variable j
	    nop
	    nop
	    movwf j
	jloopcortol:
	   nop
	   nop
	   nop
	    movlw d'45' ;establecer valor de la variable k
	    movwf k
	kloopcortol:
	    nop
	    decfsz k,f
	    goto kloopcortol
	    decfsz j,f
	    goto jloopcortol
	    decfsz i,f
	    goto iloopcortol
	return ;salir de la rutina de tiempo y regresar al  
    
DELAY04:
	nop
	nop
	nop
	nop
	movlw d'158' ;establecer valor de la variable m
	movwf m
	mloopcorto:
	    ;nop
	    nop
	    decfsz m,f
	    goto mloopcorto
	   
	    movlw d'35' ;establecer valor de la variable i
	    movwf i
	iloopcorto:
	    ;nop ;NOPs de relleno (ajuste de tiempo)
	    movlw d'75' ;establecer valor de la variable j
	    nop
	    movwf j
	jloopcorto:
	   nop
	    movlw d'41' ;establecer valor de la variable k
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
	


	
end