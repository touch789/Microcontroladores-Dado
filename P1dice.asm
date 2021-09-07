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
;inicio del programa: 
START
    MOVLW 0x07 ;Apagar comparadores
    MOVWF CMCON
    BCF STATUS, RP1 ;Cambiar al banco 1
    BSF STATUS, RP0 
    MOVLW b'00000000' ;Establecer puerto B como salida (los 8 bits del puerto)
    MOVWF TRISB     
    MOVLW b'00000001'
    MOVWF TRISA
    BCF STATUS, RP0 ;Regresar al banco 0
    CLRF PORTB
    MOVLW d'6'  ; initialize the 7 segment and the dice variable with the value 6
    MOVWF i
    MOVWF PORTB
    
                    
    

 

 

 


begin                            ;    This is where our main program starts.
    
        BTFSS PORTA,0 ;( skip next instruction if close // do imediate instruc if open ) 
        GOTO $-1 ; as long as the swicth is open we go back to check the switch status, if close, we skip this line
        DECFSZ PORTB   ; decrement i, if i=0 : skip next instruction
        GOTO $-3 ; if the value of the dice is > 0 we skip this line, else the program goes back to the line where it check the status of the switch
        MOVLW d'6' ; this 4 following lines are only executed if the value of the dice is equals to 0,than it reset the dice to the max value (6) 
        MOVWF i ; and goes back to the line where it check the  switch status
        MOVWF PORTB
        goto begin                    
    

 

 

 


            
END