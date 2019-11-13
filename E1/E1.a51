      org 0000H
			
      ajmp main
	  
      org 30H
main: ;mov P3, #00000010B
      mov P0, #10000000B
      lcall delay
      mov P0, #00000000B
      lcall delay
      ajmp main
		  
delay: push psw
       mov r4,#5
   l3: mov r2,#00H
   l1: mov r3,#00H
   l2: djnz r3,l2
       djnz r2,l1
       djnz r4,l3
       pop psw
       ret

       end