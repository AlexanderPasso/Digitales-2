
module mDataPath(input logic [1:0] RSrc1,
					 input logic [1:0] RDst3,
					 input logic [2:0] ALUCntr,
					 input logic ALUSrc2,
					 input logic ALUorM,
					 input logic Reset,
					 input logic CLK, WE,
					 input logic [7:0] Src2,
					 input logic [7:0] ReadData,
					 output logic [2:0] AluFlags,
					 output logic [7:0] DataAddr,
					 output logic [7:0] WriteData);
					 
					 logic [1:0] inRA2; //Entrada a RA1 del registro
					 logic [7:0] Result; //Entrada a WDe del registro
					 logic [7:0] outRD1; //Salida por RD de la memoria 
					 logic [7:0] inALUB;
					 
					 Mux2to1 M1(WE,Src2[7:6], RDst3, inRA2);
					 RegisterFile RF(RSrc1, inRA2,RDst3, Result, WE,Reset,CLK,outRD1, WriteData);
					 alu AL(outRD1,inALUB, ALUCntr, DataAddr,AluFlags);
					 Mux2to1 M2(ALUSrc2,WriteData, Src2, inALUB);
					 Mux2to1 M3(ALUorM,DataAddr, ReadData,Result);
					 
					 

endmodule 

