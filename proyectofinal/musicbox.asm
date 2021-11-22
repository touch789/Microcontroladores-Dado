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
d1   	    EQU   	 10   	 ;define 0x10 register as lower delay byte
d2   	    EQU   	 11   	 ;define 0x11 register as upper delay byte
periods    EQU   	 12   
i EQU 0x20
j EQU 0x21
k equ 0x42
m equ 0x43
secondeu equ 0x22
seconded equ 0x23
minuteu equ 0x24
minuted equ 0x25
heureu equ 0x26
heured equ 0x27
ref9 equ 0x28
ref60 equ 0x29
 
TMP1 EQU 0x40
TMP0 EQU 0x41
 

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
    
    movlw 0x30
    movwf secondeu
    movlw 0x35
    movwf seconded
    movlw 0x39
    movwf minuteu
    movlw 0x34
    movwf minuted
    movlw 0x39
    movwf heureu
    movlw 0x31
    movwf heured
    movlw 0x3A
    movwf ref9
    movlw 0x36
    movwf ref60
    
    
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
    
    call DELAYre
    nop
    goto INICIO
    ;BSF PORTA, 2
    ;call DELAY
    ;nop
    ;BCF PORTA,2
   
    call LCDDO
    call do ;simple
    call ciclo
    call spacer
    
    call LCDDO
    call do ;simple
    call ciclo
    call spacer
    
    call LCDDO
    call do ;simple
    call ciclo
    call spacer
    
    call re ;simple
    call ciclo
    call spacer
    
    call midouble;double
    call ciclo
    call spacer
    
    call redouble ;double
    call ciclo
    call spacer
    
    call LCDDO
    call do ;simple
    call ciclo
    call spacer
    
    call mi ;simple
    call ciclo
    call spacer
    
    call re ;simple
    call ciclo
    call spacer
    
    call re ;simple
    call ciclo
    call spacer
    
    call LCDDO
    call do ;long
    call do 
    call do
    call ciclo
    call ciclo
    call ciclo
    
    call spacer
    
    
    
    
            
   GOTO INICIO

   
  DELAYdo ; pour le mi : 1,911 ms
    ;Variable: TMP0
;Delay 8 cycles
        MOVLW d'56'  ;petit 56
        MOVWF TMP1
        MOVLW d'10'  ;gros 10
        MOVWF TMP0
        DECFSZ TMP0,F
        GOTO $-1
        DECFSZ TMP1,F
        GOTO $-5
	return
    
DELAYre ; pour le mi : 1,702 ms §§§§§§§§§§§ pas bon 0,004ms de trop
    ;Variable: TMP0
;Delay 8 cycles
        MOVLW d'50'  ;petit 50
        MOVWF TMP1
        MOVLW d'10'  ;gros 10
        MOVWF TMP0
        DECFSZ TMP0,F
        GOTO $-1
        DECFSZ TMP1,F
        GOTO $-5
	return
   
DELAYmi ; pour le mi : 1,516 ms
    ;Variable: TMP0
;Delay 8 cycles
    nop
    nop
    nop
    nop
        MOVLW d'35'  ;petit
        MOVWF TMP1
        MOVLW d'13'  ;gros
        MOVWF TMP0
        DECFSZ TMP0,F
        GOTO $-1
        DECFSZ TMP1,F
        GOTO $-5
	return
;End of Delay
	
				 ;Otherwise return from the subroutine

mi
    call LCDMI
    movlw d'160'
    movwf d1
    loopmi
    BSF PORTA, 2
    call DELAYmi
    BCF PORTA,2
    call DELAYmi
    DECFSZ d1,F
    GOTO loopmi
    return
    
do
    
    movlw d'160'
    movwf d1
    loopdo
    BSF PORTA, 2
    call DELAYdo
    BCF PORTA,2
    call DELAYdo
    DECFSZ d1,F
    GOTO loopdo
    return
    
    
re
    call LCDRE
    movlw d'160'
    movwf d1
    loopre
    BSF PORTA, 2
    call DELAYre
    BCF PORTA,2
    call DELAYre
    DECFSZ d1,F
    GOTO loopre
    return
    
midouble
    call LCDMI
    movlw d'220'
    movwf d1
    loopmidouble
    BSF PORTA, 2
    call DELAYmi
    BCF PORTA,2
    call DELAYmi
    DECFSZ d1,F
    GOTO loopmidouble
    return
    
