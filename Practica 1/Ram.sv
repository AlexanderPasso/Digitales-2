
module Ram(input logic [7:0] data,
			  input logic [7:0] addr,
			  input logic en, clk,	
			  output logic [7:0] RD,
			  output logic [7:0] DATAMEM [0:255]);
			 
			 
			  assign RD = DATAMEM[addr];
						  
				
				integer i;
				
				
				initial $readmemh("RAMdata.hex", DATAMEM);		
				
				initial begin
					
					for (i=0; i<256; i=i+1)
						$display (i," : ",DATAMEM[i]);
				
				end
			   
			  
			  
			  always @(posedge clk)
			  begin
					if(en) begin
						DATAMEM[addr] <= data;
					end
			  end
			  
			  
			  
endmodule 


/*
module ram_th();

	reg [7:0] data;
	reg [7:0] addr;
	reg en, clk;
	wire [7:0] out;
	
	Ram R1 (data,addr,en,clk,out);
	
	// Reloj 
	
	initial
	begin
		clk = 1'b1;
		forever #50 clk = ~clk;
	
	end
	

	
	//creando algunos casos para las entradas de memoria 
	
	initial 
	begin
	
		//Escribir
		data = 8'b0;
		addr = 8'b0;
		en = 1'b1;  //Escribir 
	   #100;
	
		
		data = 8'h01; //formato hexadecimal
		addr = 8'd01; //formado decimal 
		en = 1'b1;  //Escribir 
	   #100;
		
		data = 8'h02;
		addr = 8'd02;
		en = 1'b1;  //Escribir 
	   #100;
		
		data = 8'h03;
		addr = 8'd03;
		en = 1'b1;  //Escribir 
	   #100;
		
	
	
	//Para leer
	
		addr = 8'b0;
		en = 1'b0;  //Leer
	   #100;
		
		addr = 8'd01;
		en = 1'b0;  //Leer
	   #100;
		
		addr = 8'd02;
		en = 1'b0;  //Leer
	   #100;
		
		addr = 8'd03;
		en = 1'b0;  //Leer
	   #100;
		
		
		
		
	
	
	end

endmodule   	*/