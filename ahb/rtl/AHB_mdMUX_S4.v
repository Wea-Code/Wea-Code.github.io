module AHB_mdMUX_S4(
	HCLK,
	HRESETn,
	HRDATAm,
	HREADYm,
	HRESPm,
	HSEL0,HRDATA0,HREADY0,HRESP0,
	HSEL1,HRDATA1,HREADY1,HRESP1,
	HSEL2,HRDATA2,HREADY2,HRESP2,
	HSEL3,HRDATA3,HREADY3,HRESP3,
    HSEL4,HRDATA4,HREADY4,HRESP4
	);
	input         HCLK;           
    input         HRESETn;     

	output reg [31:0]HRDATAm;
	output reg HREADYm;
	output reg [1:0]HRESPm;
	
	input wire HSEL0;
	input wire HRDATA0;
	input wire HREADY0;
	input wire HRESP0;
	   
	input wire HSEL1;
	input wire HRDATA1;
	input wire HREADY1;
	input wire HRESP1;
	      
	input wire HSEL2;
	input wire HRDATA2;
	input wire HREADY2;
	input wire HRESP2;
	    
	input wire HSEL3;
	input wire HRDATA3;
	input wire HREADY3;
	input wire HRESP3;
	    
	input wire HSEL4;
	input wire HRDATA4;
	input wire HREADY4;
	input wire HRESP4;
	
parameter D_HSEL0=5'b00001;
parameter D_HSEL1=5'b00010;
parameter D_HSEL2=5'b00100;
parameter D_HSEL3=5'b01000;
parameter D_HSEL4=5'b10000;
reg [4:0]sel_tmp;
wire [4:0]sel;
assign sel={HSEL4,HSEL3,HSEL2,HSEL1,HSEL0};
always@(posedge HCLK or negedge HRESETn)
begin
	if(!HRESETn)
		sel_tmp<=5'd0;
	else if(HREADYm)
		sel_tmp<=sel;
end

always@(sel_tmp or HREADY0 or HREADY1 or HREADY2 or HREADY3 or HREADY4)
begin
	case(sel_tmp)
	D_HSEL0:HREADYm<=HREADY0;
	D_HSEL1:HREADYm<=HREADY1;
	D_HSEL2:HREADYm<=HREADY2;
	D_HSEL3:HREADYm<=HREADY3;
	D_HSEL4:HREADYm<=HREADY4;
	default:HREADYm<=1'b1;
	endcase
end
always@(sel_tmp or HRDATA0 or HRDATA1 or HRDATA2 or HRDATA3 or HRDATA4)
begin
	case(sel_tmp)
	D_HSEL0:HRDATAm<=HRDATA0;
	D_HSEL1:HRDATAm<=HRDATA1;
	D_HSEL2:HRDATAm<=HRDATA2;
	D_HSEL3:HRDATAm<=HRDATA3;
	D_HSEL4:HRDATAm<=HRDATA4;
	default:HRDATAm<=32'd0;
	endcase
end
always@(sel_tmp or HRESP0 or HRESP1 or HRESP2 or HRESP3 or HRESP4)
begin
	case(sel_tmp)
	D_HSEL0:HRESPm<=HRESP0;
	D_HSEL1:HRESPm<=HRESP1;
	D_HSEL2:HRESPm<=HRESP2;
	D_HSEL3:HRESPm<=HRESP3;
	D_HSEL4:HRESPm<=HRESP4;
	default:HRESPm<=2'b01;
	endcase
end


endmodule
