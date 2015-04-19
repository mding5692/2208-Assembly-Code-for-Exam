		area lab3q3, code, readonly
		entry
		
q3a		mov 	r0, #3
		mov 	r1, #4		; assigns dummy values for testing
		

loop1		cmp 	r0, r1
		beq	done
		bgt 	gr8r1
		blt	lesr1
		
gr8r1		sub 	r0, r0, r1
		b	loop1

lesr1		sub 	r1, r1, r0
		b 	loop1
	
done	
		;=========================================
q3b		mov 	r0, #3
		mov 	r1, #4
		
loop2		cmp 	r0, r1
		beq	done2
		subgt 	r0,r0,r1
		sublt	r1,r1,r0
		b	loop2
		
done2		b 	done2

		
		end
