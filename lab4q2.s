			;
			; Not too sure about this one
			;
			AREA 	bubbleSort, CODE, READONLY
			ENTRY
;----------------------------------------------------
q1a			; implements the sortTwo function with the original code

main			ADR 	r0,a  ;r0 is a pointer to array a
			ADR 	r1,endOfArray ;address at the end of the array
			SUB 	r1,r1,r0      ;number of the array bytes
			ASR 	r1,#2         ;r1: length of the array,i.e., n

			MOV 	r2,#0         ;r2: outer loop counter,i.e., i
			SUB 	r4,r1,#1      ;r4 is (n - 1)
startOuter		CMP 	r2,r4         ;compare i with (n - 1) 
			BGE 	endOuter      ;if i >= (n - 1), then exit the outer loop
			MOV 	r3,#0         ;r3 is the inner loop counter, i.e., j
			SUB 	r5,r4,r2      ;r5 is (n - 1 - i)
startInner		CMP 	r3,r5         ;compare j with (n - 1 - j) 
			BGE 	endInner      ;if j >= (n - 1 -j), then exit the inner loop
			ADD 	r6,r0,r3,LSL#2;r6 is a pointer to a[j]
			ADD 	r7,r6,#4      ;r7 is a pointer to a[j+1]
			BL  	sortTwo       ;call sortTwo(*a[j],*a[j+1])
			ADD 	r3,r3,#1      ;increment inner counter j
			B   	startInner    ;loop again (inner loop)
endInner		ADD 	r2,r2,#1      ;increment outer counter i
			B   	startOuter    ;loop again (outer loop)
endOuter		B 	endOuter


			;=============================================
			; sortTwo subroutine
			; this is called with r6 as *a[j] and r7 as *a[j+1]
			; if r7 is less than r6 then swap them around
			
			; initialize the stack with registers r6 and r7, and the stack pointer
sortTwo			stmfd	sp!,{r6-r7}				
			cmp		r7,r6			; compares if r7 is less than r6
			blt		swap			; swaps if it r7 is less than r6
									; 

popStack		ldmfd	sp!,{r6-r7}		; else pops out the stack when done
			; goes back to inner function when done
			b		startInner

swap			str		r6,[sp, #4]		; stores r6 as the next element
			str		r7,[sp, #8]		; stores r7 as the next element
			b 		popStack		; pops the stack

			;----------------------------------------------------
			AREA 	bubbleSort, DATA, READWRITE
			ALIGN
a          		DCD 	44,-56,3,65,-8,32,6,-87,54,65,87,32,65
endOfArray 		SPACE 	1
	
stack			SPACE	#0x00		; initializes a stack 	
;----------------------------------------------------

			END
