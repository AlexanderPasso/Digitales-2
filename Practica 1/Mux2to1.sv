
module Mux2to1(input logic sel,
					input logic [7:0] x0, x1,
					output logic [7:0] y);
					
					
				assign y = sel ? x1:x0; // Si sel=0 pasa x0 

endmodule
