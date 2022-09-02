module alu(Mov, a, b, ALUControl, Result, ALUFlags);

	//PORTS
		input logic Mov;
		input logic [1:0] ALUControl;
		input logic [31:0] a, b;
		output logic [31:0] Result;
		output logic [3:0] ALUFlags;

	
	//SIGNALS
		logic [32:0] sum;				
		logic [31:0] temp;
		logic [31:0] ALUResult;
	
	
		always @(*) 
			begin
				if(ALUControl[0] == 1'b0) sum = (Mov ? {1'b0,b} : ({1'b0,a}+{1'b0,b}));
				else sum = {1'b0,a}+~{1'b1,b}+32'h0000001;
			end
	
	//OP ALUFLAGS
		assign ALUFlags[3] = ALUResult[31];
		assign temp = ~ALUResult;
		assign ALUFlags[2] = temp[31] & temp[30] & temp[29] & temp[28] & temp[27] & temp[26] & temp[25] & temp[24] & 
									temp[23] & temp[22] & temp[21] & temp[20] & temp[19] & temp[18] & temp[17] & temp[16] & temp[15] &
									temp[14] & temp[13] & temp[12] & temp[11] & temp[10] & temp[9] & temp[8] & temp[7] & temp[6] & 
									temp[5] & temp[4] & temp[3] & temp[2] & temp[1] & temp[0];
		assign ALUFlags[1] = sum[32] & ~ALUControl[1];
		assign ALUFlags[0] = ~(ALUControl[0] ^ a[31] ^ b[31]) & (a[31] ^ sum[31]) & ~ALUControl[1];
																				
	//ALU
		
		always_comb
		
			case(ALUControl)
				
				2'b00 : ALUResult = sum[31:0];
				2'b01 : ALUResult = sum[31:0];
				2'b10 : ALUResult = a & b;
				2'b11 : ALUResult = a | b;
			
			endcase
		
		assign Result = ALUResult;
							
endmodule



module ALU_testbench ();
	
	logic [1:0] ALUControl;
	logic [31:0] a, b, Result;	
	logic [3:0] ALUFlags;
	logic Mov;
	
	alu TA(Mov,a,b,ALUControl,Result,ALUFlags);
			
	initial begin
	
			Mov = 1'b0;
			ALUControl = 2'b00; 						
		a = 32'h0000_0000; b = 32'h0000_0000;	#10;
		a = 32'h0000_0000; b = 32'hFFFF_FFFF; #10;		
	   a = 32'h0000_0001; b = 32'hFFFF_FFFF;	#10;						
	   a = 32'h0000_00FF; b = 32'h0000_00FF; #10;
		
			ALUControl = 2'b01;
		a = 32'h0000_0000; b = 32'h0000_0000;	#10;
	   a = 32'h0000_0000; b = 32'hFFFF_FFFF;	#10;						
		a = 32'h0000_0001; b = 32'h0000_0001; #10;		
	   a = 32'h0000_00FF; b = 32'h0000_0001; #10;
		
			ALUControl = 2'b10;		
		a = 32'hFFFF_FFFF; b = 32'hFFFF_FFFF;	#10;
	   a = 32'hFFFF_FFFF; b = 32'h1234_5678;	#10;						
		a = 32'h1234_5678; b = 32'h8765_4321; #10;		
	   a = 32'h0000_0000; b = 32'hFFFF_FFFF; #10;
		
			ALUControl = 2'b11;
		a = 32'hFFFF_FFFF; b = 32'hFFFF_FFFF;	#10;
	   a = 32'h1234_5678; b = 32'h8765_4321; #10;		
		a = 32'h0000_0000; b = 32'hFFFF_FFFF; #10;
		a = 32'h0000_0000; b = 32'h0000_0000;	#10;						
			   
		$stop;
	
	end

endmodule
