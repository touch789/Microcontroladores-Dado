#include "p16F628a.inc"    
 __CONFIG _FOSC_INTOSCCLK & _WDTE_OFF & _PWRTE_OFF & _MCLRE_ON & _BOREN_OFF & _LVP_OFF & _CPD_OFF & _CP_OFF    

RES_VECT  CODE    0x0000            ; processor reset vector
    
    BCF PORTA,0		;reset
    MOVLW 0x01
    MOVWF PORTB
    
    BSF PORTA,1		;exec
    CALL time
    BCF PORTA,1
    CALL time
  
    GOTO    START                   ; go to beginning of program
; TODO ADD INTERRUPTS HERE IF USED
MAIN_PROG CODE                      ; let linker place main program

i EQU 0x20
j EQU 0x21
k equ 0x21
m equ 0x21

START
    MOVLW 0x07
    MOVWF CMCON
    BCF STATUS, RP1
    BSF STATUS, RP0 
    CLRF TRISB
    CLRF TRISA
    BCF STATUS, RP0
    
    BCF PORTA,1
    BCF PORTA,0
    
INITLCD
    BCF PORTA,0		;reset
    MOVLW 0x01
    MOVWF PORTB
    
    BSF PORTA,1		;exec
    CALL time
    BCF PORTA,1
    CALL time
    
    MOVLW 0x0C		;first line
    MOVWF PORTB
    
    BSF PORTA,1		;exec
    CALL time
    BCF PORTA,1
    CALL time
         
    MOVLW 0x3C		;cursor mode
    MOVWF PORTB
    
    BSF PORTA,1		;exec
    CALL time
    BCF PORTA,1
    CALL time
    
    
INICIO	  
   
    BCF PORTA,0		;command mode
    CALL time
    
    MOVLW 0x86		;LCD position
    MOVWF PORTB
    CALL exec
    
    BSF PORTA,0		;data mode
    CALL time
    
    MOVLW 'H'
    MOVWF PORTB
    CALL exec
    
    MOVLW 'E'
    MOVWF PORTB
    CALL exec
   
    MOVLW 'N'
    MOVWF PORTB
    CALL exec

    MOVLW 'R'
    MOVWF PORTB
    CALL exec
    
    MOVLW 'I'
    MOVWF PORTB
    CALL exec

    BCF PORTA,0		;command mode
    CALL time
    
    MOVLW 0xC6		;LCD position
    MOVWF PORTB
    CALL exec
    ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
    BSF PORTA,0		;data mode
    CALL time
    
    MOVLW 'C'
    MOVWF PORTB
    CALL exec 

    MOVLW 'R'
    MOVWF PORTB
    CALL exec
     MOVLW 'E'
    MOVWF PORTB
    CALL exec
     MOVLW 'N'
    MOVWF PORTB
    CALL exec
    
    BCF PORTA,0		;command mode
    CALL time
    
    
    
    call ciclo
    call ciclo
    call ciclo
    call ciclo
    call ciclo
    call ciclo
    
     BCF PORTA,0		;reset
    MOVLW 0x01
    MOVWF PORTB
    
    BSF PORTA,1		;exec
    CALL time
    BCF PORTA,1
    CALL time
    
    MOVLW 0x86		;LCD position
    MOVWF PORTB
    CALL exec
    
    
    BSF PORTA,0		;data mode
    CALL time
     
    
    MOVLW 'M'
    MOVWF PORTB
    CALL exec 

    MOVLW 'I'
    MOVWF PORTB
    CALL exec
     MOVLW 'C'
    MOVWF PORTB
    CALL exec
     MOVLW 'R'
    MOVWF PORTB
    CALL exec
     MOVLW 'O'
    MOVWF PORTB
    CALL exec
    
    BCF PORTA,0		;command mode
    CALL time
    
    MOVLW 0xC2		;LCD position
    MOVWF PORTB
    CALL exec
    ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
    BSF PORTA,0		;data mode
    CALL time
    
    MOVLW 'C'
    MOVWF PORTB
    CALL exec 

    MOVLW 'O'
    MOVWF PORTB
    CALL exec
     MOVLW 'N'
    MOVWF PORTB
    CALL exec
     MOVLW 'T'
    MOVWF PORTB
    CALL exec
    MOVLW 'R'
    MOVWF PORTB
    CALL exec
    MOVLW 'O'
    MOVWF PORTB
    CALL exec
    MOVLW 'L'
    MOVWF PORTB
    CALL exec
    MOVLW 'A'
    MOVWF PORTB
    CALL exec
    MOVLW 'D'
    MOVWF PORTB
    CALL exec
    MOVLW 'O'
    MOVWF PORTB
    CALL exec
    MOVLW 'R'
    MOVWF PORTB
    CALL exec
    MOVLW 'E'
    MOVWF PORTB
    CALL exec
    MOVLW 'S'
    MOVWF PORTB
    CALL exec
    
    call ciclo
    call ciclo
    call ciclo
    call ciclo
    call ciclo
    call ciclo
    
     BCF PORTA,0		;reset
    MOVLW 0x01
    MOVWF PORTB
    
    BSF PORTA,1		;exec
    CALL time
    BCF PORTA,1
    CALL time
    
    MOVLW 0x84		;LCD position
    MOVWF PORTB
    CALL exec
    
    
    BSF PORTA,0		;data mode
    CALL time
    
    
    
    
    MOVLW 'B'
    MOVWF PORTB
    CALL exec 

    MOVLW 'O'
    MOVWF PORTB
    CALL exec
     MOVLW 'N'
    MOVWF PORTB
    CALL exec
     MOVLW 'J'
    MOVWF PORTB
    CALL exec
     MOVLW 'O'
    MOVWF PORTB
    CALL exec
    MOVLW 'U'
    MOVWF PORTB
    CALL exec
    MOVLW 'R'
    MOVWF PORTB
    CALL exec
    MOVLW 'S'
    MOVWF PORTB
    CALL exec
    
    call ciclo
    call ciclo
    call ciclo
    call ciclo
    call ciclo
    call ciclo
    
     BCF PORTA,0		;reset
    MOVLW 0x01
    MOVWF PORTB
    
    BSF PORTA,1		;exec
    CALL time
    BCF PORTA,1
    CALL time
    
    
        
    GOTO INICIO

exec

    BSF PORTA,1		;exec
    CALL time
    BCF PORTA,1
    CALL time
    RETURN
    
time
    CLRF i
    MOVLW d'10'
    MOVWF j
ciclo    
    MOVLW d'250'
    MOVWF i
    DECFSZ i
    GOTO $-1
    DECFSZ j
    GOTO ciclo
    RETURN

			
    END