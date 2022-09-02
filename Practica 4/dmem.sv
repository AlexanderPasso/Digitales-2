module dmem(clk, we, a, wd, rd);


	input logic clk, we;
	input logic [31:0] a, wd;
	output logic [31:0] rd;
	
	//SIGNAL
	logic [31:0] RAM[63:0];

	initial $readmemh("C:/Users/alexa/OneDrive - INSTITUTO TECNOLOGICO METROPOLITANO - ITM/Documentos/Practica 4/Practica 4/RAMdata.mem", RAM);
	
	assign rd = RAM[a[31:2]]; // word aligned

	always_ff @(posedge clk)
		if (we) RAM[a[31:2]] <= wd;

		
endmodule
