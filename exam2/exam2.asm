#include "p16F887.inc"   ; TODO INSERT CONFIG CODE HERE USING CONFIG BITS GENERATOR
 	__CONFIG	_CONFIG1,	_INTRC_OSC_NOCLKOUT & _WDT_OFF & _PWRTE_OFF & _MCLRE_ON & _CP_OFF & _CPD_OFF & _BOR_OFF & _IESO_ON & _FCMEN_ON & _LVP_OFF 
 	__CONFIG	_CONFIG2,	_BOR40V & _WRT_OFF

RES_VECT  CODE    0x0000            ; processor reset vector
    GOTO    START                   ; go to beginning of program

MAIN_PROG CODE                      ; let linker place main program
i EQU 0x20
j EQU 0x21
k EQU 0x30
m EQU 0x31
q EQU 0x34
mdp1 EQU 0x32
in1 EQU 0x33
in2 EQU 0x40
 ref EQU 0x41
 in3 EQU 0x42
 in4 EQU 0x43
 in5 EQU 0x51
 in6 EQU 0x52
 in7 EQU 0x53
 in8 EQU 0x54
 mdp2 EQU 0x44
 mdp3 EQU 0x45
 mdp4 EQU 0x46
 mdp5 EQU 0x47
 mdp6 EQU 0x48
 mdp7 EQU 0x49
 mdp8 EQU 0x50


 
START
 ;------------------------------------------------------------------------------------------------
; configuring as input and output ports
	bsf STATUS, RP0 			;	select bank 1 

	;FOR KEYPAD
	movlw b'11110000' 			
	movwf TRISB 
	
	movlw b'000' 			
	movwf TRISE 

	;FOR LCD CONFIG
	movlw b'11111000'
	movwf TRISD

	;FOR LCD OUTPUT
	movlw 0x00					
	movwf TRISC					

	bcf STATUS, RP0 			;	select bank 0
	
	movlw b'000' 			
	movwf PORTE 
;-----------------------------------------------------------------------------------------------------------------
	test
	movlw 'P'
	call display_digit
	movlw 'A'
	call display_digit
	movlw 'S'
	call display_digit
	movlw 'S'
	call display_digit
	movlw 'W'
	call display_digit
	movlw 'O'
	call display_digit
	movlw 'R'
	call display_digit
	movlw 'D'
	call display_digit
	movlw 0x3A
	call display_digit
	movlw ' '
	call display_digit
	movlw ' '
	call display_digit
	movlw ' '
	call display_digit
	movlw ' '
	call display_digit
	movlw ' '
	call display_digit
	movlw ' '
	call display_digit
	movlw ' '
	call display_digit
	
	
	
	movlw d'10'
	movwf ref
	movlw d'3'
	movwf mdp1
	movlw d'4'
	movwf mdp2
	movlw d'5'
	movwf mdp3
	movlw d'6'
	movwf mdp4
	movlw d'7'
	movwf mdp5
	movlw d'8'
	movwf mdp6
	movlw d'9'
	movwf mdp7
	movlw d'0'
	movwf mdp8
	
	;mdp : 34567890
	
	
	movlw d'10'
	movwf in1
	movlw d'10'
	movwf in2
	movlw d'10'
	movwf in3
	movlw d'10'
	movwf in4
	movlw d'10'
	movwf in5
	movlw d'10'
	movwf in6
	movlw d'10'
	movwf in7
	movlw d'10'
	movwf in8
	
	
	
	
	
	
	
	
	



