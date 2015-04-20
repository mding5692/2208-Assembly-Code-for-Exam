        	    area lab2q2, code, readonly
		    entry
		
		    ; assigns dummy values to test operations -- i guess these this doesnt count
		    mov r0, #4
		    mov	r1, #2
		    mov r2, #3
		    mov r4, #0		; clears r4 just in case
		    
		    
main	  	    tst	r0, #1	; if it is even it is equal to zero
		
isEven		    moveq r1, r1, lsr r0
		    moveq r2, r2, lsl r0
		    beq	result
		
isOdd	  	    movne r1, r1, lsl #8
		    movne r2, r2, lsr #8
		
result		    add r2, r3, lsr #4	; divides by 16
		    add r4, r1, r2 	
		
	    
		
		
		
	      	    end
