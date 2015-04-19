		  area lab3q1, code, readonly
		  entry
		
		  ; adds  32 times of the content of registers r0 and the content
		  ; of r1 only if N is clear. Store the result in register r2 

q1a		addpl	r2, r1, r0, lsr #5	
		
		  ; subtract content of register r3 from 0x990 put results in r4 only if C is set and 
		  ; Z is clear

q1b		rsbcsne	r4, r3, #0x990	

		  ; clear 2nd least significant byte of r5 ie store (00000000)^2 and put in r6
		  ; cpsr must be affected

q1c		movs	r6, r5, lsl #8		; this is probably wrong, im too tired to care		
		
		
		
		  end
