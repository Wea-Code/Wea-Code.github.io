module AHB_MArbiter_MUX(
	HCLK,
	HRESETn,
	HMSEL,
	
	HADDR0,
	HTRANS0,
	HWRITE0,
	HSIZE0,
	HBURST0,
	HPROT0,
	HMASTER0,
	HWDATA0,
	HMASTLOCK0,
	HREADYIN0,
	
	HADDR1,
	HTRANS1,
	HWRITE1,
	HSIZE1,
	HBURST1,
	HPROT1,
	HMASTER1,
	HWDATA1,
	HMASTLOCK1,
	HREADYIN1,
	
	HADDRm,
	HTRANSm,
	HWRITEm,
	HSIZEm,
	HBURSTm,
	HPROTm,
	HMASTERm,
	HWDATAm,
	HMASTLOCKm,
	HREADYINm
	);
	input HCLK;
	input HRESETn;
	input [1:0]HMSEL;
	
	input  [31:0] HADDR0;
	input   [1:0] HTRANS0;
	input         HWRITE0;
	input   [2:0] HSIZE0;
	input   [2:0] HBURST0;
	input   [3:0] HPROT0;
	input   [3:0] HMASTER0;
	input  [31:0] HWDATA0;
	input         HMASTLOCK0;
	input         HREADYIN0;

	input  [31:0] HADDR1;
	input   [1:0] HTRANS1;
	input         HWRITE1;
	input   [2:0] HSIZE1;
	input   [2:0] HBURST1;
	input   [3:0] HPROT1;
	input   [3:0] HMASTER1;
	input  [31:0] HWDATA1;
	input         HMASTLOCK1;
	input         HREADYIN1;
	
	output reg [31:0] HADDRm;
	output reg [1:0]  HTRANSm;
	output reg       HWRITEm;
	output reg [2:0]  HSIZEm;
	output reg [2:0]  HBURSTm;
	output reg [3:0]  HPROTm;
	output reg [3:0]  HMASTERm;
	output reg [31:0] HWDATAm;
	output reg       HMASTLOCKm;
	output reg       HREADYINm;
	
	reg hmsel_delay; //为了让路游数据挡一排，流水线设计
	always@(posedge HCLK or negedge HRESETn)
	begin
		if(!HRESETn)
			hmsel_delay<=0;
		else
			hmsel_delay<=HMSEL;
	end
	always@(HMSEL or HADDR0 or HADDR1)
	begin
		case(HMSEL)
		2'b10: HADDRm = HADDR0;
		2'b01: HADDRm = HADDR1;
		endcase
	end
	always@(HMSEL or HTRANS0 or HTRANS1)
	begin
		case(HMSEL)
		2'b10: HTRANSm = HTRANS0;
		2'b01: HTRANSm = HTRANS1;
		endcase
	end
	always@(HMSEL or HWRITE0 or HWRITE1)
	begin
		case(HMSEL)
		2'b10: HWRITEm = HWRITE0;
		2'b01: HWRITEm = HWRITE1;
		endcase
	end
	always@(HMSEL or HSIZE0 or HSIZE1)
	begin
		case(HMSEL)
		2'b10: HSIZEm = HSIZE0;
		2'b01: HSIZEm = HSIZE1;
		endcase
	end
	always@(HMSEL or HBURST0 or HBURST1)
	begin
		case(HMSEL)
		2'b10: HBURSTm = HBURST0;
		2'b01: HBURSTm = HBURST1;
		endcase
	end
	always@(HMSEL or HPROT0 or HPROT1)
	begin
		case(HMSEL)
		2'b10: HPROTm = HPROT0;
		2'b01: HPROTm = HPROT1;
		endcase
	end
	always@(HMSEL or HMASTER0 or HMASTER1)
	begin
		case(HMSEL)
		2'b10: HMASTERm = HMASTER0;
		2'b01: HMASTERm = HMASTER1;
		endcase
	end
	always@(HMSEL or HWDATA0 or HWDATA1)
	begin
		case(HMSEL)
		2'b10: HWDATAm = HWDATA0;
		2'b01: HWDATAm = HWDATA1;
		endcase
	end
	always@(HMSEL or HMASTLOCK0 or HMASTLOCK1)
	begin
		case(HMSEL)
		2'b10: HMASTLOCKm = HMASTLOCK0;
		2'b01: HMASTLOCKm = HMASTLOCK1;
		endcase
	end
	always@(HMSEL or HREADYIN0 or HREADYIN1)
	begin
		case(HMSEL)
		2'b10: HREADYINm = HREADYIN0;
		2'b01: HREADYINm = HREADYIN1;
		endcase
	end
	

	


endmodule
