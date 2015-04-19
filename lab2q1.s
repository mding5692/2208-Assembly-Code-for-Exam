		    area lab2q1, code, readonly
  		    entry
		
		; first one is pre-index and next one is post-index
		; auto-indexed pre-indexed addressing mode
		    adr		r0, List
		    mov		r1, #5	; used as count
		    mov 	r2, #0	; used to store sum
loopPre		    ldr		r3, [r0, #4]!	; first increments and then stores
		    add 	r2, r2, r3
		    subs	r1, r1, #1	; decrements count
		    bne		loopPre
		
		; auto-indexed post-indexed addressing mode
post	  	    mov		r0, #0	; clears r0		
	    	    adr		r0, List	
	    	    mov 	r1, #5
	    	    mov		r2, #0
loopPos	    	    ldr		r3, [r1], #4	; loads the register then increments
		    add		r2, r2, r3	
		    subs 	r1, r1, #1
	    	    bne		loopPos
		
		; non-autoindexing mode
non		    mov 	r0, #0		; clears r0
		    adr		r0, List
		    mov 	r1, #5
		    mov		r2, #0
		    mov		r3, #4		; used to increment
loopNon	            ldr		r4, [r0]
		    add		r0, r0, r3
		    add 	r2, r2, r4
		    subs	r1, r1, #1
		    bne		loopNon
		
done		    b 		done		
		
		    area lab2q1, data, readwrite
List                DCD  3,4,3,6,7 ;the numbers to be added together 
                       ;each one is 4 bytes (20 bytes in total) 		
		
		
		    end