redouble
    call LCDRE
    movlw d'220'
    movwf d1
    loopredouble
    BSF PORTA, 2
    call DELAYmi
    BCF PORTA,2
    call DELAYmi
    DECFSZ d1,F
    GOTO loopredouble
    return

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
    MOVLW d'142'
    MOVWF i
    DECFSZ i
    GOTO $-1
    DECFSZ j
    GOTO ciclo
    RETURN
    
tiempocorto
    ;nop
    
    movlw d'144' ;establecer valor de la variable m
    movwf m
    mloopcorto:
    ;nop
    decfsz m,f
    goto mloopcorto
    movlw d'43' ;establecer valor de la variable i
    movwf i
    iloopcorto:
     ;NOPs de relleno (ajuste de tiempo)
    movlw d'60' ;establecer valor de la variable j
    movwf j
    jloopcorto:
    ;nop ;NOPs de relleno (ajuste de tiempo)
    movlw d'81' ;establecer valor de la variable k
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


    
LCDDO
    BCF PORTA,0		;command mode
    CALL time
    
    
    MOVLW 0x82	    ;LCD position
    MOVWF PORTB
    CALL exec
    
    BSF PORTA,0		;data mode
    CALL time
    
    MOVLW 'D'
    MOVWF PORTB
    CALL exec
    
    MOVLW 'O'
    MOVWF PORTB
    CALL exec
    
     MOVLW ':'
    MOVWF PORTB
    CALL exec
    
    MOVLW '2'
    MOVWF PORTB
    CALL exec
    
     MOVLW '6'
    MOVWF PORTB
    CALL exec
    
    MOVLW '1'
    MOVWF PORTB
    CALL exec
  
     MOVLW ','
    MOVWF PORTB
    CALL exec
    
    MOVLW '1'
    MOVWF PORTB
    CALL exec
    
     MOVLW '2'
    MOVWF PORTB
    CALL exec
    
    MOVLW '6'
    MOVWF PORTB
    CALL exec
    
    MOVLW 'H'
    MOVWF PORTB
    CALL exec
    MOVLW 'Z'
    MOVWF PORTB
    CALL exec
    
  
    return
    
spacer
    BCF PORTA,0		;command mode
    CALL time
    
    
    MOVLW 0x86	    ;LCD position
    MOVWF PORTB
    CALL exec
    
    BSF PORTA,0		;data mode
    CALL time
    
    MOVLW ' '
    MOVWF PORTB
    CALL exec
    
    MOVLW ' '
    MOVWF PORTB
    CALL exec
    
  
    return
    
LCDMI
    BCF PORTA,0		;command mode
    CALL time
    
    MOVLW 0x82	;LCD position
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
    
     MOVLW ':'
    MOVWF PORTB
    CALL exec
    
    MOVLW '3'
    MOVWF PORTB
    CALL exec
    
     MOVLW '2'
    MOVWF PORTB
    CALL exec
    
    MOVLW '9'
    MOVWF PORTB
    CALL exec
  
     MOVLW ','
    MOVWF PORTB
    CALL exec
    
    MOVLW '6'
    MOVWF PORTB
    CALL exec
    
     MOVLW '2'
    MOVWF PORTB
    CALL exec
    
    MOVLW '8'
    MOVWF PORTB
    CALL exec
    
    MOVLW 'H'
    MOVWF PORTB
    CALL exec
    MOVLW 'Z'
    MOVWF PORTB
    CALL exec
  
    return
    
LCDRE
    BCF PORTA,0		;command mode
    CALL time
    
    MOVLW 0x82	;LCD position
    MOVWF PORTB
    CALL exec
    
    BSF PORTA,0		;data mode
    CALL time
    
    MOVLW 'R'
    MOVWF PORTB
    CALL exec
    
    MOVLW 'E'
    MOVWF PORTB
    CALL exec
    
     MOVLW ':'
    MOVWF PORTB
    CALL exec
    
    MOVLW '2'
    MOVWF PORTB
    CALL exec
    
     MOVLW '9'
    MOVWF PORTB
    CALL exec
    
    MOVLW '3'
    MOVWF PORTB
    CALL exec
  
     MOVLW ','
    MOVWF PORTB
    CALL exec
    
    MOVLW '6'
    MOVWF PORTB
    CALL exec
    
     MOVLW '6'
    MOVWF PORTB
    CALL exec
    
    MOVLW '5'
    MOVWF PORTB
    CALL exec
    
    MOVLW 'H'
    MOVWF PORTB
    CALL exec
    MOVLW 'Z'
    MOVWF PORTB
    CALL exec
    
    return
    
    

    
    


			
    END