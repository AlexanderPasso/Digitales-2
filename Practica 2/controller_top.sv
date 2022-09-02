module controller_top(CLK, RST, ALUFlags, InstrAddr, leerInst, ReadInstrOut, WE, ALUorM);
    
	 input logic CLK;
	 input logic RST;
	 input logic [2:0]  ALUFlags;
	 output logic [7:0] InstrAddr;
	 output logic [15:0] leerInst;
	 output logic [15:0] ReadInstrOut;
	 output logic WE;
	 output logic ALUorM;
	
	Deco dec(leerInst, WE, ALUorM, ReadInstrOut);
		
	FSM_UNIT maquina(CLK, RST, ALUFlags, InstrAddr);
			  
	InstruccionMemory DataMemory(InstrAddr,leerInst);

endmodule
