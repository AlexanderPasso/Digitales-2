
module Mux4to1 (input logic [1:0] sel,
					 input logic [7:0] dat1,dat2,dat3,dat4, 
					 output logic [7:0] outMux);
					 
					 always @ (dat1 or dat2 or dat3 or dat4 or sel) 
					 
					 begin
					 
						case (sel)
							
							2'b00 : outMux <= dat1;
							2'b01 : outMux <= dat2;
							2'b10 : outMux <= dat3;
							2'b11 : outMux <= dat4;
							
							
						endcase
					 end 
					 
endmodule 