;Main-------------------------------------------------------------------------------------------------
begin	
	
	
	
	premier	
	call check_keypad
	call segundo
	movfw in1
	subwf ref,W
	BTFSC STATUS,Z
	goto premier
	
	call segundo
	
	deuxieme
	call check_keypad2
	call segundo
	movfw in2
	subwf ref,W
	BTFSC STATUS,Z
	goto deuxieme
	
	call segundo
	
	troisieme
	call check_keypad3
	call segundo
	movfw in3
	subwf ref,W
	BTFSC STATUS,Z
	goto troisieme
	
	call segundo
	
	quatrieme
	call check_keypad4
	call segundo
	movfw in4
	subwf ref,W
	BTFSC STATUS,Z
	goto quatrieme
	
	call segundo
	
	cinquieme
	call check_keypad5
	call segundo
	movfw in5
	subwf ref,W
	BTFSC STATUS,Z
	goto cinquieme
	
	call segundo
	
	sixieme
	call check_keypad6
	call segundo
	movfw in6
	subwf ref,W
	BTFSC STATUS,Z
	goto sixieme
	
	call segundo
	
	septieme
	call check_keypad7
	call segundo
	movfw in7
	subwf ref,W
	BTFSC STATUS,Z
	goto septieme
	
	call segundo
	
	huitieme
	call check_keypad8
	call segundo
	movfw in8
	subwf ref,W
	BTFSC STATUS,Z
	goto huitieme
	
	call segundo
	
	;check first character
	movfw in1
	subwf mdp1,W
	BTFSC STATUS,Z
	goto $+2
	call faux
	;check second caracter
	movfw in2
	subwf mdp2,W
	BTFSC STATUS,Z
	goto $+2
	call faux
	
	movfw in3
	subwf mdp3,W
	BTFSC STATUS,Z
	goto $+2
	call faux
	
	movfw in4
	subwf mdp4,W
	BTFSC STATUS,Z
	goto $+2
	call faux
	
	movfw in5
	subwf mdp5,W
	BTFSC STATUS,Z
	goto $+2
	call faux
	
	movfw in6
	subwf mdp6,W
	BTFSC STATUS,Z
	goto $+2
	call faux
	
	movfw in7
	subwf mdp7,W
	BTFSC STATUS,Z
	goto $+2
	call faux
		
	movfw in8
	subwf mdp8,W
	BTFSC STATUS,Z
	call succes
	call faux
	
	
	
	
	

	
	
	
	
	
				
;-----------------------------------------------------------------------------------------------------   
    
    
succes:
	
	call LCDRESET
	call LCDRESET
	call LCDRESET
	movlw 'B'
	call display_digit
	movlw 'R'
	call display_digit
	movlw 'A'
	call display_digit
	movlw 'V'
	call display_digit
	movlw 'O'
	call display_digit
	movlw '!'
	call display_digit
	movlw '!'
	call display_digit
	movlw '!'
	movlw b'001' 			
	movwf PORTE 
	
	goto $

faux:
	call LCDRESET
	call LCDRESET
	call LCDRESET
	movlw 'R'
	call display_digit
	movlw 'E'
	call display_digit
	movlw 'F'
	call display_digit
	movlw 'U'
	call display_digit
	movlw 'S'
	call display_digit
	movlw 'E'
	call display_digit
	movlw '!'
	call display_digit
	movlw '!'
	
	movlw b'010' 			
	movwf PORTE 
	
	call segundo
	call segundo
	call segundo
	call segundo
	call segundo
	call segundo
	call segundo
	call segundo
	movlw b'000' 			
	movwf PORTE 
	call ON
	
	
	

	

