.global _start
_start:
    MOV     r0, #12321      @ Number
    MOV     r2, r0         @ Copy
    MOV     r4, #0         @ Reversed number
    MOV     r3, #10        @ Divisor 

loop:
    CMP     r0, #0         @ for division by 10 to continue number shldnt be equal to 0 == while (num>0)
    BEQ     done
    MOV     r5, #0         @ quotient = 0
	
div_loop:
    CMP     r0, r3
    BLT     div_done
    SUB     r0, r0, r3     @ r0-=10
    ADD     r5, r5, #1     @ quotient+=1
    B       div_loop

div_done:
    MOV     r6, r0         @ r6 = remainder (r0 now < 10)
    MOV     r0, r5         @ r0 = quotient
    MUL     r4, r4, r3     @ r4 = r4 * 10
    ADD     r4, r4, r6     @ r4 += remainder
    B       loop

done:
    CMP     r2, r4
    MOVEQ   r1, #1         
    MOVNE   r1, #0         

end:
    B       end
	