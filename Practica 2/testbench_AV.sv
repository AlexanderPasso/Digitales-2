module testbench_AV();

logic CLK;
logic RST;
logic WE;
logic [7:0] InstrAddr;
logic [15:0] ReadInstr;
logic [7:0] DataAddr;
logic [7:0] ReadAddr;
logic [7:0] WriteData;

localparam clock_cycle = 1ps;

SimpleCPU_DM_IM_AV CPU(CLK,RST,WE,InstrAddr,ReadInstr,DataAddr,ReadAddr,WriteData);


initial
begin
	
	CLK = 1'b0;
	RST = 1'b1;
	#clock_cycle;
	
	RST = 1'b0;	
	
	#(clock_cycle*50);
end	
	always #(clock_cycle/2) CLK = ~CLK;


endmodule 