module AhbBus (

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
    HRDATAS0,
    HREADYOUTS0,
    HRESPS0,
    
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
    HRDATAS1,
    HREADYOUTS1,
    HRESPS1,
    
    // Output Port 0 for ZSPNano Slave
    HSELM0,
    HADDRM0,
    HTRANSM0,
    HWRITEM0,
    HSIZEM0,
    HBURSTM0,
    HPROTM0,
    HMASTERM0,
    HWDATAM0,
    HMASTLOCKM0,
    HREADYMUXM0,
    HRDATAM0,
    HREADYOUTM0,
    HRESPM0,
    
    // Output Port 1 for Boot ROM
    HSELM1,
    HADDRM1,
    HTRANSM1,
    HWRITEM1,
    HSIZEM1,
    HBURSTM1,
    HPROTM1,
    HMASTERM1,
    HWDATAM1,
    HMASTLOCKM1,
    HREADYMUXM1,
    HRDATAM1,
    HREADYOUTM1,
    HRESPM1,
    
    // Output Port 2 for System SRAM
    HSELM2,
    HADDRM2,
    HTRANSM2,
    HWRITEM2,
    HSIZEM2,
    HBURSTM2,
    HPROTM2,
    HMASTERM2,
    HWDATAM2,
    HMASTLOCKM2,
    HREADYMUXM2,
    HRDATAM2,
    HREADYOUTM2,
    HRESPM2,
    
    // Output Port 3
    HSELM3,
    HADDRM3,
    HTRANSM3,
    HWRITEM3,
    HSIZEM3,
    HBURSTM3,
    HPROTM3,
    HMASTERM3,
    HWDATAM3,
    HMASTLOCKM3,
    HREADYMUXM3,
    HRDATAM3,
    HREADYOUTM3,
    HRESPM3
    );
  
// -----------------------------------------------------------------------------
// Input & Output declarations
// -----------------------------------------------------------------------------
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
    output [31:0] HRDATAS0;        // Read data bus
    output        HREADYOUTS0;     // HREADY feedback
    output  [1:0] HRESPS0;         // Transfer response

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
    output [31:0] HRDATAS1;        // Read data bus
    output        HREADYOUTS1;     // HREADY feedback
    output  [1:0] HRESPS1;         // Transfer response
    
    // Output Port 0
    output        HSELM0;          // Slave Select
    output [31:0] HADDRM0;         // Address bus
    output  [1:0] HTRANSM0;        // Transfer type
    output        HWRITEM0;        // Transfer direction
    output  [2:0] HSIZEM0;         // Transfer size
    output  [2:0] HBURSTM0;        // Burst type
    output  [3:0] HPROTM0;         // Protection control
    output  [3:0] HMASTERM0;       // Master select
    output [31:0] HWDATAM0;        // Write data
    output        HMASTLOCKM0;     // Locked Sequence
    output        HREADYMUXM0;     // Transfer done
    input  [31:0] HRDATAM0;        // Read data bus
    input         HREADYOUTM0;     // HREADY feedback
    input   [1:0] HRESPM0;         // Transfer response

    // Output Port 1
    output        HSELM1;          // Slave Select
    output [31:0] HADDRM1;         // Address bus
    output  [1:0] HTRANSM1;        // Transfer type
    output        HWRITEM1;        // Transfer direction
    output  [2:0] HSIZEM1;         // Transfer size
    output  [2:0] HBURSTM1;        // Burst type
    output  [3:0] HPROTM1;         // Protection control
    output  [3:0] HMASTERM1;       // Master select
    output [31:0] HWDATAM1;        // Write data
    output        HMASTLOCKM1;     // Locked Sequence
    output        HREADYMUXM1;     // Transfer done
    input  [31:0] HRDATAM1;        // Read data bus
    input         HREADYOUTM1;     // HREADY feedback
    input   [1:0] HRESPM1;         // Transfer response

    // Output Port 2
    output        HSELM2;          // Slave Select
    output [31:0] HADDRM2;         // Address bus
    output  [1:0] HTRANSM2;        // Transfer type
    output        HWRITEM2;        // Transfer direction
    output  [2:0] HSIZEM2;         // Transfer size
    output  [2:0] HBURSTM2;        // Burst type
    output  [3:0] HPROTM2;         // Protection control
    output  [3:0] HMASTERM2;       // Master select
    output [31:0] HWDATAM2;        // Write data
    output        HMASTLOCKM2;     // Locked Sequence
    output        HREADYMUXM2;     // Transfer done
    input  [31:0] HRDATAM2;        // Read data bus
    input         HREADYOUTM2;     // HREADY feedback
    input   [1:0] HRESPM2;         // Transfer response

    // Output Port 3
    output        HSELM3;          // Slave Select
    output [31:0] HADDRM3;         // Address bus
    output  [1:0] HTRANSM3;        // Transfer type
    output        HWRITEM3;        // Transfer direction
    output  [2:0] HSIZEM3;         // Transfer size
    output  [2:0] HBURSTM3;        // Burst type
    output  [3:0] HPROTM3;         // Protection control
    output  [3:0] HMASTERM3;       // Master select
    output [31:0] HWDATAM3;        // Write data
    output        HMASTLOCKM3;     // Locked Sequence
    output        HREADYMUXM3;     // Transfer done
    input  [31:0] HRDATAM3;        // Read data bus
    input         HREADYOUTM3;     // HREADY feedback
    input   [1:0] HRESPM3;         // Transfer response
   
