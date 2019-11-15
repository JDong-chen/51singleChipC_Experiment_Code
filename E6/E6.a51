      org 00H
      ajmp main0

      org 03H
      ajmp X_IT0

      org 30H
main0: setb IT0
       setb EX0
       setb EA

       mov scon,#50H
       anl pcon,#7FH
       mov tmod,#20H
       mov th1,#0FDH
       mov tl1,#0FDH
       setb tr1
       clr ti
       mov A,#30H
        
loop1: 
       jnb ti,$
       clr ti
       ajmp loop1
 

 
X_IT0:
      LCALL delay
      MOV SBUF, A
      INC A
      RETI


		  
delay: mov r4,#4
   l3: mov r2,#00H
   l1: mov r3,#00H
   l2: djnz r3,l2
       djnz r2,l1
       djnz r4,l3
       ret
       end