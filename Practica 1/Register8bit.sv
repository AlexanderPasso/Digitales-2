

module Register8bit(input logic [7:0] data,
						 input logic clk,
				       input logic rst,
				       input logic en,
				       output logic [7:0] q);
				  
				  logic q1,q2,q3,q4,q5,q6,q7,q8;
	
				 
				  
				  FlipFlopD f1(clk, rst, en, data[7], q1);
				  FlipFlopD f2(clk, rst, en, data[6], q2);
				  FlipFlopD f3(clk, rst, en, data[5], q3);
				  FlipFlopD f4(clk, rst, en, data[4], q4);
				  FlipFlopD f5(clk, rst, en, data[3], q5);
				  FlipFlopD f6(clk, rst, en, data[2], q6);
				  FlipFlopD f7(clk, rst, en, data[1], q7);
				  FlipFlopD f8(clk, rst, en, data[0], q8);
				  
				  assign q = {q1,q2,q3,q4,q5,q6,q7,q8};
				  
endmodule 			  
				  
	

