        	    area lab2q2, code, readonly
		    entry
		
		    ; assigns dummy values to test operations
		    mov r0, #4
		    mov	r1, #2
		    mov r2, #3
		    mov r4, #0		; clears r4 just in case
main	  	    tst	r0, #1	; if it is even it is equal to zero
		    beq	isEven
		    bne	isOdd
		
isEven		    mov	r1, r1, lsr r0
		    mov r2, r2, lsl r0
		
		    b	result
		
isOdd	  	    mov r1, r1, lsl #8
		    mov r2, r2, lsr #8
		
		    b 	result
		
result		    mov r3, r3, lsl #4	; divides by 16
		    add	r2, r2, r3
		    add r4, r1, r2	
		
	    	    area lab2q2, data, readwrite
		
		
		
	      	    end
