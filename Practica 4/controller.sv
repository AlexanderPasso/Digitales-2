module controller(clk, reset, Instr, ALUFlags, RegSrc, RegWrite, ImmSrc, ALUSrc, ALUControl, MemWrite, MemtoReg, PCSrc, Mov);

	//PORTS
	input logic clk, reset;
	input logic [31:12] Instr;
	input logic [3:0] ALUFlags;
	output logic [1:0] RegSrc;
	output logic RegWrite;
	output logic [1:0] ImmSrc;
	output logic ALUSrc;
	output logic [1:0] ALUControl;
	output logic MemWrite, MemtoReg;
	output logic PCSrc;
	output logic Mov;

	//SIGNALS
	logic [1:0] FlagW;
	logic PCS, RegW, MemW;
	logic NoWrite;


	decoder dec(Instr[27:26], Instr[25:20], Instr[15:12], FlagW, PCS, RegW, MemW,
					MemtoReg, ALUSrc, ImmSrc, RegSrc, ALUControl, NoWrite, Mov);
					
	condlogic cl(clk, reset, Instr[31:28], ALUFlags, FlagW, PCS, RegW, MemW, NoWrite,
					 PCSrc, RegWrite, MemWrite);
	
	
endmodule
