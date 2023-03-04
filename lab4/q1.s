	AREA RESET,DATA,READONLY
	EXPORT __Vectors
__Vectors
	DCD 0x40001000
	DCD Reset_Handler
	ALIGN
	AREA mycode,CODE,READONLY
	ENTRY
	EXPORT Reset_Handler
Reset_Handler
	LDR R0,=N1
	LDR R1,=RESULT
	LDR R2,[R0]
	MOV R3,#1
	MOV R4,#0xa
	MOV R5,#0
	MOV R7,#0xf
up	MOV R6,R2
	and R6,R7
	MLA R5,R6,R3,R5
	MUL R3,R4
	LSR R2,#4
	cmp r2,#0
	bne up
	STR R5,[R1]
STOP
	B STOP
N1 DCD 0x12345678
	AREA data, DATA, READWRITE
RESULT DCD 0
	END
	