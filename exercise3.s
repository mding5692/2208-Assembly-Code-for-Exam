    ; Creating a stack to do factorials
    ; factorial is based on x! 
x     equ #3    ; sets up a dummy number for x
      area exercise3, code, readonly
      entry
      
      mov sp, #0
      mov fp, #0    ; clears the pointers so that does not affect our operations
      
      mov r0, #x    ; sets up r0 as #x
      
      bl start      ; branches and links to start
      
start sub sp, sp, #8  ; moves sp up by 8 to store the result and the first x
      mov r1, r0      ; moves the value in r0 to r1 as count
      str r0, [sp, #4]  ; stores x in the next cell
      
set   sub sp, sp, #4  ; keeps decrementing the stack
      sub r1, r1, #1  ; decrements r1 as the count
      str r1, [sp]    ; stores it at sp
      cmp r1, #0      ; sees if r1 is equal to 0
      bne set         ; keeps looping
      
push  add sp, sp, #4  ; moves down the stack
      ldr [sp], r1    ; moves what sp is pointing at to r1
      mov r2, r1      ; moves r1 to r2 to stop errors
      add r1, r1, r2  ; adds it to r1
      sub r0, r0, #1  ; decrements the count
      cmp r0, #0      ; sees if we have reached zero
      bne push        ; if not, keep looping
      
      ; it is done
      str r1, [sp, #-4] ; stores it to the allocated cell for the result
      
      
      area exercise3, data, readwrite
stack dcd SPACE 
      
      
      end
      
