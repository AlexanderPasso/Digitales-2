

module DP_DM_AV(input logic CLK,               // Reloj de 1Khz
					 input logic RST,               // Reset
					 input logic [1:0] RSrc1,
					 input logic [7:0] Src2,
					 input logic [1:0] RDst3,
					 input logic WE,
					 input logic ALUorM,
					 input logic [2:0] ALUCntr,
					 input logic ALUSrc2,
					 output logic [2:0] AluFlags,
					 output logic [7:0] DataAddr,
					 output logic [7:0] ReadData,
					 output logic [7:0] WriteData);
					 
					 
					 mDataPath DP(RSrc1,RDst3,ALUCntr,ALUSrc2,ALUorM,RST,CLK,WE,Src2, ReadData, AluFlags, DataAddr,WriteData);
					 Ram R1(WriteData, DataAddr, WE,CLK,ReadData);
					 
					 
endmodule 

/*

module testbench_AV();

		logic CLK;              // Reloj de 1Khz
		logic RST;               // Reset
		logic [1:0] RSrc1;
		logic [7:0] Src2;
		logic [1:0] RDst3;
		logic WE;
		logic ALUorM;
		logic [2:0] ALUCntr;
		logic ALUSrc2;
		logic [2:0] AluFlags;
		logic [7:0] DataAddr;
		logic [7:0] ReadData;
		logic [7:0] WriteData;
		
		
		localparam clock_cycle = 10us;
			DP_DM_AV md(CLK,RST,RSrc1,Src2,RDst3,WE,ALUorM,ALUCntr,ALUSrc2,AluFlags,DataAddr,ReadData,WriteData);
	
		
		
		initial
		begin
		
			CLK = 1'b0;
			RST = 1'b01;
			#clock_cycle;
			RST = 1'b0;
			
			
			ALUCntr = 3'b101; ALUorM = 1'b0; RDst3 = 2'b00; WE=0; RSrc1 = 2'b00; ALUSrc2= 1'b1; Src2 = 8'b00101000; #clock_cycle;
			ALUCntr = 3'b101; ALUorM = 1'b0; RDst3 = 2'b01; WE=0; RSrc1 = 2'b01; ALUSrc2= 1'b1; Src2 = 8'b00011110; #clock_cycle;
			
			ALUCntr = 3'b011; ALUorM = 1'b0; RDst3 = 2'b10; WE=0; RSrc1 = 2'b00; ALUSrc2= 1'b0; Src2 = 8'b01000000; #clock_cycle;
			
			//Escribiendo en memoria
			ALUCntr = 3'b111; ALUorM = 1'b1; RDst3 = 2'b00; WE=1; RSrc1 = 2'b01; ALUSrc2= 1'b1; Src2 = 8'b00000000; #clock_cycle;
			ALUCntr = 3'b101; ALUorM = 1'b1; RDst3 = 2'b01; WE=1; RSrc1 = 2'b01; ALUSrc2= 1'b1; Src2 = 8'b00000001; #clock_cycle;
			ALUCntr = 3'b101; ALUorM = 1'b1; RDst3 = 2'b10; WE=1; RSrc1 = 2'b01; ALUSrc2= 1'b1; Src2 = 8'b00000010; #clock_cycle;
			
			//LOAD
			
			ALUCntr = 3'b011; ALUorM = 1'b1; RDst3 = 2'b00; WE=0; RSrc1 = 2'b11; ALUSrc2= 1'b1; Src2 = 8'b00000010; #clock_cycle;
			
			
			
			/*
			#clock_cycle;
				
			ALUCntr = 3'b101;
			ALUorM = 1'b0;
			RDst3 = 2'b11;
			WE = 0;
			RSrc1 = 2'b01;
			ALUSrc2 = 1'b1; //
			Src2 = {2'b01, 6'd0};  // Constante = 0
			
			#clock_cycle;
			
			ALUCntr = 3'b101;
			ALUorM = 1'b0;
			RDst3 = 2'b11;
			WE = 0;
			RSrc1 = 2'b01;
			ALUSrc2 = 1'b1; //
			Src2 = 8'd11;  // Constante = 11 Valor inmediato
			
			#clock_cycle;
			
			ALUCntr = 3'b000;
			ALUorM = 1'b0;
			RDst3 = 2'b11;
			WE = 0;
			RSrc1 = 2'b00;
			ALUSrc2 = 1'b0; 
			Src2 = {2'b01, 6'd4}; //Reg2 + 4 bit (Arreglar)
			
			
			#clock_cycle;
			
		
			ALUCntr = 3'b000;
			ALUorM = 1'b0;
			RDst3 = 2'b11;
			WE = 0;
			RSrc1 = 2'b00;
			ALUSrc2 = 1'b1; //
			Src2 = 8'd8;  // Constante = 8
			
			#clock_cycle;
			
			ALUCntr = 3'b001;
			ALUorM = 1'b0;
			RDst3 = 2'b11;
			WE = 0;
			RSrc1 = 2'b00;
			ALUSrc2 = 1'b0; //
			Src2 = {2'b01, 6'd8};  // Constante = 8
			
			#clock_cycle;
			
			ALUCntr = 3'b001;
			ALUorM = 1'b0;
			RDst3 = 2'b11;
			WE = 0;
			RSrc1 = 2'b10; //registro 3
			ALUSrc2 = 1'b1; //
			Src2 = 8'd12;  // Constante = 12
			
			#clock_cycle;
			
			ALUCntr = 3'b010;
			ALUorM = 1'b0;
			RDst3 = 2'b11;
			WE = 0;
			RSrc1 = 2'b00; //registro 4
			ALUSrc2 = 1'b0; //
			Src2 = {2'b01, 6'd5};  // Constante = 5
			
			#clock_cycle;
			
			
			ALUCntr = 3'b010;
			ALUorM = 1'b0;
			RDst3 = 2'b11;
			WE = 0;
			RSrc1 = 2'b00;
			ALUSrc2 = 1'b1; //
			Src2 = 8'd7;  // Constante = 7
			
			#clock_cycle;
			
			
			ALUCntr = 3'b011;
			ALUorM = 1'b0;
			RDst3 = 2'b11;
			WE = 0;
			RSrc1 = 2'b00;
			ALUSrc2 = 1'b0; //
			Src2 = {2'b01, 6'd14};  // Constante = 14
			
			#clock_cycle;
			
			
			ALUCntr = 3'b011;
			ALUorM = 1'b0;
			RDst3 = 2'b11;
			WE = 0;
			RSrc1 = 2'b00;
			ALUSrc2 = 1'b1; //
			Src2 = 8'd17;  // Constante = 17
			
			#clock_cycle;
			
			ALUCntr = 3'b100;
			ALUorM = 1'b0;
			RDst3 = 2'b11;
			WE = 0;
			RSrc1 = 2'b00;
			ALUSrc2 = 1'b0; //
			Src2 = {2'b01, 6'd10};  // Constante = 10
			
			#clock_cycle;
			
			ALUCntr = 3'b100;
			ALUorM = 1'b0;
			RDst3 = 2'b11;
			WE = 0;
			RSrc1 = 2'b00;
			ALUSrc2 = 1'b1; //
			Src2 = 8'd20;  // Constante = 20
			
			#clock_cycle;
		
			
			ALUCntr = 3'b011;
			ALUorM = 1'b1;
			RDst3 = 2'b11;
			WE = 0;
			RSrc1 = 2'b00;
			ALUSrc2 = 1'b1; //
			Src2 = 8'd25;  // Constante = 25 Valor inmediato
			
			#clock_cycle;
			
			
			ALUCntr = 3'b011;
			ALUorM = 1'b1;  // 1 o 0 
			RDst3 = 2'b11;
			WE = 1;
			RSrc1 = 2'b00;
			ALUSrc2 = 1'b1; //
			Src2 = 8'd21;  // Constante = 25 Valor inmediato
			
			#clock_cycle;
			
			
			
			$stop;

		
		end
		
		always #(clock_cycle/2) CLK = ~CLK;
		

endmodule
*/