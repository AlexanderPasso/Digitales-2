
module alu(input logic [7:0] A,B,
			  input logic [2:0] Cntr,
			  output logic [7:0] R,
			  output logic [2:0] AluFlags //Carry, mayor que, igual 
			  );
			  
			  logic [8:0] sum;
			  logic [3:0] Flags;
			  logic [7:0] temp;
			  logic [10:0] Result;
			  
			  assign sum = {1'b0,A}+{1'b0,B};
			  
			  //OP ALUFLAGS
				assign AluFlags[2] = sum[8];
				assign temp = (A ~^ B) ;
				assign AluFlags[0] = temp[7] & temp[6] & temp[5] & temp[4] & temp[3] & temp[2] & temp[1] & temp[0];						
				assign AluFlags[1] = A>B ? 1'b1 : 1'b0;
		
			  
	always @(*)  begin
	  case(Cntr)
			3'b000:
				Result = A & B;
			3'b001:
				Result = ~B;
			3'b010:
				Result = A ^ B;
			3'b011:
				Result = sum[7:0];
			3'b100:
				Result = A - B;
			3'b101:
				Result = B;
			3'b110:
				Result = 8'b0;
			3'b111:
				Result = 8'b0;
		 default:
			 Result = 8'b0;
     endcase
  end
  
   assign R = Result[7:0];
	
endmodule 

/*
module alu_tb;
		logic [7:0] A, B;
		logic [2:0] Cntr;
		logic [7:0] R;
		alu al(A, B, Cntr,R);
		
		//integer i;
	initial begin
			  
		A = 8'b00001011; B = 8'b00101000; Cntr=3'b000; #10;
		A = 8'b00101101; B = 8'b10101010; Cntr=3'b001; #10;
		A = 8'b01010110; B = 8'b01001001; Cntr=3'b010; #10;
		A = 8'b11011011; B = 8'b00101001; Cntr=3'b011; #10;
		
		
		$stop;
		
	end // initial	

	
endmodule */ 