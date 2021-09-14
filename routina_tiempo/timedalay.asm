#include "p16F628a.inc"    ;incluir librerias relacionadas con el dispositivo
 __CONFIG _FOSC_INTOSCCLK & _WDTE_OFF & _PWRTE_OFF & _MCLRE_OFF & _BOREN_OFF & _LVP_OFF & _CPD_OFF & _CP_OFF    
;configuración del dispositivotodo en OFF y la frecuencia de oscilador
;es la del "reloj del oscilador interno" (INTOSCCLK)     
RES_VECT  CODE    0x0000            ; processor reset vector
    GOTO    START                   ; go to beginning of program
; TODO ADD INTERRUPTS HERE IF USED
MAIN_PROG CODE                      ; let linker place main program
;variables para el contador:
i equ 0x30
j equ 0x31
k equ 0x32
m equ 0x33

 
START
    MOVLW 0x07
    MOVWF CMCON
    BCF STATUS, RP1
    BSF STATUS, RP0
    MOVLW b'00000000'
    MOVWF TRISB
    BCF STATUS, RP0
    

inicio 
bcf PORTB,0
call time
    
BSF PORTB,0
    nop
call time

goto inicio

time:   
    movlw d'126'
    movwf m
    mloop:
	nop
	nop
	decfsz m
	goto mloop
	nop
	movlw d'72'
	movwf i
	iloop:
	    nop
	    nop
	    nop
	    nop
	    nop
	    nop
	    nop
	    movlw d'60'
	    movwf j
	    jloop:
		nop
		nop   
		movlw d'113'
		movwf k
		kloop:
		    nop
		    decfsz k,f
		    goto kloop
		    decfsz j,f
		    goto jloop
		    decfsz i
		    goto iloop
return

end