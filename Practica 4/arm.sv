module arm(clk, reset, PC, Instr, MemWrite, ALUResult, WriteData, ReadData);

	//PORTS
	input logic clk, reset;
	output logic [31:0] PC;
	input logic [31:0] Instr;
	output logic MemWrite;
	output logic [31:0] ALUResult, WriteData;
	input logic [31:0] ReadData;

	//SIGNALS
	logic [3:0] ALUFlags;
	logic RegWrite, ALUSrc, MemtoReg, PCSrc;
	logic [1:0] RegSrc, ImmSrc, ALUControl;
	logic Mov;
	
	
	controller c(clk, reset, Instr[31:12], ALUFlags,RegSrc, RegWrite, 
					 ImmSrc, ALUSrc, ALUControl, MemWrite, MemtoReg, PCSrc, Mov);
	
	datapath dp(clk, reset, RegSrc, RegWrite, ImmSrc,ALUSrc, ALUControl,
					MemtoReg, PCSrc, Mov, ALUFlags, PC, Instr, ALUResult, WriteData, ReadData);
	
	
endmodule
