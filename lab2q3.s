		  area lab2q3and4, code, readonly
		  entry
		
		  mov r4, #2	; gives r4 dummy value
q3		  add	r0, r4, r4, lsr #128	
		
		  b 	done
		
q4a		;	1110 00 0 0000 0 0011 0010 111111110000	; = 0xE0032FF0 should be that but pls correct me
q4b		;   	binary = 0101 0000 0000 0111 0110 1000 0000 1000 => ANDPL r6, r7, #808

q5		;	
		

                  done	
		
		  end
