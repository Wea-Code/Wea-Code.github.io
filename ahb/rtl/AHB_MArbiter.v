module AHB_MArbiter(
	// Common AHB signals    
    HCLK,
    HRESETn,
    // Input Port 0 for ZSPNano Master 0
    HSELS0,
    HADDRS0,
    HTRANSS0,
    HWRITES0,
    HSIZES0,
    HBURSTS0,
    HPROTS0,
    HMASTERS0,
    HWDATAS0,
    HMASTLOCKS0,
    HREADYS0,
    // Input Port 1 for ZSPNano Master 1
    HSELS1,
    HADDRS1,
    HTRANSS1,
    HWRITES1,
    HSIZES1,
    HBURSTS1,
    HPROTS1,
    HMASTERS1,
    HWDATAS1,
    HMASTLOCKS1,
    HREADYS1,
	//output to AHB_si and AHB_sd
	hmsel,
	
	HADDRM,
	HTRANSM,
	HWRITEM,
	HSIZEM,
	HBURSTM,
	HPROTM,
	HMASTERM,
	HWDATAM,
	HMASTLOCKM,
	HREADYINM
	);
	input         HCLK;            // AHB System Clock
    input         HRESETn;         // AHB System Reset

    // Input Port 0
    input         HSELS0;          // Slave Select
    input  [31:0] HADDRS0;         // Address bus
    input   [1:0] HTRANSS0;        // Transfer type
    input         HWRITES0;        // Transfer direction
    input   [2:0] HSIZES0;         // Transfer size
    input   [2:0] HBURSTS0;        // Burst type
    input   [3:0] HPROTS0;         // Protection control
    input   [3:0] HMASTERS0;       // Master select    
    input  [31:0] HWDATAS0;        // Write data
    input         HMASTLOCKS0;     // Locked Sequence
    input         HREADYS0;        // Transfer done
    
    // Input Port 1
    input         HSELS1;          // Slave Select
    input  [31:0] HADDRS1;         // Address bus
    input   [1:0] HTRANSS1;        // Transfer type
    input         HWRITES1;        // Transfer direction
    input   [2:0] HSIZES1;         // Transfer size
    input   [2:0] HBURSTS1;        // Burst type
    input   [3:0] HPROTS1;         // Protection control
    input   [3:0] HMASTERS1;       // Master select    
    input  [31:0] HWDATAS1;        // Write data
    input         HMASTLOCKS1;     // Locked Sequence
    input         HREADYS1;        // Transfer done
    output wire [1:0]hmsel;
	  
	output wire [31:0] HADDRM;     // Address bus to rest module 
	output wire [1:0] HTRANSM;    // Transfer type ..
	output wire       HWRITEM;    // Transfer direction ..
	output wire [2:0] HSIZEM;     // Transfer size ..
	output wire [2:0] HBURSTM;    // Burst type ..
	output wire [3:0] HPROTM;     // Protection control ..
	output wire [3:0] HMASTERM;   // Master select     ..
	output wire [31:0] HWDATAM;    // Write data ..
	output wire       HMASTLOCKM; // Locked Sequence .. 
	output wire       HREADYINM;  // Transfer done   ..
	
	AHB_MArbiter_mi_md  MA1(
	.HCLK(HCLK),
	.HRESETn(HRESETn),
	.HSELM0(HSELS0),
	.HMASTER0(HMASTERS0),
	.HSELM1(HSELS1),
	.HMASTER1(HMASTERS1),
	.HMSEL(hmsel)
	);
	AHB_MArbiter_MUX MA2(
	.HCLK(HCLK),
	.HRESETn(HRESETn),
	.HMSEL(hmsel),
	
	.HADDR0(HADDRS0),
	.HTRANS0(HTRANSS0),
	.HWRITE0(HWRITES0),
	.HSIZE0(HSELS0),
	.HBURST0(HBURSTS0),
	.HPROT0(HPROTS0),
	.HMASTER0(HMASTERS0),
	.HWDATA0(HWDATAS0),
	.HMASTLOCK0(HMASTLOCKS0),
	.HREADYIN0(HREADYS0),
	
	.HADDR1(HADDRS1),
	.HTRANS1(HTRANSS1),
	.HWRITE1(HWRITES1),
	.HSIZE1(HSIZES1),
	.HBURST1(HBURSTS1),
	.HPROT1(HPROTS1),
	.HMASTER1(HMASTERS1),
	.HWDATA1(HWDATAS1),
	.HMASTLOCK1(HMASTLOCKS1),
	.HREADYIN1(HREADYS1),
	
	.HADDRm(HADDRM),
	.HTRANSm(HTRANSM),
	.HWRITEm(HWRITEM),
	.HSIZEm(HSIZEM),
	.HBURSTm(HBURSTM),
	.HPROTm(HPROTM),
	.HMASTERm(HMASTERM),
	.HWDATAm(HWDATAM),
	.HMASTLOCKm(HMASTLOCKM),
	.HREADYINm(HREADYINM)
	
	);



endmodule
