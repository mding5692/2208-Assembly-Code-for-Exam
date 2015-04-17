  ;
  ;
  ; Write Arm code to implement the following C code:
  ; int s = 0 ;
  ; for ( i = 0; i < 10; i++ )
  ;   { s = s + i * i ; }
  ;
  ;
  
  ; My answer: use r0,r1 and r2, r0 to hold the result, and r1 to hold the count
  ; r0 is then the sum of r0 plus r1 multiplied by r1
  
      area exercise2, code, readonly
      entry

      mov r0, #0      ; clears r0
      mov r1, #0     ; sets r1 as 0 for the count
    
loop                ; creates a loop for the operations
      mov r2, #0    ; clears r2 just in case
      mov r3, r1    ; moves r1 to r3 to eliminate error
      mul r2, r1, r3  ; multiplies and assigns it to r2
      add r0, r0, r2  ; adds r2 to existing r0
      add r1, r1, #1 ; adds 1 to r1  
      cmp r1, #10   ; if not equal to 10
      bne loop      ; then keep looping
    
      area exercise2, data, readwrite
    
    
      end