;The part which scans keypad-----------------------------------------------------------------------------
 check_keypad					;	This routine will scan the keypad for any key presses.

		bsf PORTB, 0			;  scan the 1st column of keys		
		;========================================================
		btfsc PORTA, 4			;	has the ON/OFF key been pressed? if yes then
		call ON
	
		btfsc PORTA, 6			;	has the 1 key been pressed? if yes then
		call ONE
		
		
		btfsc PORTB, 6			;	has the 4 key been pressed? if yes then
		call FOUR	
		
		btfsc PORTB, 7			;	has the 7 key been pressed? if yes then
		call SEVEN
	
		bcf PORTB, 0			;	finished column 1

	
		bsf PORTB, 1			;	scan the 2nd column of keys
		;=========================================================
		btfsc PORTA, 4			;	has the 0 key been pressed? if yes then
		CALL ZERO				
		
		btfsc PORTA, 6			;	has  the 2 key been pressed? if yes then
		CALL TWO				
	
		btfsc PORTB, 6			;	has the 5 key been pressed? if yes then
		CALL FIVE				
	
		btfsc PORTB, 7			;	has the 8 key been pressed? if yes then
		CALL EIGHT				
	
		bcf PORTB, 1			;	finished column 2

	
		bsf PORTB, 2			; scan the 3rd column of keys
		;=====================================================
						
		
		btfsc PORTA, 6			;	has the 3 key been pressed? if yes then
		CALL THREE				
		
		btfsc PORTB, 6			;	has the 6 key been pressed? if yes then
		CALL SIX				
		
		btfsc PORTB, 7			;	has the 9 key been pressed? if yes then
		CALL NINE				
	
		bcf PORTB, 2			;	finished column 3





	return						;	and now return to the main routine
;----------------------------------------------------------------------------------------------------------------





;----------------------------------------------------------------------------------------------------------------
;KEY FUNTIONS
ZERO:
movlw d'0'
movwf in1
movlw 0x30
call display_digit
return 


ONE:
movlw d'1'
movwf in1
MOVLW 0x31
call display_digit
return 

TWO:
movlw d'2'
movwf in1
movlw 0x32
call display_digit
return 

THREE:
movlw d'3'
movwf in1
movlw 0x33
call display_digit
return 

FOUR:
movlw d'4'
movwf in1
movlw 0x34
call display_digit
return 

FIVE:
movlw d'5'
movwf in1
movlw 0x35
call display_digit
return 

SIX:
movlw d'6'
movwf in1
movlw 0x36
call display_digit
return 

SEVEN:
movlw d'7'
movwf in1
movlw 0x37
call display_digit
return 

EIGHT:
movlw d'8'
movwf in1
movlw 0x38
call display_digit
return 

NINE:
movlw d'9'
movwf in1
movlw 0x39
call display_digit
return 


    
 check_keypad2					;	This routine will scan the keypad for any key presses.

		bsf PORTB, 0			;  scan the 1st column of keys		
		;========================================================
		btfsc PORTA, 4			;	has the ON/OFF key been pressed? if yes then
		call ON
	
		btfsc PORTA, 6			;	has the 1 key been pressed? if yes then
		call ONE2
		
		
		btfsc PORTB, 6			;	has the 4 key been pressed? if yes then
		call FOUR2	
		
		btfsc PORTB, 7			;	has the 7 key been pressed? if yes then
		call SEVEN2
	
		bcf PORTB, 0			;	finished column 1

	
		bsf PORTB, 1			;	scan the 2nd column of keys
		;=========================================================
		btfsc PORTA, 4			;	has the 0 key been pressed? if yes then
		CALL ZERO2				
		
		btfsc PORTA, 6			;	has the 2 key been pressed? if yes then
		CALL TWO2				
	
		btfsc PORTB, 6			;	has the 5 key been pressed? if yes then
		CALL FIVE2				
	
		btfsc PORTB, 7			;	has the 8 key been pressed? if yes then
		CALL EIGHT2				
	
		bcf PORTB, 1			;	finished column 2

	
		bsf PORTB, 2			; scan the 3rd column of keys
		;=====================================================
						
		
		btfsc PORTA, 6			;	has the 3 key been pressed? if yes then
		CALL THREE2				
		
		btfsc PORTB, 6			;	has the 6 key been pressed? if yes then
		CALL SIX2				
		
		btfsc PORTB, 7			;	has the 9 key been pressed? if yes then
		CALL NINE2				
	
		bcf PORTB, 2			;	finished column 3


	


	return	
ZERO2:
movlw d'0'
movwf in2
movlw 0x30
call display_digit
return 


