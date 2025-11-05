.global _start
_start:
.data
memory:  .space 40     

.text
.global _start
_start:
	LDR r4,=memory 
	MOV r0,#0
	MOV r1,#1
	MOV r3,#0
	STR r0, [r4],#4
	STR r1, [r4],#4
	
loop:
	MOV r2,#0
	ADD r2,r0,r1
	STR r2,[r4],#4
	MOV r0,r1
	MOV r1,r2
	ADD r3,#1
	CMP r3,#8
	BLT loop

end:
	B end
	