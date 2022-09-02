
module FlipFlopD (input logic clk,
				  input logic rst,
				  input logic en, d,
				  output logic q);
	
	
	
always @ (posedge clk, posedge rst)
				if(rst)
					q<=1'b0;
				else if(en==0)
					q <= d;
			
				    					  
endmodule	

		  


				  
				  		  


				  
					  


 	  

	
			