ONE2:
movlw d'1'
movwf in2
MOVLW 0x31
call display_digit
return 

TWO2:
movlw d'2'
movwf in2
movlw 0x32
call display_digit
return 

THREE2:
movlw d'3'
movwf in2
movlw 0x33
call display_digit
return 

FOUR2:
movlw d'4'
movwf in2
movlw 0x34
call display_digit
return 

FIVE2:
movlw d'5'
movwf in2
movlw 0x35
call display_digit
return 

SIX2:
movlw d'6'
movwf in2
movlw 0x36
call display_digit
return 

SEVEN2:
movlw d'7'
movwf in2
movlw 0x37
call display_digit
return 

EIGHT2:
movlw d'8'
movwf in2
movlw 0x38
call display_digit
return 

NINE2:
movlw d'9'
movwf in2
movlw 0x39
call display_digit
return 

    
    
    check_keypad3					;	This routine will scan the keypad for any key presses.

		bsf PORTB, 0			;  scan the 1st column of keys		
		;========================================================
		btfsc PORTA, 4			;	has the ON/OFF key been pressed? if yes then
		call ON
	
		btfsc PORTA, 6			;	has the 1 key been pressed? if yes then
		call ONE3
		
		
		btfsc PORTB, 6			;	has the 4 key been pressed? if yes then
		call FOUR3	
		
		btfsc PORTB, 7			;	has the 7 key been pressed? if yes then
		call SEVEN3
	
		bcf PORTB, 0			;	finished column 1

	
		bsf PORTB, 1			;	scan the 2nd column of keys
		;=========================================================
		btfsc PORTA, 4			;	has the 0 key been pressed? if yes then
		CALL ZERO3				
		
		btfsc PORTA, 6			;	has the 2 key been pressed? if yes then
		CALL TWO3				
	
		btfsc PORTB, 6			;	has the 5 key been pressed? if yes then
		CALL FIVE3				
	
		btfsc PORTB, 7			;	has the 8 key been pressed? if yes then
		CALL EIGHT3				
	
		bcf PORTB, 1			;	finished column 2

	
		bsf PORTB, 2			; scan the 3rd column of keys
		;=====================================================
						
		
		btfsc PORTA, 6			;	has the 3 key been pressed? if yes then
		CALL THREE3				
		
		btfsc PORTB, 6			;	has the 6 key been pressed? if yes then
		CALL SIX3				
		
		btfsc PORTB, 7			;	has the 9 key been pressed? if yes then
		CALL NINE3				
	
		bcf PORTB, 2			;	finished column 3




	return	
ZERO3:
movlw d'0'
movwf in3
movlw 0x30
call display_digit
return 


ONE3:
movlw d'1'
movwf in3
MOVLW 0x31
call display_digit
return 

TWO3:
movlw d'2'
movwf in3
movlw 0x32
call display_digit
return 

THREE3:
movlw d'3'
movwf in3
movlw 0x33
call display_digit
return 

FOUR3:
movlw d'4'
movwf in3
movlw 0x34
call display_digit
return 

FIVE3:
movlw d'5'
movwf in3
movlw 0x35
call display_digit
return 

SIX3:
movlw d'6'
movwf in3
movlw 0x36
call display_digit
return 

SEVEN3:
movlw d'7'
movwf in3
movlw 0x37
call display_digit
return 

EIGHT3:
movlw d'8'
movwf in3
movlw 0x38
call display_digit
return 

