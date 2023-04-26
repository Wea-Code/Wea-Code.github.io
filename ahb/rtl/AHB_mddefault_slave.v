module AHB_mddefault_slave(
	HCLK,
	HSEL4,
	HRESETn,
	HADDRm,
	HTRANSm,
	HWRITEm,
	HSIZEm,
	HBURSTm,
	HPROTm,
	HMASTERm,
	HWDATAm,
	HMASTLOCKm,
	HREADYINm,
	
	HRDATA,
	HRESP,
	HREADYOUT);
	input         HCLK;           
    input         HRESETn;  
	
	//input          HSELm,
	input  [31:0]  HADDRm;
	input   [1:0]  HTRANSm;
	input          HWRITEm;
	input   [2:0]  HSIZEm;
	input   [2:0]  HBURSTm;
	input   [3:0]  HPROTm;
	input   [3:0]  HMASTERm;
	input  [31:0]  HWDATAm;
	input          HMASTLOCKm;
	input          HREADYINm;
	
	input HSEL4;
	output [31:0] HRDATA;
	output reg [1:0] HRESP;
	output reg HREADYOUT;
	
parameter IDLE=2'b00,WRITE=2'b01,READ=2'b10;
reg [1:0]state,next_state;
always@(posedge HCLK or negedge HRESETn)
begin
	if(!HRESETn)
	state<=IDLE;
	else
	state<=next_state;
end
assign HRDATA=31'd0;

always@(posedge HCLK or negedge HRESETn)
begin
	if(!HRESETn)
	begin
	HRESP<=2'b00;
	HREADYOUT<=1'b1;
	end
	else
	begin
		case(state)
		IDLE:begin
			if(HSEL4&&HREADYINm)
			begin
				case(HTRANSm)
				2'b00,2'b01:begin
					HRESP<=2'b00;
					HREADYOUT<=1'b1;
					next_state<=IDLE;
					end
				2'b10,2'b11:begin
					HRESP<=2'b01;
					HREADYOUT<=1'b0;
					if(HWRITEm)
						next_state<=WRITE;
					else
						next_state<=READ;
					end
				endcase
			end
			else
			begin
				HRESP<=2'b00;
				HREADYOUT<=1'b1;
			end
		end
		WRITE:begin
			HREADYOUT<=1'b1;
			HRESP<=2'b01;
			next_state<=IDLE;
			end
		READ:begin
			HREADYOUT<=1'b1;
			HRESP<=2'b01;
			next_state<=IDLE;
			end
		default:begin
			HREADYOUT<=1'b1;
			HRESP<=2'b01;
			end
		endcase
	end
end


endmodule
