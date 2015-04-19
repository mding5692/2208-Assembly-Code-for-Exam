; uses a inner count in the sortTwo function to see if there was any errors
			area	lab4q4, code, readonly

		; boilerplate code: points r0 to a and r1 to endOfArray
			adr		r0, a
			adr 	r1, endOfArray
			adr		sp, stack		; points to stack
			mov		r3, #0			; uses r3 as a count
			mov		r6, #0			; uses r6 as a count
			; loads the values into the stack
load			add		r3,	r3, #4		; r3 is incremented
			ldr		r4,	[a, r3]!	; loads into r2 whatever is in the array a
			str		r4,	[sp, r3]	; stores it into the stack
			cmp		r4, r1			; compares the two if equal the loading is done
			beq		startloop		; starts the comparison loop
			bne		load			; if not equal loops through loading
			; starts loop to iterate through stack
main			ldr		r4,	[sp,#4]!	; sp is incremented and loaded into r3	
			b		sortTwo			; calls the sorting function
			
sortTwo			ldr		r5,	[sp,#4]		; r4 is sp + 4 or else incremented by 1 word
			cmp		r5, endOfArray	; if not equal to endOfArray, keep looping
			beq		sortUsed		; sees if sort has been used
			cmp		r5, r4			; compares r5 and r4
			bgt		endSort			; if r5 is gt r4, end the sort
			add		r6,r6,#1		; r6 is incremented
			str		r5,	[sp]		; stores r4 at where the sp is pointing at, aka the lesser element
			str		r4, [sp,#4]		; stores r3 where r4 was at	
			b		main			; moves back to main

endSort			sub		r6,r6,#1		; if sort is not needed then decrement
			b		main
			
sortUsed		cmp		r6, #0			; compares r5 with 0
			beq		done			; if there is no errors or it has been solved 
			bgt		main				; keeps iterating if there are still issues
			

done			b		done
				
			area 	lab4q3, data, readwrite
a          		dcd 	44,-56,3,65,-8,32,6,-87,54,65,87,32,65 
endOfArray 		space 	1 

stack			space	#0x00		; empty stack
			end
