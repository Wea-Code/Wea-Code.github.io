module APB_Decoder(
	pclk,
	hresetn,
	
	hwrite,
	hreadyin,
	htrans,
	hsel,
	haddr,
	hwdata,
	//hburst,
	
	hresp,
	prdata,
	
	valid,
	haddr1,
	haddr2,
	hwdata1,
	hwdata2,
	hwritereg,
	
	psel_reg,
	prdata_s6,
	prdata_s5,
	prdata_s4,
	prdata_s3,
	prdata_s2,
	prdata_s1,
	prdata_s0
	);
	parameter addr_start0='h4000_0400,addr_size0='h400;
	parameter addr_start1='h4000_0800,addr_size1='h400;
	parameter addr_start2='h4000_0c00,addr_size2='h400;
	parameter addr_start3='h4000_1000,addr_size3='h400;
	parameter addr_start4='h4000_1400,addr_size4='h400;
	parameter addr_start5='h4000_1800,addr_size5='h400;
	parameter addr_start6='h4000_1c00,addr_size6='h400;
	
	parameter addr_end0=addr_start0+addr_size0 - 1'b1 ;
	parameter addr_end1=addr_start1+addr_size1 - 1'b1 ;
	parameter addr_end2=addr_start2+addr_size2 - 1'b1 ;
	parameter addr_end3=addr_start3+addr_size3 - 1'b1 ;
	parameter addr_end4=addr_start4+addr_size4 - 1'b1 ;
	parameter addr_end5=addr_start5+addr_size5 - 1'b1 ;
	parameter addr_end6=addr_start6+addr_size6 - 1'b1 ;

	input pclk;
	input hresetn;
	inout hwrite;
	input hreadyin;
	input [1:0]htrans;
	//input [2:0]hburst;
	input hsel;
	input[31:0]haddr;
	input[31:0]hwdata;
	
	output [1:0]hresp;
	output reg[31:0]prdata;
	output [6:0]psel_reg;
	
	input [31:0] prdata_s6; 
	input [31:0] prdata_s5; 
	input [31:0] prdata_s4; 
	input [31:0] prdata_s3; 
	input [31:0] prdata_s2; 
	input [31:0] prdata_s1; 
	input [31:0] prdata_s0; 
	output reg valid;
	output reg [31:0]haddr1,haddr2,hwdata1,hwdata2;
	output reg hwritereg;
	
	//地址译码输出选择信号，但选择信号需要在状态机中同步给从机
	reg [6:0]psel_reg;
	wire [31:0]addr;
	assign addr=haddr;
	always@(hsel or haddr or hresetn)
	begin
		if(hsel&& hresetn&& addr>=addr_start0&&addr<=addr_end0)
			psel_reg<=7'b0000001;
		else if(hsel&&hresetn&& addr>=addr_start1&&addr<=addr_end1)
			psel_reg<=7'b0000010;
		else if(hsel&&hresetn&& addr>=addr_start2&&addr<=addr_end2)
			psel_reg<=7'b0000100;
		else if(hsel&&hresetn&& addr>=addr_start3&&addr<=addr_end3)
			psel_reg<=7'b0001000;
		else if(hsel&&hresetn&& addr>=addr_start4&&addr<=addr_end4)
			psel_reg<=7'b0010000;
		else if(hsel&&hresetn&& addr>=addr_start5&&addr<=addr_end5)
			psel_reg<=7'b0100000;
		else if(hsel&&hresetn&& addr>=addr_start6&&addr<=addr_end6)
			psel_reg<=7'b1000000;
		else
			psel_reg<=7'b0000000;
	end
	
	
	//输出到状态机的prdata，
	
	always@(psel_reg or prdata_s0 or prdata_s1 or prdata_s2 or prdata_s3 or prdata_s4 
	or prdata_s5 or prdata_s6)
	begin
		case(psel_reg)
			7'b0000001:prdata<=prdata_s0;
			7'b0000010:prdata<=prdata_s1;
			7'b0000100:prdata<=prdata_s2;
			7'b0001000:prdata<=prdata_s3;
			7'b0010000:prdata<=prdata_s4;
			7'b0100000:prdata<=prdata_s5;
			7'b1000000:prdata<=prdata_s6;
			default:prdata<=32'b0;
		endcase
	end
	//流水线控制信号
	always @(posedge pclk or negedge hresetn)
		begin
			if (~hresetn)
				begin
					haddr1<=0;
					haddr2<=0;
				end
			else
				begin
					haddr1<=haddr;
					haddr2<=haddr1;
				end
		end
	always @(posedge pclk or negedge hresetn)
		begin
			if (~hresetn)
				begin
					hwdata1<=0;
					hwdata2<=0;
				end
			else
				begin
					hwdata1<=hwdata;
					hwdata2<=hwdata1;
				end
		end
	always @(posedge pclk or negedge hresetn)
		begin	
			if (~hresetn)
				hwritereg<=0;
			else
				hwritereg<=hwrite;
		end
	//产生状态机使能信号
	always @(hreadyin,haddr,htrans,hresetn)
		begin
			valid=0;
			if (hresetn && hreadyin && (haddr>=32'h4000_0400 && haddr<32'h4000_2000) && (htrans==2'b10 || htrans==2'b11) )
				valid=1;

		end	
	
	//hresp控制信号，让其持续返回okey
	assign hresp=2'b00;
	
	
endmodule
