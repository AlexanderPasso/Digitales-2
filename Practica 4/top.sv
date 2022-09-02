module top(clk, reset, WriteData, DataAdr, MemWrite);

	//PORTS
	input logic clk, reset;
	output logic [31:0] WriteData, DataAdr;
	output logic MemWrite;

	//SIGNAL
	logic [31:0] PC, Instr, ReadData;
	
	// instantiate processor and memories
	arm arm(clk, reset, PC, Instr, MemWrite, DataAdr,WriteData, ReadData);
	
	imem imem(PC, Instr);
	
	dmem dmem(clk, MemWrite, DataAdr, WriteData, ReadData);

endmodule

module testbench();


	logic clk;
	logic reset;
	logic [31:0] WriteData, DataAdr;
	logic MemWrite;
	
	// instantiate device to be tested
	top dut(clk, reset, WriteData, DataAdr, MemWrite);
	
	// initialize test
	initial
		begin
		reset <= 1; #8; reset <= 0;
		end
	
	// generate clock to sequence tests
	always
		begin
		clk <= 1; # 5; clk <= 0; # 5;
		end
	
	
	
	// check that 7 gets written to address 0x64
	// at end of program
	always @(negedge clk)
		begin
//		$display("Hola"); #1000
//		$stop;
		
			if(MemWrite) begin
			
				if(DataAdr === 100 & WriteData === 7) begin
				$display("Simulation succeeded"); #20
				$stop;
				end 
				
				else if (DataAdr !== 96) begin
				$display("Simulation failed");
				$stop;
				end
				
			end
			
		end
	
endmodule
