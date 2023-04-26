module AHB_MArbiter_mi_md (
	HCLK,
	HRESETn,
	HSELM0,
	HMASTER0,
	HSELM1,
	HMASTER1,
	HMSEL);
input HCLK;
input HRESETn;

input HSELM0;
input [3:0]HMASTER0;
input HSELM1;
input [3:0]HMASTER1;

output reg [1:0]HMSEL; //01代表是MSSD访问总线，10代表是MSSI访问总线

wire [1:0]HSEL;
assign HSEL={HSELM0,HSELM1};
//wire [1:0]HMASTER;
//assign HMASTER={HMASTER0,HMASTER1};

always@(posedge HCLK or negedge HRESETn)
begin
	if(!HRESETn)
		HMSEL<=2'b10;
	else
		begin
			case(HSEL)
			2'b11:
			begin
				if(HMASTER0==4'd1)
					begin
					HMSEL<=2'b10;
					end
				else if(HMASTER0==4'd0)
					begin
					if(HMASTER1==4'd1)
						HMSEL<=2'b01;
					else if(HMASTER1==4'd0)
						HMSEL<=2'b00;
					end
			end
			2'b01:HMSEL<=2'b01;
			2'b10:HMSEL<=2'b10;
			2'b00:HMSEL<=2'b00;
			endcase
		end
end
			
endmodule