NINE3:
movlw d'9'
movwf in3
movlw 0x39
call display_digit
return 
    
    
    check_keypad4					;	This routine will scan the keypad for any key presses.

		bsf PORTB, 0			;  scan the 1st column of keys		
		;========================================================
		btfsc PORTA, 4			;	has the ON/OFF key been pressed? if yes then
		call ON
	
		btfsc PORTA, 6			;	has the 1 key been pressed? if yes then
		call ONE4
		
		
		btfsc PORTB, 6			;	has the 4 key been pressed? if yes then
		call FOUR4	
		
		btfsc PORTB, 7			;	has the 7 key been pressed? if yes then
		call SEVEN4
	
		bcf PORTB, 0			;	finished column 1

	
		bsf PORTB, 1			;	scan the 2nd column of keys
		;=========================================================
		btfsc PORTA, 4			;	has the 0 key been pressed? if yes then
		CALL ZERO4				
		
		btfsc PORTA, 6			;	has the 2 key been pressed? if yes then
		CALL TWO4				
	
		btfsc PORTB, 6			;	has the 5 key been pressed? if yes then
		CALL FIVE4				
	
		btfsc PORTB, 7			;	has the 8 key been pressed? if yes then
		CALL EIGHT4				
	
		bcf PORTB, 1			;	finished column 2

	
		bsf PORTB, 2			; scan the 3rd column of keys
		;=====================================================
						
		
		btfsc PORTA, 6			;	has the 3 key been pressed? if yes then
		CALL THREE4				
		
		btfsc PORTB, 6			;	has the 6 key been pressed? if yes then
		CALL SIX4				
		
		btfsc PORTB, 7			;	has the 9 key been pressed? if yes then
		CALL NINE4				
	
		bcf PORTB, 2			;	finished column 3


		


	return
ZERO4:
movlw d'0'
movwf in4
movlw 0x30
call display_digit
return 


ONE4:
movlw d'1'
movwf in4
MOVLW 0x31
call display_digit
return 

TWO4:
movlw d'2'
movwf in4
movlw 0x32
call display_digit
return 

THREE4:
movlw d'3'
movwf in4
movlw 0x33
call display_digit
return 

FOUR4:
movlw d'4'
movwf in4
movlw 0x34
call display_digit
return 

FIVE4:
movlw d'5'
movwf in4
movlw 0x35
call display_digit
return 

SIX4:
movlw d'6'
movwf in4
movlw 0x36
call display_digit
return 

SEVEN4:
movlw d'7'
movwf in4
movlw 0x37
call display_digit
return 

EIGHT4:
movlw d'8'
movwf in4
movlw 0x38
call display_digit
return 

NINE4:
movlw d'9'
movwf in4
movlw 0x39
call display_digit
return 
    
    
    check_keypad5					;	This routine will scan the keypad for any key presses.

		bsf PORTB, 0			;  scan the 1st column of keys		
		;========================================================
		btfsc PORTA, 4			;	has the ON/OFF key been pressed? if yes then
		call ON
	
		btfsc PORTA, 6			;	has the 1 key been pressed? if yes then
		call ONE5
		
		
		btfsc PORTB, 6			;	has the 4 key been pressed? if yes then
		call FOUR5	
		
		btfsc PORTB, 7			;	has the 7 key been pressed? if yes then
		call SEVEN5
	
		bcf PORTB, 0			;	finished column 1

	
		bsf PORTB, 1			;	scan the 2nd column of keys
		;=========================================================
		btfsc PORTA, 4			;	has the 0 key been pressed? if yes then
		CALL ZERO5				
		
		btfsc PORTA, 6			;	has the 2 key been pressed? if yes then
		CALL TWO5				
	
		btfsc PORTB, 6			;	has the 5 key been pressed? if yes then
		CALL FIVE5				
	
		btfsc PORTB, 7			;	has the 8 key been pressed? if yes then
		CALL EIGHT5				
	
		bcf PORTB, 1			;	finished column 2

	
		bsf PORTB, 2			; scan the 3rd column of keys
		;=====================================================
					
		
		btfsc PORTA, 6			;	has the 3 key been pressed? if yes then
		CALL THREE5				
		
		btfsc PORTB, 6			;	has the 6 key been pressed? if yes then
		CALL SIX5				
		
		btfsc PORTB, 7			;	has the 9 key been pressed? if yes then
		CALL NINE5				
	
		bcf PORTB, 2			;	finished column 3




	return
	
