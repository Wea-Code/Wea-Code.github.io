module AHB_mssiS1(
	HCLK,    
	HRESETn, 
	hmsel,
	
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
	
	HRDATA_mi_M0,   
	HREADYOUT_mi_M0,
	HRESPmi_M0,     
	
	HSEL_mi_s1,      
	
	HADDR_mi_s1,     
	HTRANS_mi_s1,    
	HWRITE_mi_s1,    
	HSIZE_mi_s1,     
	HBURST_mi_s1,    
	HPROT_mi_s1,     
	HMASTER_mi_s1,   
	HWDATA_mi_s1,    
	HMASTLOCK_mi_s1, 
	HREADYIN_mi_s1,  
	
	HRDATA_s1_mi,   
	HREADYOUT_s1_mi,
	HRESP_s1_mi );    
	//AHB_mssiS1 make data from mssi and transmit to s1 
	input         HCLK;           // AHB System Clock
    input         HRESETn;         // AHB System Reset
	input  [1:0]  hmsel;
	//input from mssi
	//input         HSELM0,          // Slave Select
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
	//output to mssi
    output [31:0] HRDATA_mi_M0;        // Read data bus
    output        HREADYOUT_mi_M0;     // HREADY feedback
    output  [1:0] HRESPmi_M0;         // Transfer response
	
	//mi_s1 and s1_mi will go to MArbiter with md_s1 and s1_md
	//MArbiter decided who can transmit data to boot_rom
	output        HSEL_mi_s1;          // Slave Select
	
    output [31:0] HADDR_mi_s1;         // Address bus
    output  [1:0] HTRANS_mi_s1;        // Transfer type
    output        HWRITE_mi_s1;        // Transfer direction
    output  [2:0] HSIZE_mi_s1;         // Transfer size
    output  [2:0] HBURST_mi_s1;        // Burst type
    output  [3:0] HPROT_mi_s1;         // Protection control
    output  [3:0] HMASTER_mi_s1;       // Master select
    output [31:0] HWDATA_mi_s1;        // Write data
    output        HMASTLOCK_mi_s1;     // Locked Sequence
    output        HREADYIN_mi_s1;     // Transfer done
	
    input  [31:0] HRDATA_s1_mi;        // Read data bus
    input         HREADYOUT_s1_mi;     // HREADY feedback
    input   [1:0] HRESP_s1_mi;         // Transfer response
	
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
	
	assign HADDRm     =(hmsel==2'b10)?HADDR:32'b0;    
	assign HTRANSm    =(hmsel==2'b10)?HTRANS:2'b00;   
	assign HWRITEm    =(hmsel==2'b10)?HWRITE:1'b0;   
	assign HSIZEm     =(hmsel==2'b10)?HSIZE:3'b0;    
	assign HBURSTm    =(hmsel==2'b10)?HBURST:3'b0;   
	assign HPROTm     =(hmsel==2'b10)?HPROT:4'b0;    
	assign HMASTERm   =(hmsel==2'b10)?HMASTER:4'b0;  
	assign HWDATAm    =(hmsel==2'b10)?HWDATA:32'b0;   
	assign HMASTLOCKm =(hmsel==2'b10)?HMASTLOCK:1'b0;
	assign HREADYINm  =(hmsel==2'b10)?HREADYIN:1'b0;
	
	wire HSEL_mi_S2;
	wire [31:0]HRDATA_S2_mi;
	wire [1:0] HRESP_S2_mi;
	wire       HREADYOUT_S2_mi;
	
	AHB_midefault_slave MI1(
		.HCLK(HCLK),
		.HRESETn(HRESETn),
		
		//.HSELm(HSELM),
		.HADDRm(HADDRm),
		.HTRANSm(HTRANSm),
		.HWRITEm(HWRITEm),
		.HSIZEm(HSIZEm),
		.HBURSTm(HBURSTm),
		.HMASTERm(HMASTERm),
		.HWDATAm(HWDATAm),
		.HMASTLOCKm(HMASTLOCKm),
		.HREADYINm(HREADYINm),
		
		.HSEL2(HSEL_mi_S2),
		.HRDATA(HRDATA_S2_mi),
		.HRESP(HRESP_S2_mi),
		.HREADYOUT(HREADYOUT_S2_mi)
		);
	AHB_miDecoder_S1 MI2 (
		.HADDR(HADDRm),
		.HSEL1(HSEL_mi_s1),
		.HSEL2(HSEL_mi_S2)
		);
	AHB_miMUX_S1 MI3(
		.HCLK(HCLK),       
		.HRESETn(HRESETn), 
		
		.HRDATAm(HRDATA_mi_M0),
		.HREADYm(HREADYOUT_mi_M0),
		.HRESPm(HRESP_mi_M0),
		
		.HSEL1(HSEL_mi_s1),
		.HRDATA1(HRDATA_S1_mi),
		.HREADY1(HREADYOUT_s1_mi),
		.HRESP1(HRESP_s1_mi),
		.HSEL2(HSEL_mi_S2),
		.HRDATA2(HRDATA_S2_mi),
		.HREADY2(HREADYOUT_S2_mi),
		.HRESP2(HRESP_S2_mi)
		);
	AHB_miMUX_dataS1 MI4(
		.HCLK(HCLK),
		.HRESETn(HRESETn),
		
		.SEL1(HSEL_mi_s1),
		//.HSELm(HSELM),
		.HADDRm(HADDRm),
		.HTRANSm(HTRANSm),
		.HWRITEm(HWRITEm),
		.HSIZEm(HSIZEm),
		.HBURSTm(HBURSTm),
		.HPROTm(HPROTm),
		.HMASTERm(HMASTERm),
		.HWDATAm(HWDATAm),
		.HMASTLOCKm(HMASTERLOCKm),
		.HREADYINm(HREADYINm),
		
		.HADDRS1    (HADDR_mi_s1),
		.HTRANSS1   (HTRANS_mi_s1),
		.HWRITES1   (HWRITE_mi_s1),
		.HSIZES1    (HSIZE_mi_s1),
		.HBURSTS1   (HBURST_mi_s1),
		.HPROTS1    (HPROT_mi_s1),
		.HMASTERS1  (HMASTER_mi_s1),
		.HWDATAS1   (HWDATA_mi_s1),
		.HMASTLOCKS1(HMASTLOCK_mi_s1),
		.HREADYS1   (HREADYIN_mi_s1)
		);


endmodule