// -----------------------------------------------------------------------------
// Start main design from here
// -----------------------------------------------------------------------------
wire [1:0]hmsel;

         
wire  [31:0] HADDR;         
wire   [1:0] HTRANS;        
wire         HWRITE;        
wire   [2:0] HSIZE;         
wire   [2:0] HBURST;        
wire   [3:0] HPROT;         
wire   [3:0] HMASTER;       
wire  [31:0] HWDATA;        
wire         HMASTLOCK;     
wire         HREADYIN;






AHB_mssiS1 U1(
	.HCLK             (HCLK),    
	.HRESETn          (HRESETn), 
	.hmsel            (hmsel),
	
	.HADDR            (HADDR    ),    
	.HTRANS           (HTRANS   ),   
	.HWRITE           (HWRITE   ),   
	.HSIZE            (HSIZE    ),    
	.HBURST           (HBURST   ),   
	.HPROT            (HPROT    ),    
	.HMASTER          (HMASTER  ),  
	.HWDATA           (HWDATA   ),   
	.HMASTLOCK        (HMASTLOCK),
	.HREADYIN         (HREADYIN ), 
	
	.HRDATA_mi_M0     (HRDATAS0   ),   
	.HREADYOUT_mi_M0  (HREADYOUTS0),
	.HRESPmi_M0       (HRESPS0    ),     
	
	.HSEL_mi_s1       (HSELM1),      
					   	
	.HADDR_mi_s1      (HADDRM1    ),     
	.HTRANS_mi_s1     (HTRANSM1   ),    
	.HWRITE_mi_s1     (HWRITEM1   ),    
	.HSIZE_mi_s1      (HSIZEM1    ),     
	.HBURST_mi_s1     (HBURSTM1   ),    
	.HPROT_mi_s1      (HPROTM1    ),     
	.HMASTER_mi_s1    (HMASTERM1  ),   
	.HWDATA_mi_s1     (HWDATAM1   ),    
	.HMASTLOCK_mi_s1  (HMASTLOCKM1), 
	.HREADYIN_mi_s1   (HREADYMUXM1),  
	
	.HRDATA_s1_mi     (HRDATAM1   ),   
	.HREADYOUT_s1_mi  (HREADYOUTM1),
	.HRESP_s1_mi      (HRESPM1    ) 
	);   
	
