      org 0000H
			
      ajmp main
	  
      org 30H
main: mov P0, #00000011B
      lcall delay
      mov P0, #10011111B
      lcall delay
      mov P0, #00100101B
      lcall delay
      mov P0, #00001101B
      lcall delay
      mov P0, #10011001B
      lcall delay
      mov P0, #01001001B
      lcall delay
      mov P0, #01000001B
      lcall delay
      mov P0, #00011111B
      lcall delay
      mov P0, #00000001B
      lcall delay
      mov P0, #00001001B
      lcall delay
      ajmp main
		  
delay: mov r4,#8
   l3: mov r2,#00H
   l1: mov r3,#00H
   l2: djnz r3,l2
       djnz r2,l1
       djnz r4,l3
       ret
       end