      org 0000H
			
      ajmp main
	  
      org 30H
main: mov P3, #00000010B
      mov P0, #00000001B
      lcall delay
      mov P0, #00000010B
      lcall delay
      mov P0, #00000100B
      lcall delay
      mov P0, #00001000B
      lcall delay
      mov P0, #00010000B
      lcall delay
      mov P0, #00100000B
      lcall delay
      mov P0, #01000000B
      lcall delay
      mov P0, #10000000B
      lcall delay
      mov P0, #11000000B
      lcall delay
      mov P0, #11100000B
      lcall delay
      mov P0, #11110000B
      lcall delay
      mov P0, #11111000B
      lcall delay
      mov P0, #11111100B
      lcall delay
      mov P0, #11111110B
      lcall delay
      mov P0, #11111111B
      lcall delay
      mov P0, #10101010B
      lcall delay
      mov P0, #01010101B
      lcall delay
      ajmp main
		  
delay: push psw
       mov r4,#2
   l3: mov r2,#00H
   l1: mov r3,#00H
   l2: djnz r3,l2
       djnz r2,l1
       djnz r4,l3
       pop psw
       ret

       end