module AHB_miMUX_S1(
	HCLK,
	HRESETn,
	HRDATAm,
	HREADYm,
	HRESPm,
	HSEL1,
	HRDATA1,
	HREADY1,
	HRESP1,
	HSEL2,
	HRDATA2,
	HREADY2,
	HRESP2);
	input         HCLK;           
    input         HRESETn;     

	output reg [31:0]HRDATAm;
	output reg HREADYm;
	output reg [1:0]HRESPm;
	   
	input wire HSEL1;
	input wire [31:0]HRDATA1;
	input wire HREADY1;
	input wire [1:0]HRESP1;
	      
	input wire HSEL2;
	input wire [31:0]HRDATA2;
	input wire HREADY2;
	input wire [1:0]HRESP2;
	
	parameter D_HSEL1=2'b01;
	parameter D_HSEL2=2'b10;
	
	reg [1:0]sel_tmp;
	wire [1:0]sel;
	assign sel={HSEL2,HSEL1};
	always@(posedge HCLK or negedge HRESETn)
	begin
		if(!HRESETn)
			sel_tmp<=2'd0;
		else if(HREADYm)
			sel_tmp<=sel;
	end
	
	always@(sel_tmp or HREADY1 or HREADY2 )
	begin
		case(sel_tmp)
		
		D_HSEL1:HREADYm<=HREADY1;
		D_HSEL2:HREADYm<=HREADY2;
		
		default:HREADYm<=1;
		endcase
	end
	always@(sel_tmp or  HRDATA1 or HRDATA2 )
	begin
		case(sel_tmp)
		
		D_HSEL1:HRDATAm<=HRDATA1;
		D_HSEL2:HRDATAm<=HRDATA2;
		
		default:HRDATAm<=32'd0;
		endcase
	end
	always@(sel_tmp  or HRESP1 or HRESP2  )
	begin
		case(sel_tmp)
		
		D_HSEL1:HRESPm<=HRESP1;
		D_HSEL2:HRESPm<=HRESP2;
					
		default:HRESPm<=2'b01;
		endcase
	end


endmodule