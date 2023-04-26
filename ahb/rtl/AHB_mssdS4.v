module AHB_mssdS4(
	HCLK,           
	HRESETn, 
	hmsel,
	//HSELM1,         
	HADDR,        
	HTRANS,       
	HWRITE,       
	HSIZE,        
	HBURST,       
	HPROT,        
	HMASTER,      
	HWDATA,       
	HMASTLOCK,    
	HREADYIN,
	
	HRDATA_md_M1,   
	HREADYOUT_md_M1,
	HRESP_md_M1,
	
	HSEL_md_S0,     
	HRDATA_S0_md,   
	HREADYOUT_S0_md,
	HRESP_S0_md,    
	
	HSEL_md_S1,     
	HRDATA_S1_md,   
	HREADYOUT_S1_md,
	HRESP_S1_md,    
	
	HSEL_md_S2,     
	HRDATA_S2_md,   
	HREADYOUT_S2_md,
	HRESP_S2_md,    
	
	HSEL_md_S3,     
	HRDATA_S3_md,   
	HREADYOUT_S3_md,
	HRESP_S3_md,    

	HADDR_md_s0,    
	HTRANS_md_s0,   
	HWRITE_md_s0,   
	HSIZE_md_s0,    
	HBURST_md_s0,   
	HPROT_md_s0,    
	HMASTER_md_s0,  
	HWDATA_md_s0,   
	HMASTLOCK_md_s0,
	HREADYIN_md_s0,
	
	HADDR_md_s1,    
	HTRANS_md_s1,   
	HWRITE_md_s1,   
	HSIZE_md_s1,    
	HBURST_md_s1,   
	HPROT_md_s1,    
	HMASTER_md_s1,  
	HWDATA_md_s1,   
	HMASTLOCK_md_s1,
	HREADYIN_md_s1,
	
	HADDR_md_s2,    
	HTRANS_md_s2,   
	HWRITE_md_s2,   
	HSIZE_md_s2,    
	HBURST_md_s2,   
	HPROT_md_s2,    
	HMASTER_md_s2,  
	HWDATA_md_s2,   
	HMASTLOCK_md_s2,
	HREADYIN_md_s2,
	
	HADDR_md_s3,    
	HTRANS_md_s3,   
	HWRITE_md_s3,   
	HSIZE_md_s3,    
	HBURST_md_s3,   
	HPROT_md_s3,    
	HMASTER_md_s3,  
	HWDATA_md_s3,   
	HMASTLOCK_md_s3,
	HREADYIN_md_s3
	);
	input         HCLK;            // AHB System Clock
    input         HRESETn;         // AHB System Reset
	input  [1:0]  hmsel;
	
	//input from master_mssd 
	//input         HSELM1,          // Slave Select
    input  [31:0] HADDR;         // Address bus
    input   [1:0] HTRANS;        // Transfer type
    input         HWRITE;        // Transfer direction
    input   [2:0] HSIZE;         // Transfer size
    input   [2:0] HBURST;        // Burst type
    input   [3:0] HPROT;         // Protection control
    input   [3:0] HMASTER;       // Master select    
    input  [31:0] HWDATA;        // Write data
    input         HMASTLOCK;     // Locked Sequence
    input         HREADYIN;        // Transfer done
	//output to master_mssd
    output [31:0] HRDATA_md_M1;        // Read data bus
    output        HREADYOUT_md_M1;     // HREADY feedback
    output  [1:0] HRESP_md_M1;
	//output to slave0-3
	//md_s1 and s1_md will go to MArbiter
	//s0 zspnano_slave S1 boot_rom S2 SRAM S3 AHB_APB
	output        HSEL_md_S0;          // Slave Select
    input  [31:0] HRDATA_S0_md;        // Read data bus
    input         HREADYOUT_S0_md;     // HREADY feedback
    input   [1:0] HRESP_S0_md;         // Transfer response

    output        HSEL_md_S1;          // Slave Select
    input  [31:0] HRDATA_S1_md;        // Read data bus
    input         HREADYOUT_S1_md;     // HREADY feedback
    input   [1:0] HRESP_S1_md;         // Transfer response

    output        HSEL_md_S2;          // Slave Select
    input  [31:0] HRDATA_S2_md;        // Read data bus
    input         HREADYOUT_S2_md;     // HREADY feedback
    input   [1:0] HRESP_S2_md;         // Transfer response

    output        HSEL_md_S3;          // Slave Select
    input  [31:0] HRDATA_S3_md;        // Read data bus
    input         HREADYOUT_S3_md;     // HREADY feedback
    input   [1:0] HRESP_S3_md;         // Transfer response
	//data from master to slave0-3
	output [31:0] HADDR_md_s0;         // Address bus
    output  [1:0] HTRANS_md_s0;        // Transfer type
    output        HWRITE_md_s0;        // Transfer direction
    output  [2:0] HSIZE_md_s0;         // Transfer size
    output  [2:0] HBURST_md_s0;        // Burst type
    output  [3:0] HPROT_md_s0;         // Protection control
    output  [3:0] HMASTER_md_s0;       // Master select
    output [31:0] HWDATA_md_s0;        // Write data
    output        HMASTLOCK_md_s0;     // Locked Sequence
    output        HREADYIN_md_s0;     // Transfer done
	
	output [31:0] HADDR_md_s1;         // Address bus
    output  [1:0] HTRANS_md_s1;        // Transfer type
    output        HWRITE_md_s1;        // Transfer direction
    output  [2:0] HSIZE_md_s1;        // Transfer size
    output  [2:0] HBURST_md_s1;        // Burst type
    output  [3:0] HPROT_md_s1;         // Protection control
    output  [3:0] HMASTER_md_s1;       // Master select
    output [31:0] HWDATA_md_s1;        // Write data
    output        HMASTLOCK_md_s1;     // Locked Sequence
    output        HREADYIN_md_s1;     // Transfer done
	
	output [31:0] HADDR_md_s2;         // Address bus
    output  [1:0] HTRANS_md_s2;        // Transfer type
    output        HWRITE_md_s2;        // Transfer direction
    output  [2:0] HSIZE_md_s2;         // Transfer size
    output  [2:0] HBURST_md_s2;        // Burst type
    output  [3:0] HPROT_md_s2;         // Protection control
    output  [3:0] HMASTER_md_s2;       // Master select
    output [31:0] HWDATA_md_s2;        // Write data
    output        HMASTLOCK_md_s2;     // Locked Sequence
    output        HREADYIN_md_s2;     // Transfer done
	
	output [31:0] HADDR_md_s3;         // Address bus
    output  [1:0] HTRANS_md_s3;        // Transfer type
    output        HWRITE_md_s3;        // Transfer direction
    output  [2:0] HSIZE_md_s3;         // Transfer size
    output  [2:0] HBURST_md_s3;        // Burst type
    output  [3:0] HPROT_md_s3;         // Protection control
    output  [3:0] HMASTER_md_s3;       // Master select
    output [31:0] HWDATA_md_s3;        // Write data
    output        HMASTLOCK_md_s3;     // Locked Sequence
    output        HREADYIN_md_s3;
	    
	//wire         HSELM;         
    wire  [31:0] HADDRm;         
    wire   [1:0] HTRANSm;        
    wire         HWRITEm;        
    wire   [2:0] HSIZEm;         
    wire   [2:0] HBURSTm;        
    wire   [3:0] HPROTm;         
    wire   [3:0] HMASTERm;       
    wire  [31:0] HWDATAm;        
    wire         HMASTLOCKm;     
    wire         HREADYINm;
	
	wire HSEL_md_S4; // default slave
	wire [31:0] HRDATA_S4_md;
	wire [1:0]  HRESP_S4_md;
	wire        HREADYOUT_S4_md;
	
	
	//assign HSELM=HSELM1;    
	assign HADDRm     =(hmsel==2'b01)?HADDR:32'b0;    
	assign HTRANSm    =(hmsel==2'b01)?HTRANS:2'b00;   
	assign HWRITEm    =(hmsel==2'b01)?HWRITE:1'b0;   
	assign HSIZEm     =(hmsel==2'b01)?HSIZE:3'b0;    
	assign HBURSTm    =(hmsel==2'b01)?HBURST:3'b0;   
	assign HPROTm     =(hmsel==2'b01)?HPROT:4'b0;    
	assign HMASTERm   =(hmsel==2'b01)?HMASTER:4'b0;  
	assign HWDATAm    =(hmsel==2'b01)?HWDATA:32'b0;   
	assign HMASTLOCKm =(hmsel==2'b01)?HMASTLOCK:1'b0;
	assign HREADYINm  =(hmsel==2'b01)?HREADYIN:1'b0;
AHB_mdDecoder_S4 MD1(
	//.HCLK(HCLK),
	//.HRESETn(HRESETn),
	.HADDR(HADDRm),
	.HSEL0(HSEL_md_S0),
	.HSEL1(HSEL_md_S1),
	.HSEL2(HSEL_md_S2),
	.HSEL3(HSEL_md_S3),
	.HSEL4(HSEL_md_S4)
	);

AHB_mddefault_slave MD2(
	.HCLK(HCLK),
	.HRESETn(HRESETn),
	
	//.HSELm(HSELM),
	.HADDRm(HADDRm),
	.HTRANSm(HTRANSm),
	.HWRITEm(HWRITEm),
	.HSIZEm(HSIZEm),
	.HBURSTm(HBURSTm),
	.HPROTm(HPROTm),
	.HMASTERm(HMASTERm),
	.HWDATAm(HWDATAm),
	.HMASTLOCKm(HMASTLOCKm),
	.HREADYINm(HREADYINm),
	
	.HSEL4(HSEL_md_S4),
	.HRDATA(HRDATA_S4_md),
	.HRESP(HRESP_S4_md),
	.HREADYOUT(HREADYOUT_S4_md)
	);
AHB_mdMUX_S4 MD3(
	.HCLK(HCLK),
	.HRESETn(HRESETn),
	
	.HRDATAm(HRDATA_md_M1),
	.HREADYm(HREADYOUT_md_M1),
	.HRESPm(HRESP_md_M1),
	
	.HSEL0(HSEL_md_S0),
	.HRDATA0(HRDATA_S0_md),
	.HREADY0(HREADYOUT_S0_md),
	.HRESP0(HRESP_S0_md),
	.HSEL1(HSEL_md_S1),
	.HRDATA1(HRDATA_S1_md),
	.HREADY1(HREADYOUT_S1_md),
	.HRESP1(HRESP_S1_md),
	.HSEL2(HSEL_md_S2),
	.HRDATA2(HRDATA_S2_md),
	.HREADY2(HREADYOUT_S2_md),
	.HRESP2(HRESP_S2_md),
	.HSEL3(HSEL_md_S3),
	.HRDATA3(HRDATA_S3_md),
	.HREADY3(HREADYOUT_S3_md),
	.HRESP3(HRESP_S3_md),
	.HSEL4(HSEL_md_S4),
	.HRDATA4(HRDATA_S4_md),
	.HREADY4(HREADYOUT_S4_md),
	.HRESP4(HRESP_S4_md)
	
	);
AHB_mdMUX_dataS4 MD4(
	//.HSELm      (HSELM),   
	.HADDRm     (HADDRm),  
	.HTRANSm    (HTRANSm),   
	.HWRITEm    (HWRITEm),  
	.HSIZEm     (HSIZEm),   
	.HBURSTm    (HBURSTm),  
	.HPROTm     (HPROTm),   
	.HMASTERm   (HMASTERm), 
	.HWDATAm    (HWDATAm),  
	.HMASTLOCKm (HMASTLOCKm),
	.HREADYINm  (HREADYINm),
	
	//.HSELS0     (HSEL_md_S0),
	.HADDRS0    (HADDR_md_s0),    
	.HTRANSS0   (HTRANS_md_s0),   
	.HWRITES0   (HWRITE_md_s0),   
	.HSIZES0    (HSIZE_md_s0),    
	.HBURSTS0   (HBURST_md_s0),   
	.HPROTS0    (HPROT_md_s0),    
	.HMASTERS0  (HMASTER_md_s0),  
	.HWDATAS0   (HWDATA_md_s0),   
	.HMASTLOCKS0(HMASTLOCK_md_s0),
	.HREADYINS0 (HREADYIN_md_s0),
	
	//.HSELS1      (HSEL_md_S1),
	.HADDRS1    (HADDR_md_s1),     
	.HTRANSS1   (HTRANS_md_s1),    
	.HWRITES1   (HWRITE_md_s1),    
	.HSIZES1    (HSIZE_md_s1),     
	.HBURSTS1   (HBURST_md_s1),    
	.HPROTS1    (HPROT_md_s1),     
	.HMASTERS1  (HMASTER_md_s1),   
	.HWDATAS1   (HWDATA_md_s1),    
	.HMASTLOCKS1(HMASTLOCK_md_s1), 
	.HREADYINS1 (HREADYIN_md_s1), 
	
	//.HSELS2,     (HSEL_md_S2), 
	.HADDRS2    (HADDR_md_s2),    
	.HTRANSS2   (HTRANS_md_s2),   
	.HWRITES2   (HWRITE_md_s2),   
	.HSIZES2    (HSIZE_md_s2),    
	.HBURSTS2   (HBURST_md_s2),   
	.HPROTS2    (HPROT_md_s2),    
	.HMASTERS2  (HMASTER_md_s2),  
	.HWDATAS2   (HWDATA_md_s2),   
	.HMASTLOCKS2(HMASTLOCK_md_s2),
	.HREADYINS2 (HREADYIN_md_s2),
	
	//.HSELS3,     (HSEL_md_S3),
	.HADDRS3    (HADDR_md_s3),    
	.HTRANSS3   (HTRANS_md_s3),   
	.HWRITES3   (HWRITE_md_s3),   
	.HSIZES3    (HSIZE_md_s3),    
	.HBURSTS3   (HBURST_md_s3),   
	.HPROTS3    (HPROT_md_s3),    
	.HMASTERS3  (HMASTER_md_s3),  
	.HWDATAS3   (HWDATA_md_s3),   
	.HMASTLOCKS3(HMASTLOCK_md_s3),
	.HREADYINS3 (HREADYIN_md_s3),
	.SEL0(HSEL_md_S0),
	.SEL1(HSEL_md_S1),
	.SEL2(HSEL_md_S2),
	.SEL3(HSEL_md_S3),
	
	.HCLK(HCLK),   
	.HRESETn(HRESETn)
	
	);

/*always@(posedge HCLK or negedge HRESETn )
begin
 if(!HRESETn)
	begin

*/


endmodule