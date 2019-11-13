      org 00H
      ajmp main0
        
  
      org 30H
main0: jb P2.0,main1
       lcall delay
       jb P2.0,main1 
       mov P0,#10011111B

main1: jb P2.1,main2
       lcall delay
       jb P2.1,main1 
       mov P0,#00100101B
        
main2: jb P2.2,main3
       lcall delay
       jb P2.2,main1 
       mov P0,#00001101B

main3: jb P2.3,main4
       lcall delay
       jb P2.3,main1 
       mov P0,#10011001B

main4: jb P2.4,main5
       lcall delay
       jb P2.4,main1 
       mov P0,#01001001B

main5: jb P2.5,main6
       lcall delay
       jb P2.5,main1 
       mov P0,#01000001B

main6: jb P2.6,main7
       lcall delay
       jb P2.6,main1 
       mov P0,#00011111B

main7: jb P2.7,main0
       lcall delay
       jb P2.7,main1 
       mov P0,#00000001B

      ajmp main0
		  
delay: mov r4,#1
   l3: mov r2,#00H
   l1: mov r3,#00H
   l2: djnz r3,l2
       djnz r2,l1
       djnz r4,l3
       ret
       end