ZERO5:
movlw d'0'
movwf in5
movlw 0x30
call display_digit
return 


ONE5:
movlw d'1'
movwf in5
MOVLW 0x31
call display_digit
return 

TWO5:
movlw d'2'
movwf in5
movlw 0x32
call display_digit
return 

THREE5:
movlw d'3'
movwf in5
movlw 0x33
call display_digit
return 

FOUR5:
movlw d'4'
movwf in5
movlw 0x34
call display_digit
return 

FIVE5:
movlw d'5'
movwf in5
movlw 0x35
call display_digit
return 

SIX5:
movlw d'6'
movwf in5
movlw 0x36
call display_digit
return 

SEVEN5:
movlw d'7'
movwf in5
movlw 0x37
call display_digit
return 

EIGHT5:
movlw d'8'
movwf in5
movlw 0x38
call display_digit
return 

NINE5:
movlw d'9'
movwf in5
movlw 0x39
call display_digit
return 
    
 check_keypad6					;	This routine will scan the keypad for any key presses.

		bsf PORTB, 0			;  scan the 1st column of keys		
		;========================================================
		btfsc PORTA, 4			;	has the ON/OFF key been pressed? if yes then
		call ON
	
		btfsc PORTA, 6			;	has the 1 key been pressed? if yes then
		call ONE6
		
		
		btfsc PORTB, 6			;	has the 4 key been pressed? if yes then
		call FOUR6	
		
		btfsc PORTB, 7			;	has the 7 key been pressed? if yes then
		call SEVEN6
	
		bcf PORTB, 0			;	finished column 1

	
		bsf PORTB, 1			;	scan the 2nd column of keys
		;=========================================================
		btfsc PORTA, 4			;	has the 0 key been pressed? if yes then
		CALL ZERO6				
		
		btfsc PORTA, 6			;	has the 2 key been pressed? if yes then
		CALL TWO6				
	
		btfsc PORTB, 6			;	has the 6 key been pressed? if yes then
		CALL FIVE6				
	
		btfsc PORTB, 7			;	has the 8 key been pressed? if yes then
		CALL EIGHT6				
	
		bcf PORTB, 1			;	finished column 2

	
		bsf PORTB, 2			; scan the 3rd column of keys
		;=====================================================
						
		
		btfsc PORTA, 6			;	has the 3 key been pressed? if yes then
		CALL THREE6				
		
		btfsc PORTB, 6			;	has the 6 key been pressed? if yes then
		CALL SIX6				
		
		btfsc PORTB, 7			;	has the 9 key been pressed? if yes then
		CALL NINE6				
	
		bcf PORTB, 2			;	finished column 3




	return
ZERO6:
movlw d'0'
movwf in6
movlw 0x30
call display_digit
return 


ONE6:
movlw d'1'
movwf in6
MOVLW 0x31
call display_digit
return 

TWO6:
movlw d'2'
movwf in6
movlw 0x32
call display_digit
return 

THREE6:
movlw d'3'
movwf in6
movlw 0x33
call display_digit
return 

FOUR6:
movlw d'4'
movwf in6
movlw 0x34
call display_digit
return 

FIVE6:
movlw d'5'
movwf in6
movlw 0x35
call display_digit
return 

SIX6:
movlw d'6'
movwf in6
movlw 0x36
call display_digit
return 

SEVEN6:
movlw d'7'
movwf in6
movlw 0x37
call display_digit
return 

EIGHT6:
movlw d'8'
movwf in6
movlw 0x38
call display_digit
return 

NINE6:
movlw d'9'
movwf in6
movlw 0x39
call display_digit
return 
    
