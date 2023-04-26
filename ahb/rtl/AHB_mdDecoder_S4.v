module AHB_mdDecoder_S4(
	HADDR,
	HSEL0,
	HSEL1,
	HSEL2,
	HSEL3,
	HSEL4);
	//input         HCLK,            
    //input         HRESETn,  
	
	input wire [31:0]HADDR;
	output wire HSEL0;
	output wire HSEL1;
	output wire HSEL2;
	output wire HSEL3;
	output wire HSEL4;
	//关于ZSP从机地址有点不明确，ZSP——SLAVE的指令地址需不需要通过总线
	parameter addr_start01='h0010_0000,addr_size01='h40000;
	parameter addr_start00='h0000_0000,addr_size00='h80000;
	parameter addr_start1='h1000_0000,addr_size1='h8000;
	parameter addr_start2='h2000_0000,addr_size2='h4000;
	parameter addr_start3='h4000_0000,addr_size3='h2000;
	parameter slave_num=4; //此处并未使用，AHB_lite中使用目的调用时可以通过参数判断方便
	
	parameter addr_end01=addr_start01+addr_size01- 1;
	parameter addr_end00=addr_start00+addr_size00- 1;
	parameter addr_end1=addr_start1+addr_size1- 1;
	parameter addr_end2=addr_start2+addr_size2- 1;
	parameter addr_end3=addr_start3+addr_size3- 1;
	
	wire  [31:0]add;
	assign add=HADDR;
	
	reg sel0,sel1,sel2,sel3,sel4;
	assign HSEL0=sel0;
	assign HSEL1=sel1;
	assign HSEL2=sel2;
	assign HSEL3=sel3;
	assign HSEL4=sel4;
	//设计成多if else目的是为了取消优先级，采用case或者嵌套if else 会使选择自带优先级
	always@(*)
	begin
		if((add>=addr_start00&&add<=addr_end00)||(add>=addr_start01&&add<=addr_end01))
			sel0<=1;
		else
			sel0<=0;
		if(add>=addr_start1&&add<=addr_end1)
			sel1<=1;
		else
			sel1<=0;
		if(add>=addr_start2&&add<=addr_end2)
			sel2<=1;
		else
			sel2<=0;
		if(add>=addr_start3&&add<=addr_end3)
			sel3<=1;
		else
			sel3<=0;
		if(((add>=addr_start00&&add<=addr_end00)||(add>=addr_start01&&add<=addr_end01))||
			(add>=addr_start1&&add<=addr_end1)||
			(add>=addr_start2&&add<=addr_end2)||
			(add>=addr_start3&&add<=addr_end3))
			sel4<=0;
		else
			sel4<=1;
	end
endmodule
