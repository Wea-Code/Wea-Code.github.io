module AHB_mdMUX_dataS4(
	HCLK,
	HRESETn,
	
	SEL0,
	SEL1,
	SEL2,
	SEL3,
	
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
	
	HADDRS0,
	HTRANSS0,
	HWRITES0,
	HSIZES0,
	HBURSTS0,
	HPROTS0,
	HMASTERS0,
	HWDATAS0,
	HMASTLOCKS0,
	HREADYINS0,
	
	HADDRS1,
	HTRANSS1,
	HWRITES1,
	HSIZES1,
	HBURSTS1,
	HPROTS1,
	HMASTERS1,
	HWDATAS1,
	HMASTLOCKS1,
	HREADYINS1,
	
	HADDRS2,
	HTRANSS2,
	HWRITES2,
	HSIZES2,
	HBURSTS2,
	HPROTS2,
	HMASTERS2,
	HWDATAS2,
	HMASTLOCKS2,
	HREADYINS2,
	
	HADDRS3,
	HTRANSS3,
	HWRITES3,
	HSIZES3,
	HBURSTS3,
	HPROTS3,
	HMASTERS3,
	HWDATAS3,
	HMASTLOCKS3,
	HREADYINS3);

	input         HCLK;           
    input         HRESETn;  
	
	input  SEL0;
	input  SEL1;
	input  SEL2;
	input  SEL3;
	
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
	
	//output reg         HSELS0,
	output reg [31:0]  HADDRS0;
	output reg  [1:0]  HTRANSS0;
	output reg         HWRITES0;
	output reg  [2:0]  HSIZES0;
	output reg  [2:0]  HBURSTS0;
	output reg  [3:0]  HPROTS0;
	output reg  [3:0]  HMASTERS0;
	output reg [31:0]  HWDATAS0;
	output reg         HMASTLOCKS0;
	output reg         HREADYINS0;
	       
	//output reg         HSELS1,
	output reg [31:0]  HADDRS1;
	output reg  [1:0]  HTRANSS1;
	output reg         HWRITES1;
	output reg  [2:0]  HSIZES1;
	output reg  [2:0]  HBURSTS1;
	output reg  [3:0]  HPROTS1;
	output reg  [3:0]  HMASTERS1;
	output reg [31:0]  HWDATAS1;
	output reg         HMASTLOCKS1;
	output reg         HREADYINS1;
	       
	//output reg         HSELS2,
	output reg [31:0]  HADDRS2;
	output reg  [1:0]  HTRANSS2;
	output reg         HWRITES2;
	output reg  [2:0]  HSIZES2;
	output reg  [2:0]  HBURSTS2;
	output reg  [3:0]  HPROTS2;
	output reg  [3:0]  HMASTERS2;
	output reg [31:0]  HWDATAS2;
	output reg         HMASTLOCKS2;
	output reg         HREADYINS2;
	       
	//output reg         HSELS3,
	output reg [31:0]  HADDRS3;
	output reg  [1:0]  HTRANSS3;
	output reg         HWRITES3;
	output reg  [2:0]  HSIZES3;
	output reg  [2:0]  HBURSTS3;
	output reg  [3:0]  HPROTS3;
	output reg  [3:0]  HMASTERS3;
	output reg [31:0]  HWDATAS3;
	output reg         HMASTLOCKS3;
	output reg         HREADYINS3;
	
	wire [3:0]sel={SEL0,SEL1,SEL2,SEL3};
	always@(*)
	begin
		if(!HRESETn)
		begin
		//HSELS0<=0      ,HSELS1<=0      ,HSELS2<=0      ,HSELS3<=0;
		HADDRS0<=0     ;HADDRS1<=0     ;HADDRS2<=0     ;HADDRS3<=0;
		HTRANSS0<=0    ;HTRANSS1<=0    ;HTRANSS2<=0    ;HTRANSS3<=0;
		HWRITES0<=0    ;HWRITES1<=0    ;HWRITES2<=0    ;HWRITES3<=0;
		HSIZES0<=0     ;HSIZES1<=0     ;HSIZES2<=0     ;HSIZES3<=0;
		HBURSTS0<=0    ;HBURSTS1<=0    ;HBURSTS2<=0    ;HBURSTS3<=0;
		HPROTS0<=0     ;HPROTS1<=0     ;HPROTS2<=0     ;HPROTS3<=0;
		HMASTERS0<=0   ;HMASTERS1<=0   ;HMASTERS2<=0   ;HMASTERS3<=0;
		HWDATAS0<=0    ;HWDATAS1<=0    ;HWDATAS2<=0    ;HWDATAS3<=0;
		HMASTLOCKS0<=0 ;HMASTLOCKS1<=0 ;HMASTLOCKS2<=0 ;HMASTLOCKS3<=0;
		HREADYINS0<=0  ;HREADYINS1<=0  ;HREADYINS2<=0  ;HREADYINS3<=0;
		end
		else
		case(sel)
		4'b1000:begin
		//HSELS0<=           SEL0;
		HADDRS0<=        HADDRm;
		HTRANSS0<=      HTRANSm;
		HWRITES0<=      HWRITEm;
		HSIZES0<=        HSIZEm;
		HBURSTS0<=      HBURSTm;
		HPROTS0<=        HPROTm;
		HMASTERS0<=    HMASTERm;
		HWDATAS0<=      HWDATAm;
		HMASTLOCKS0<=HMASTLOCKm;
		HREADYINS0<=  HREADYINm;
		end
		4'b0100:begin
		//HSELS1<=           SEL1; 
		HADDRS1<=        HADDRm; 
		HTRANSS1<=      HTRANSm; 
		HWRITES1<=      HWRITEm; 
		HSIZES1<=        HSIZEm; 
		HBURSTS1<=      HBURSTm; 
		HPROTS1<=        HPROTm; 
		HMASTERS1<=    HMASTERm; 
		HWDATAS1<=      HWDATAm; 
		HMASTLOCKS1<=HMASTLOCKm;
		HREADYINS1<=  HREADYINm; 
		end
		4'b0010:begin
		//HSELS2<=           SEL2; 
		HADDRS2<=        HADDRm; 
		HTRANSS2<=      HTRANSm; 
		HWRITES2<=      HWRITEm; 
		HSIZES2<=        HSIZEm; 
		HBURSTS2<=      HBURSTm; 
		HPROTS2<=        HPROTm; 
		HMASTERS2<=    HMASTERm; 
		HWDATAS2<=      HWDATAm; 
		HMASTLOCKS2<=HMASTLOCKm;
		HREADYINS2<=  HREADYINm; 
		end
		4'b0001:begin
		//HSELS3<=           SEL3;
		HADDRS3<=        HADDRm;
		HTRANSS3<=      HTRANSm;
		HWRITES3<=      HWRITEm;
		HSIZES3<=        HSIZEm;
		HBURSTS3<=      HBURSTm;
		HPROTS3<=        HPROTm;
		HMASTERS3<=    HMASTERm;
		HWDATAS3<=      HWDATAm;
		HMASTLOCKS3<=HMASTLOCKm;
		HREADYINS3<=  HREADYINm;
		end
		default:begin
		//HSELS0<=0      ,HSELS1<=0      ,HSELS2<=0      ,HSELS3<=0;
		HADDRS0<=0     ;HADDRS1<=0     ;HADDRS2<=0     ;HADDRS3<=0;
		HTRANSS0<=0    ;HTRANSS1<=0    ;HTRANSS2<=0    ;HTRANSS3<=0;
		HWRITES0<=0    ;HWRITES1<=0    ;HWRITES2<=0    ;HWRITES3<=0;
		HSIZES0<=0     ;HSIZES1<=0     ;HSIZES2<=0     ;HSIZES3<=0;
		HBURSTS0<=0    ;HBURSTS1<=0    ;HBURSTS2<=0    ;HBURSTS3<=0;
		HPROTS0<=0     ;HPROTS1<=0     ;HPROTS2<=0     ;HPROTS3<=0;
		HMASTERS0<=0   ;HMASTERS1<=0   ;HMASTERS2<=0   ;HMASTERS3<=0;
		HWDATAS0<=0    ;HWDATAS1<=0    ;HWDATAS2<=0    ;HWDATAS3<=0;
		HMASTLOCKS0<=0 ;HMASTLOCKS1<=0 ;HMASTLOCKS2<=0 ;HMASTLOCKS3<=0;
		HREADYINS0<=0  ;HREADYINS1<=0  ;HREADYINS2<=0  ;HREADYINS3<=0;
		end
		endcase
	end
	
endmodule