check_keypad7					;	This routine will scan the keypad for any key presses.

		bsf PORTB, 0			;  scan the 1st column of keys		
		;========================================================
		btfsc PORTA, 4			;	has the ON/OFF key been pressed? if yes then
		call ON
	
		btfsc PORTA, 6			;	has the 1 key been pressed? if yes then
		call ONE7
		
		
		btfsc PORTB, 6			;	has the 4 key been pressed? if yes then
		call FOUR7	
		
		btfsc PORTB, 7			;	has the 7 key been pressed? if yes then
		call SEVEN7
	
		bcf PORTB, 0			;	finished column 1

	
		bsf PORTB, 1			;	scan the 2nd column of keys
		;=========================================================
		btfsc PORTA, 4			;	has the 0 key been pressed? if yes then
		CALL ZERO7				
		
		btfsc PORTA, 6			;	has the 2 key been pressed? if yes then
		CALL TWO7				
	
		btfsc PORTB, 6			;	has the 6 key been pressed? if yes then
		CALL FIVE7				
	
		btfsc PORTB, 7			;	has the 8 key been pressed? if yes then
		CALL EIGHT7				
	
		bcf PORTB, 1			;	finished column 2

	
		bsf PORTB, 2			; scan the 3rd column of keys
		;=====================================================
					
		
		btfsc PORTA, 6			;	has the 3 key been pressed? if yes then
		CALL THREE7				
		
		btfsc PORTB, 6			;	has the 6 key been pressed? if yes then
		CALL SIX7				
		
		btfsc PORTB, 7			;	has the 9 key been pressed? if yes then
		CALL NINE7				
	
		bcf PORTB, 2			;	finished column 3




	return
    
ZERO7:
movlw d'0'
movwf in7
movlw 0x30
call display_digit
return 


ONE7:
movlw d'1'
movwf in7
MOVLW 0x31
call display_digit
return 

TWO7:
movlw d'2'
movwf in7
movlw 0x32
call display_digit
return 

THREE7:
movlw d'3'
movwf in7
movlw 0x33
call display_digit
return 

FOUR7:
movlw d'4'
movwf in7
movlw 0x34
call display_digit
return 

FIVE7:
movlw d'5'
movwf in7
movlw 0x35
call display_digit
return 

SIX7:
movlw d'6'
movwf in7
movlw 0x36
call display_digit
return 

SEVEN7:
movlw d'7'
movwf in7
movlw 0x37
call display_digit
return 

EIGHT7:
movlw d'8'
movwf in7
movlw 0x38
call display_digit
return 

NINE7:
movlw d'9'
movwf in7
movlw 0x39
call display_digit
return 
    
check_keypad8					;	This routine will scan the keypad for any key presses.

		bsf PORTB, 0			;  scan the 1st column of keys		
		;========================================================
		btfsc PORTA, 4			;	has the ON/OFF key been pressed? if yes then
		call ON
	
		btfsc PORTA, 6			;	has the 1 key been pressed? if yes then
		call ONE8
		
		
		btfsc PORTB, 6			;	has the 4 key been pressed? if yes then
		call FOUR8	
		
		btfsc PORTB, 7			;	has the 7 key been pressed? if yes then
		call SEVEN8
	
		bcf PORTB, 0			;	finished column 1

	
		bsf PORTB, 1			;	scan the 2nd column of keys
		;=========================================================
		btfsc PORTA, 4			;	has the 0 key been pressed? if yes then
		CALL ZERO8				
		
		btfsc PORTA, 6			;	has the 2 key been pressed? if yes then
		CALL TWO8				
	
		btfsc PORTB, 6			;	has the 6 key been pressed? if yes then
		CALL FIVE8				
	
		btfsc PORTB, 7			;	has the 8 key been pressed? if yes then
		CALL EIGHT8				
	
		bcf PORTB, 1			;	finished column 2

	
		bsf PORTB, 2			; scan the 3rd column of keys
		;=====================================================
					
		
		btfsc PORTA, 6			;	has the 3 key been pressed? if yes then
		CALL THREE8				
		
		btfsc PORTB, 6			;	has the 6 key been pressed? if yes then
		CALL SIX8				
		
		btfsc PORTB, 7			;	has the 9 key been pressed? if yes then
		CALL NINE8				
	
		bcf PORTB, 2			;	finished column 3


		


	return
    
    
