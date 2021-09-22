#include "p16F628a.inc"    ;incluir librerias relacionadas con el dispositivo
 __CONFIG _FOSC_INTOSCCLK & _WDTE_OFF & _PWRTE_OFF & _MCLRE_OFF & _BOREN_OFF & _LVP_OFF & _CPD_OFF & _CP_OFF    
;configuración del dispositivotodo en OFF y la frecuencia de oscilador
;es la del "reloj del oscilador interno" (INTOSCCLK)     
RES_VECT  CODE    0x0000            ; processor reset vector
    GOTO    START                   ; go to beginning of program
; TODO ADD INTERRUPTS HERE IF USED
MAIN_PROG CODE  

 ;variables para el contador:
	 cblock 0x20
	 	
	 copyPORTB	
	 i
	 j
	 k
	 f
	 m
	endc

leftBit	equ 7   
rightBit equ 0   

START
	MOVLW 0x07 ;Apagar comparadores
	MOVWF CMCON
	BCF STATUS, RP1 ;Cambiar al banco 1
	BSF STATUS, RP0                                           
	MOVLW b'00000000' ;Establecer puerto B como salida (los 8 bits del puerto)
	MOVWF TRISB
	BCF STATUS, RP0 ;Regresar al banco 0
	
	movlw	1<<rightBit		;
                                                     
	movwf	copyPORTB		 


					
SHIFTLEFT	clrc	
					
	rlf	copyPORTB,F		
	call	OUTPUT			    
	call	DELAY			    
	btfss	copyPORTB, leftBit	
	goto	SHIFTLEFT		

	
SHIFTRIGHT	clrc			
	rrf	copyPORTB,F		
	call	OUTPUT			    
	call	DELAY			   
	btfss	copyPORTB, rightBit	
	goto	SHIFTRIGHT		
	goto	SHIFTLEFT		

	
OUTPUT	
	movfw	copyPORTB		
	movwf	PORTB			
	return				




DELAY:
	nop
	nop
	nop
	
	movlw d'140' ;establecer valor de la variable m
	movwf m
	mloopcorto:
	    ;nop
	    decfsz m,f
	    goto mloopcorto

	    movlw d'10' ;establecer valor de la variable i
	    movwf i
	iloopcorto:
	    ;nop ;NOPs de relleno (ajuste de tiempo)
	    movlw d'44' ;establecer valor de la variable j
	    movwf j
	jloopcorto:
	    nop ;NOPs de relleno (ajuste de tiempo)
	    nop
	    nop
	    movlw d'69' ;establecer valor de la variable k
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