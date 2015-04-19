			area 	lab4q3, code, readonly
			entry
		
			; first loads using a loop onto the stack
			; then iterates through outer loop 
			; then inner loop
			; which calls for the sortTwo function
			; which swaps around the position in the stack
			
			; boilerplate code: points r0 to a and r1 to endOfArray
			adr		r0, a
			adr 	r1, endOfArray
			adr		sp, stack		; points to stack, maybe wrong, i need to do better 									;with stacks
			mov		r3, #0			; uses r3 as a count
			; loads the values into the stack
load			add		r3,	r3, #4		; r3 is incremented
			ldr		r4,	[a, r3]!	; loads into r2 whatever is in the array a
			str		r4,	[sp, r3]	; stores it into the stack
			cmp		r4, r1			; compares the two if equal the loading is done
			beq		startloop		; starts the comparison loop
			bne		load			; if not equal loops through loading
			; starts loop to iterate through stack
main			ldr		r3,	[sp,#4]!	; sp is incremented and loaded into r3	
			cmp		r3, endOfArray	; if not equal to endOfArray, keep looping
			beq		done			; if it is, its equal
			bne		sortTwo			; calls the sorting function
			
sortTwo			ldr		r4,	[sp,#4]		; r4 is sp + 4 or else incremented by 1 word
			cmp		r4, r3			; compares r4 and r3
			bgt		endSort			; if r4 is greater than r3, end the sort
			str		r4,	[sp]		; stores r4 at where the sp is pointing at, aka the lesser element
			str		r3, [sp,#4]		; stores r3 where r4 was at	

endSort			b		main			; when done, goes back to the Loop
			

done			b		done
				
			area 	lab4q3, data, readwrite
a          		dcd 	44,-56,3,65,-8,32,6,-87,54,65,87,32,65 
endOfArray 		space 	1 

stack			space	#0x00		; empty stack
			end
