module Controller_Unit_FSM (
	input logic CLK, RST,
	input logic [1:0]  ALUFlags,
	output logic [7:0] InstrAddr,
	input logic [15:0] ReadInstr,
	output logic [15:0] ReadInstrOut,
	output logic WE,
	output logic ALUorM);
	
	Deco dec(ReadInstr, WE, ALUorM, ReadInstrOut);
		
	FSM_UNIT maquina(CLK, RST, ALUFlags, InstrAddr);
	
	
endmodule

