
module InstruccionMemory(IAddr,RInstr);

	input logic [7:0] IAddr;
	output logic [15:0] RInstr;
	
	logic [15:0] regis[255:0];
	
	assign RInstr = regis[IAddr];
		
  initial begin
      regis[0] = 16'hA100;
		regis[1] = 16'hA900;
		regis[2] = 16'hD100;
		regis[3] = 16'hD903;
		regis[4] = 16'h6A80;
		regis[5] = 16'h9F01;
		regis[6] = 16'h7F00;
		regis[7] = 16'hE906;
		regis[8] = 16'h6101;
		regis[9] = 16'h1903;
		regis[10] = 16'hB905;
		regis[11] = 16'hC701;
		regis[12] = 16'hCF02;
		regis[13] = 16'hD703;
		regis[14] = 16'h8040;
		regis[15] = 16'h6880;
		regis[16] = 16'h7B06;
	end 
endmodule