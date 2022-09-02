
module Register32bits(input logic [7:0] inData,
							 input logic clk, en, rst,
							 input logic [1:0] dir1,dir2,dir3,
							 output logic [7:0] outRg1,outRg2);
							 
							 logic [7:0] outRegister01,outRegister02,outRegister03,outRegister04;
							 logic [7:0] outDm1,outDm2,outDm3,outDm4;
							  
							 
							 
							 Register8bit R01(outDm1,clk,rst,en,outRegister01);
							 Register8bit R02(outDm2,clk,rst,en,outRegister02);
							 Register8bit R03(outDm3,clk,rst,en,outRegister03);
							 Register8bit R04(outDm4,clk,rst,en,outRegister04);
							 
							 Mux4to1 Mx1(dir1,outRegister01,outRegister02,outRegister03,outRegister04,outRg1);
							 Mux4to1 Mx2(dir2,outRegister01,outRegister02,outRegister03,outRegister04,outRg2);
							 Demux1To4 Dx1(inData,dir3,outDm1,outDm2,outDm3,outDm4);
							 
	
										 											
							
endmodule 

