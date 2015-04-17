  ; Exercise: Scans string terminated by null byte (0x00) and copies sting 
  ; from source location pointed to by r0 to destination pointed by r1
  
  ; My answer: uses a loop that copies part of string using ldrb into r0 and the moving it to r1
  ; if r0 == 0x00 then terminates the string
        area exercise1, code, readonly
        entry
        
        ldr r0, =string  ; assigns string to r0
        mov r1, #0        ; r1 is cleared just in case
loop    ldrb r2, [r0], #1          ; start the loading loop by loading next byte in r0        
        strb r2, [r1], #1         ; stores it into r1
        cmp r2, #0x00      ; sees if it has reached the end terminator
        beq done          ; if it is equal than it is done
        bne loop          ; else keep looping
    
done    b   done          ; when program is done    
    
        area exercise1, data, readwrite
        align
string  dcd "Hello, this is a string" ; the string to be scanned    
eos     dcd #0x00  ;  end of string   
    
    end
