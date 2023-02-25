		AREA RESET,DATA,READONLY
		EXPORT __Vectors
__Vectors
		DCD 0x10001000
		DCD Reset_Handler
		ALIGN
		AREA mycode,CODE,READONLY
		ENTRY
		EXPORT Reset_Handler
Reset_Handler
		LDR R0, =N
		LDR R3, =RES
		LDR R1,[R0]
		MLA R2,R1,R1,R1
		LSR R2,#1
		STR R2,[R3]	
STOP 	B STOP
N DCD 7	
		AREA mydata,DATA,READWRITE
RES DCD 0
		END