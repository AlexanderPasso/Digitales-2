module imem(input logic [31:0] a,
output logic [31:0] rd);


	logic [31:0] RAM[63:0];
	
	initial
	$readmemh("C:/Users/alexa/OneDrive - INSTITUTO TECNOLOGICO METROPOLITANO - ITM/Documentos/Practica 4/Practica 4/memfile.mem",RAM);
	
	assign rd = RAM[a[31:2]]; // word aligned
	
endmodule
