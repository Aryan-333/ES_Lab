	AREA RESET, DATA, READONLY
	EXPORT __Vectors
__Vectors 
	DCD 0x10001000 ; stack pointer value when stack is empty
	DCD Reset_Handler ; reset vector
	ALIGN
	AREA mycode, CODE, READONLY
	ENTRY
	EXPORT Reset_Handler
Reset_Handler
	LDR R0, =SRC ; Load address of SRC into R0
	LDR R1, =DST ; Load the address of DST onto R1 
	MOV R2, #10
up	LDR R3, [R0], #4
	STR R3, [R1], #4
	SUBS R2, #1
	bne up
STOP
	B STOP ; Be there
SRC DCD 1, 2, 3, 4, 5, 6, 7, 8, 9, 10 ;SRC location in code memory
	AREA mydata, DATA, READWRITE
DST DCD 0 ;DST location in data memory
	END