AHB_mssdS4 U2(
	.HCLK               (HCLK),             
	.HRESETn            (HRESETn), 
	.hmsel              (hmsel),
	                    
	.HADDR              (HADDR    ),        
	.HTRANS             (HTRANS   ),       
	.HWRITE             (HWRITE   ),       
	.HSIZE              (HSIZE    ),        
	.HBURST             (HBURST   ),       
	.HPROT              (HPROT    ),        
	.HMASTER            (HMASTER  ),      
	.HWDATA             (HWDATA   ),       
	.HMASTLOCK          (HMASTLOCK),  
	.HREADYIN           (HREADYIN ), 
	
	.HRDATA_md_M1     (HRDATAS1    ), 
	.HREADYOUT_md_M1  (HREADYOUTS1 ), 
	.HRESP_md_M1      (HRESPS1     ), 
	                    
	.HSEL_md_S0       (HSELM0  ), 
	.HRDATA_S0_md     (HRDATAM0    ), 
	.HREADYOUT_S0_md  (HREADYOUTM0 ), 
	.HRESP_S0_md      (HRESPM0     ), 
	                   
	.HSEL_md_S1       (HSELM1  ), 
	.HRDATA_S1_md     (HRDATAM1    ), 
	.HREADYOUT_S1_md  (HREADYOUTM1 ), 
	.HRESP_S1_md      (HRESPM1     ), 
	                    
	.HSEL_md_S2       (HSELM2  ), 
	.HRDATA_S2_md     (HRDATAM2   ), 
	.HREADYOUT_S2_md  (HREADYOUTM2), 
	.HRESP_S2_md      (HRESPM2    ), 
	                     
	.HSEL_md_S3       (HSELM3  ), 
	.HRDATA_S3_md     (HRDATAM3   ), 
	.HREADYOUT_S3_md  (HREADYOUTM3), 
	.HRESP_S3_md      (HRESPM3    ), 
	                     
	.HADDR_md_s0      (HADDRM0    ), 
	.HTRANS_md_s0     (HTRANSM0   ), 
	.HWRITE_md_s0     (HWRITEM0   ), 
	.HSIZE_md_s0      (HSIZEM0    ), 
	.HBURST_md_s0     (HBURSTM0   ), 
	.HPROT_md_s0      (HPROTM0    ), 
	.HMASTER_md_s0    (HMASTERM0  ), 
	.HWDATA_md_s0     (HWDATAM0   ), 
	.HMASTLOCK_md_s0  (HMASTLOCKM0), 
	.HREADYIN_md_s0   (HREADYMUXM0), 
	                    
	.HADDR_md_s1      (HADDRM1    ), 
	.HTRANS_md_s1     (HTRANSM1   ), 
	.HWRITE_md_s1     (HWRITEM1   ), 
	.HSIZE_md_s1      (HSIZEM1    ), 
	.HBURST_md_s1     (HBURSTM1   ), 
	.HPROT_md_s1      (HPROTM1    ), 
	.HMASTER_md_s1    (HMASTERM1  ), 
	.HWDATA_md_s1     (HWDATAM1   ), 
	.HMASTLOCK_md_s1  (HMASTLOCKM1), 
	.HREADYIN_md_s1   (HREADYMUXM1), 
	                    
	.HADDR_md_s2      (HADDRM2    ), 
	.HTRANS_md_s2     (HTRANSM2   ), 
	.HWRITE_md_s2     (HWRITEM2   ), 
	.HSIZE_md_s2      (HSIZEM2    ), 
	.HBURST_md_s2     (HBURSTM2   ), 
	.HPROT_md_s2      (HPROTM2    ), 
	.HMASTER_md_s2    (HMASTERM2  ), 
	.HWDATA_md_s2     (HWDATAM2   ), 
	.HMASTLOCK_md_s2  (HMASTLOCKM2), 
	.HREADYIN_md_s2   (HREADYMUXM2), 
	                     
	.HADDR_md_s3      (HADDRM3    ), 
	.HTRANS_md_s3     (HTRANSM3   ), 
	.HWRITE_md_s3     (HWRITEM3   ), 
	.HSIZE_md_s3      (HSIZEM3    ), 
	.HBURST_md_s3     (HBURSTM3   ), 
	.HPROT_md_s3      (HPROTM3    ), 
	.HMASTER_md_s3    (HMASTERM3  ), 
	.HWDATA_md_s3     (HWDATAM3   ), 
	.HMASTLOCK_md_s3  (HMASTLOCKM3), 
	.HREADYIN_md_s3   (HREADYMUXM3) 
	                     
	);                 
                       
AHB_MArbiter U3(
	.HCLK(HCLK),
    .HRESETn(HRESETn),
	// Input 
	.HSELS0     (HSELS0     ),
	.HADDRS0    (HADDRS0    ),
	.HTRANSS0   (HTRANSS0   ),
	.HWRITES0   (HWRITES0   ),
	.HSIZES0    (HSIZES0    ),
	.HBURSTS0   (HBURSTS0   ),
	.HPROTS0    (HPROTS0    ),
	.HMASTERS0  (HMASTERS0  ),
	.HWDATAS0   (HWDATAS0   ),
	.HMASTLOCKS0(HMASTLOCKS0),
	.HREADYS0   (HREADYS0   ),
	// Input 
	.HSELS1     (HSELS1     ),
	.HADDRS1    (HADDRS1    ),
	.HTRANSS1   (HTRANSS1   ),
	.HWRITES1   (HWRITES1   ),
	.HSIZES1    (HSIZES1    ),
	.HBURSTS1   (HBURSTS1   ),
	.HPROTS1    (HPROTS1    ),
	.HMASTERS1  (HMASTERS1  ),
	.HWDATAS1   (HWDATAS1   ),
	.HMASTLOCKS1(HMASTLOCKS1),
	.HREADYS1   (HREADYS1   ),
	//output 
	.hmsel      (hmsel),
	
 	.HADDRM     (HADDR      ),
	.HTRANSM    (HTRANS     ),
	.HWRITEM    (HWRITE     ),
	.HSIZEM     (HSIZE      ),
	.HBURSTM    (HBURST     ),
	.HPROTM     (HPROT      ),
	.HMASTERM   (HMASTER    ),
	.HWDATAM    (HWDATA     ),
	.HMASTLOCKM (HMASTLOCK  ),
	.HREADYINM  (HREADYIN   )
	);
	            


endmodule


