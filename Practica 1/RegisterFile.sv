module RegisterFile(input logic [1:0] RA1, RA2, RA3, 
							input logic [7:0] WD3,
							input logic WE3, RST, CLK,
							output logic [7:0] RD1, RD2);
							
					
							
							//Register32bits RG(WD3, CLK, WE3, RST,RA1,RA2,RA3,RD1,RD2);
							
							logic [7:0] regis [3:0];
							assign RD1 = regis [RA1];
							assign RD2 = regis [RA2];
							
							always @(posedge RST or posedge CLK) begin
								if(RST) begin 
								
									regis[0] <= 8'b00000000;
									regis[1] <= 8'b00000000;
									regis[2] <= 8'b00000000;
									regis[3] <= 8'b00000000;
								end
								
								else if(WE3 ==0) begin
									regis[RA3] <= WD3;
								end
							
							end
							
							
							
endmodule 

/*
module register_th();

	reg [1:0] RA1,RA2,RA3;
	reg [7:0] WD3;
	reg WE3,RST,CLK;
	wire [7:0] RD1,RD2;
	
	
	RegisterFile RF1(RA1,RA2,RA3,WD3, ~WE3,RST,CLK,RD1,RD2);
	
	//Reloj
	initial
	begin
		CLK = 1'b1;
		forever #50 CLK = ~CLK;
	
	end
	
	
	initial
	begin
		
		RST = 1'b01;
		# 100
		
		
		RST = 1'b0;
		WE3 = 1'b0; //Enble=0 para escribir 
		WD3 = 8'b0; //Dato a escribir 
		RA3 = 2'b0; // Selecciona registro para escritura 
		
		
		#100;
		
		WE3 = 1'b0; //Escribe 
		WD3 = 8'd02;
		RA3 = 2'd01;
		
		
		#100;
		
		WE3 = 1'b0; //Escribe 
		WD3 = 8'd04;
		RA3 = 2'd02;
		
		#100;
		
		WE3 = 1'b0;
		WD3 = 8'd05;
		RA3 = 2'd03;
		
		
		#100;
		
		WE3 = 1'b01; //Enable = 1 para leer 
		RA1 = 2'b0; //Selecciona registro para mostrar valor por RD1
		RA2 = 2'b0;
		
		
		#100
		
		WE3 = 1'b01; //Enable = 1 para leer 
		RA1 = 2'd01; //Selecciona registro para mostrar valor por RD1
		RA2 = 2'd01;
		
		#100;
		
		WE3 = 1'b01; //Enable = 1 para leer 
		RA1 = 2'd02; //Selecciona registro para mostrar valor por RD1
		RA2 = 2'd02;
		
		#100;
		
		RST = 1'b0;
		WE3 = 1'b01; //Enable = 1 para leer 
		RA1 = 2'd03;
		RA2 = 2'd03;
		
		#100;
		
		RST = 1'b0;
		WE3 = 1'b01; //Enable = 1 para leer 
		RA1 = 2'd03;
		RA2 = 2'd03;
		
		$stop;
		
		///////////////////////////
				
		
	
	end 
	
 
endmodule */