ZERO8:
movlw d'0'
movwf in8
movlw 0x30
call display_digit
return 


ONE8:
movlw d'1'
movwf in8
MOVLW 0x31
call display_digit
return 

TWO8:
movlw d'2'
movwf in8
movlw 0x32
call display_digit
return 

THREE8:
movlw d'3'
movwf in8
movlw 0x33
call display_digit
return 

FOUR8:
movlw d'4'
movwf in8
movlw 0x34
call display_digit
return 

FIVE8:
movlw d'5'
movwf in8
movlw 0x35
call display_digit
return 

SIX8:
movlw d'6'
movwf in8
movlw 0x36
call display_digit
return 

SEVEN8:
movlw d'7'
movwf in8
movlw 0x37
call display_digit
return 

EIGHT8:
movlw d'8'
movwf in8
movlw 0x38
call display_digit
return 

NINE8:
movlw d'9'
movwf in8
movlw 0x39
call display_digit
return 
    


LCDRESET:
movlw 0x01
call DISPLAY

clrf 0x35
clrf 0x36
clrf 0x37
return

ON:
    call LCDRESET
    call LCDRESET
    call LCDRESET
    
    movlw d'10'
	movwf in1
	movlw d'10'
	movwf in2
	movlw d'10'
	movwf in3
	movlw d'10'
	movwf in4
	movlw d'10'
	movwf in5
	movlw d'10'
	movwf in6
	movlw d'10'
	movwf in7
	movlw d'10'
	movwf in8
	
	call DELAY1
    
	goto test

REMISEZERO:
    
	movlw d'10'
	movwf in1
	movlw d'10'
	movwf in2
	movlw d'10'
	movwf in3
	movlw d'10'
	movwf in4
	movlw d'10'
	movwf in5
	movlw d'10'
	movwf in6
	movlw d'10'
	movwf in7
	movlw d'10'
	movwf in8
	
	call DELAY1
    
	goto test
	
	
    



;----------------------------------------------------------------------------------------------------------------



display_digit:
		BSF PORTD,0; CONTROL SIGNAL TO RS
		BCF PORTD,1; CONTROL SIGNAL TO R/W
		BSF PORTD,2; CONTROL SIGNAL TO 'E'
		
		;Here the value already stored in the W reg is send to DISPLAY	
		call DISPLAY

		MOVLW 0X38  ;initialises the display
		CALL DISPLAY
		
		
		MOVLW 0X0E ; dont blink the cursor
		CALL DISPLAY

		BSF PORTD,0
		RETURN

DISPLAY:   
   		MOVWF PORTC

		BCF PORTD,2
		CALL DELAY1

		BSF PORTD,2
		CALL DELAY1

		BCF PORTD,0
		RETURN

DELAY1:	
		MOVLW	D'13'	 ;A VERY SMALL DELAY
		MOVWF	0X38
		MOVLW	D'251'
		MOVWF	0X39
		LOOP:	DECFSZ	0X39
				GOTO	LOOP
				DECFSZ	0X38
				GOTO	LOOP
		RETURN
		RETURN	

	return					
;----------------------------------------------------------------------------------------------------------------

segundo
nop
movlw d'150' ;establecer valor de la variable m
movwf m
mloopcorto:
;nop
decfsz m,f
goto mloopcorto

movlw d'42' ;establecer valor de la variable i
movwf i
iloopcorto:
nop ;NOPs de relleno (ajuste de tiempo)
movlw d'68' ;establecer valor de la variable j
movwf j
jloopcorto:
;nop ;NOPs de relleno (ajuste de tiempo)
movlw d'15' ;establecer valor de la variable k
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
	
	

