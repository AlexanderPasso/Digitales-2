module SimpleCPU_DM_IM_AV(
	   input logic CLK,
		input logic RST,
		output logic WE,
		output logic [7:0] InstrAddr,
		output logic [15:0] ReadInstr,
		output logic [7:0] DataAddr,
		output logic [7:0] ReadData,
		output logic [7:0] WriteData
);

		 logic [15:0] ReadInstrOut;
		 logic [2:0] ALUFlags;
		 logic ALUorM;
		 logic [2:0] ALUCntrl;
		 
		 always @(*) begin
			if (ReadInstrOut[15:14]==2'b11) begin
				ALUCntrl <= 3'b011;
			end
			else begin
				ALUCntrl <= ReadInstrOut[15:13];
			end
		 
		 end

		
		controller_top control(CLK, RST, ALUFlags, InstrAddr,ReadInstr,ReadInstrOut, WE, ALUorM);
		
		DP_DM_AV Datapath(CLK, RST, ReadInstrOut[10:9], ReadInstrOut[7:0], ReadInstrOut[12:11], WE,  ALUorM, ALUCntrl,  ReadInstrOut[8], ALUFlags, DataAddr, ReadData, WriteData );
				
endmodule

module testbench_AV();

logic CLK;
logic RST;
logic WE;
logic [7:0] InstrAddr;
logic [15:0] ReadInstr;
logic [7:0] DataAddr;
logic [7:0] ReadAddr;
logic [7:0] WriteData;

localparam clock_cycle = 1ms;

SimpleCPU_DM_IM_AV CPU(CLK,RST,WE,InstrAddr,ReadInstr,DataAddr,ReadAddr,WriteData);


initial
begin
	
	CLK = 1'b0;
	RST = 1'b1;
	#clock_cycle;
	
	RST = 1'b0;	
	
	#(clock_cycle*200);
	$stop;
end	
	always #(clock_cycle/2) CLK = ~CLK;
	


endmodule 