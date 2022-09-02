
module FSM_UNIT(	
	input logic CLK, RST,
	input logic [2:0]  ALUFlags,
	output logic [7:0] InstrAddr);
	
	
	/* Definición de estados de la FSM */
	typedef enum logic [7:0] {S0, S1, S2, S3, S4, S5, S6, S7, S8, S9, S10, S11, S12, S13, S14, 
									  S15, S16, S17} State;
									  

	/* Estado actual y siguiente */
	State currentState, nextState;
	
	/* Circuito secuencial para actualizar estado actual con el estado siguiente */
	always_ff @(posedge RST, posedge CLK) 
		if (RST)
			currentState <= S0;
		else 
			currentState <= nextState;
	
	
	always_comb begin
		case (currentState)
			S0: begin 
				 InstrAddr = 8'h00;
				 nextState = S1;
			end
					
			S1: begin 
				 InstrAddr = 8'h01;
				 nextState =S2 ;
			end
			
			S2: begin 
				 InstrAddr = 8'h02;
				 nextState = S3;
			end
			
			S3: begin 
				 InstrAddr = 8'h03;
				 nextState = S4;
			end
			
			S4: begin 
				 InstrAddr = 8'h04;
				 nextState = S5;
			end
			
			S5: begin 
				InstrAddr = 8'h05;
				 nextState = S6;
			end
			
			S6: begin 
				 InstrAddr = 8'h06;
				  if (ALUFlags == 3'b001 ) //Preguntar si aluflags es igual a 1, si se activa aluflasg(001)
						nextState = S7;
				  else
						nextState = S4;
			end
			
			S7: begin 
				 InstrAddr = 8'h07;
				 nextState = S8;
			end
			
			S8: begin 
				 InstrAddr = 8'h08;
				 nextState = S9;
			end
					
			S9: begin 
				 InstrAddr = 8'h09;
				  if (ALUFlags == 3'b001 ) //Preguntar si aluflags es igual a 2, si se activa aluflasg(001)
						nextState = S10;
				  else
						nextState = S1;
			end
			
			S10: begin 
				  InstrAddr = 8'h0A;
				  nextState = S11;
			end
			
			S11: begin 
				  InstrAddr = 8'h0B;
				  nextState = S12;
			end
			
			S12: begin 
				  InstrAddr = 8'h0C;
				  nextState = S13;
			end
			
			S13: begin 
				  InstrAddr = 8'h0D;
				  nextState = S14;
			end
			
			S14: begin 
				  InstrAddr = 8'h0E;
				  nextState = S15;
			end
			
			S15: begin 
				  InstrAddr = 8'h0F;
				  nextState = S16;
			end
			
			S16: begin 
				  InstrAddr = 8'h10;
				  nextState = S16;
			end
			
			default:begin	
				  InstrAddr = 8'h00;
				  nextState = S0;
			end
			
		endcase
	end	
	
	
endmodule

/*
module FSM_Unit_TestBench;

	logic CLK, RST;
	logic [2:0]  ALUFlags;
	logic [7:0] InstrAddr;
	localparam clock_cycle = 10us;
	
	FSM_UNIT FSM1(CLK,RST,ALUFlags,InstrAddr);
	
	initial begin
		CLK = 1'b0;
		RST = 1'b1;
		#clock_cycle;
		RST = 1'b0;
		ALUFlags = 3'b010;
		#(clock_cycle * 26);
		ALUFlags = 3'b001;
		#(clock_cycle * 26);
		$stop;
	end
	always #(clock_cycle/2) CLK = ~CLK;


endmodule
*/

