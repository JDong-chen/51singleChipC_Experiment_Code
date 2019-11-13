      ORG 0000H
      AJMP MAIN

      ORG 30H
MAIN: MOV P2,#0F0H 
      LCALL DELAY 
      MOV  R4,00H
      MOV  A,P2  
      ANL  A,#0F0H  
      CJNE A,#0F0H,L 


DESPLAY:
        MOV  A,R7
        MOV  DPTR,#TABLE 
        MOVC A,@A+DPTR
        MOV  P1,A 
        AJMP MAIN 

L: LCALL DELAY  
   MOV  A,P2  
   JB  ACC.4,L1 
   MOV  R3,#00H  
   AJMP Q1

L1:  JB  ACC.5,L2
     MOV  R3,#01H
     AJMP Q1

L2:  JB  ACC.6,L3
     MOV  R3,#02H
     AJMP Q1

L3:  JB  ACC.7,MAIN
     MOV  R3,#03H
     AJMP Q1

Q1:  MOV  P2,#0FH  
     LCALL DELAY  
     MOV  A,P2  
     ANL  A,#0FH  
     JB  ACC.0,Q2 
     MOV  R4,#00H  
     AJMP JIA

Q2:  JB ACC.1,Q3
     MOV  R4,#04H
     AJMP JIA

Q3:  JB ACC.2,Q4
     MOV R4,#08H
     AJMP JIA

Q4:  JB  ACC.3,MAIN
     MOV  R4,#0CH
     AJMP JIA

JIA: MOV  A,R3   
     ADD  A,R4
     MOV  R7,A  
     AJMP MAIN

DELAY: MOV  R6,#20H  

 Q6:  MOV R5,#0BBH
      DJNZ R5,$
      DJNZ R6,Q6
      RET

TABLE: DB 0xc0, 0xf9, 0xa4, 0xb0, 0x99, 0x92, 0x82, 0xf8, 0x80, 0x90, 0x88, 0x83, 0xc6, 0xa1, 0x86, 0x8e

       END  