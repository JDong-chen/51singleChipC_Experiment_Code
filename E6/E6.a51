      org 00H
      ajmp main0

      org 03H
      ajmp X_IT0

      org 30H
main0: setb IT0
       setb EX0
       setb EA
        
       MOV SCON, #0x50
    ANL PCON, #0x7F
    MOV TMOD, #0x20
    MOV TH1, #0xFD
    MOV TL1, #0xFD
    SETB TR1
     MOV A, #01H
       SJMP $
 

 
X_IT0:MOV SBUF, A
      INC A
      lcall delay
      RETI


		  
delay: mov r4,#4
   l3: mov r2,#00H
   l1: mov r3,#00H
   l2: djnz r3,l2
       djnz r2,l1
       djnz r4,l3
       ret
       end