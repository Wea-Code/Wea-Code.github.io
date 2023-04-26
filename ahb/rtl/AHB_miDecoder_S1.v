module AHB_miDecoder_S1(
	HADDR,
	HSEL1,
	HSEL2);
	input wire [31:0]HADDR;
	output wire HSEL1;
	output wire HSEL2;
	parameter addr_start1='h1000_0000,addr_size1='h8000;
	parameter addr_end1=addr_start1+addr_size1-1;

	wire [31:0]add;
	assign add=HADDR;
	
	reg sel1,sel2;
	assign HSEL1=sel1;
	assign HSEL2=sel2;
	
	always@(*)
	begin
		if(add>=addr_start1&&add<=addr_end1)
			sel1<=1;
		else
			sel1<=0;
		if((add>=addr_start1&&add<=addr_end1))
			sel2<=0;
		else
			sel2<=1;
	end
	


endmodule 
