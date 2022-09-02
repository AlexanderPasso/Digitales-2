
module Deco(ReadInstr, WE, ALUorM, ReadInstrOut);

	 input logic [15:0] ReadInstr;
	 output logic WE;
	 output logic ALUorM;
	 output logic [15:0] ReadInstrOut;
	 
	 assign ReadInstrOut = ReadInstr;
	 	
	always @(*) begin
	if (ReadInstr[15:13]==3'b111) begin
		WE <= 1'b1; 
		ALUorM <= 1'b0;
		end
	else if (ReadInstr[15:13]==3'b110) begin
		WE <= 1'b0; 
		ALUorM <= 1'b1;
		end
	else if (ReadInstr[15:13]==3'b101) begin
		WE <= 1'b0; 
		ALUorM <= 1'b0;
		end
	else if (ReadInstr[15:13]==3'b100) begin
		WE <= 1'b0; 
		ALUorM <= 1'b0;
		end	
	else if (ReadInstr[15:13]==3'b000) begin
		WE <= 1'b0; 
		ALUorM <= 1'b0;
		end	
		
	else begin
		WE <= 1'b0;
		ALUorM <= 1'b0;
		end
	end 
			
endmodule
