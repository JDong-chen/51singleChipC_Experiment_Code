      org 00H
      ajmp main0

      org 03H
      ajmp X_IT0

      org 30H
main0: setb IT0
       setb EX0
       setb EA
        
CLR1:	MOV R0,#00H
 
DISPLAY: MOV DPTR,#TAB	
		MOV A,R0	
		MOV B, A   
		CLR C
		SUBB A, #08H	
		MOV A, B   
		JNC CLR1   
 
		MOVC A,@A+DPTR
		MOV P0,A	
		
		SJMP DISPLAY 
 
X_IT0:INC R0
      lcall delay
      RETI
TAB:	DB 10011111B,00100101B,00001101B,10011001B,01001001B,01000001B,00011111B,00000001B

		  
delay: mov r4,#4
   l3: mov r2,#00H
   l1: mov r3,#00H
   l2: djnz r3,l2
       djnz r2,l1
       djnz r4,l3
       ret
       end