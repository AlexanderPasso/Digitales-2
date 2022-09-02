
module Demux1To4(input logic [7:0] Data,
					 input logic [1:0] sel,
					 output logic [7:0] out1,out2,out3,out4);
					 
					 logic [7:0] in;
					 assign in = Data;
			

					 always @(Data or sel)
					 begin
							case(sel)
										2'b00: out1 = in; 
										2'b01: out2 = in; 
										2'b10: out3 = in; 
										2'b11: out4 = in; 
									
							endcase
					 end
endmodule 
