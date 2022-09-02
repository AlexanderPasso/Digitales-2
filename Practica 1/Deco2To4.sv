
module Deco2To4 (input logic [1:0] addr,
					  input logic [7:0] Datain,
					  output logic [7:0] out1, out2,out3,out4);
					  
					  //wire [7:0] line1,line2,line3,line4;
					  

					  always @(addr)
						begin
							case(addr)
					
								00: out1<=0000;
								01: out2<=0010;
								10: out3<=0100;
								11: out4<=1000;
							
						
							endcase
						
						end 				
						
endmodule 