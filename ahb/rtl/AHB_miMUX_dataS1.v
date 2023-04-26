module AHB_miMUX_dataS1(
	HCLK,
	HRESETn,
	
	SEL1,
	
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
	
	HADDRS1,
	HTRANSS1,
	HWRITES1,
	HSIZES1,
	HBURSTS1,
	HPROTS1,
	HMASTERS1,
	HWDATAS1,
	HMASTLOCKS1,
	HREADYS1);
	
	input HCLK;
	input HRESETn;
	
	input SEL1;
	
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
	
	output reg [31:0]  HADDRS1;
	output reg  [1:0]  HTRANSS1;
	output reg         HWRITES1;
	output reg  [2:0]  HSIZES1;
	output reg  [2:0]  HBURSTS1;
	output reg  [3:0]  HPROTS1;
	output reg  [3:0]  HMASTERS1;
	output reg [31:0]  HWDATAS1;
	output reg         HMASTLOCKS1;
	output reg         HREADYS1;
	
always@(*)
begin
	if(!HRESETn)
	begin
	HADDRS1<=0;
	HTRANSS1<=0;
	HWRITES1<=0;
	HSIZES1<=0;
	HBURSTS1<=0;
	HPROTS1<=0;
	HMASTERS1<=0;
	HWDATAS1<=0;
	HMASTLOCKS1<=0;
	HREADYS1<=0;
	end
	else if(SEL1)
	begin
	HADDRS1<=        HADDRm;
	HTRANSS1<=      HTRANSm;
	HWRITES1<=      HWRITEm;
	HSIZES1<=        HSIZEm;
	HBURSTS1<=      HBURSTm;
	HPROTS1<=        HPROTm;
	HMASTERS1<=    HMASTERm;
	HWDATAS1<=      HWDATAm;
    HMASTLOCKS1<=HMASTLOCKm;
    HREADYS1<=    HREADYINm;
	end
end

endmodule
