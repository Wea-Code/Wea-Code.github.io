module ApbBus (

    // AHB signals
    hclk,
    hresetn,
    haddr,
    hready,
    hsel,
    htrans,
    hwrite,
    hsize, 
    hburst,
    hresp,
    hready_resp,
    hwdata,
    hrdata,

    // APB signals
    pclk_en,
    paddr,
    penable, 
    pwrite,
    pwdata,
    psel_s6,
    psel_s5,
    psel_s4,
    psel_s3,
    psel_s2, 
    psel_s1,
    psel_s0,
    prdata_s6,
    prdata_s5,
    prdata_s4, 
    prdata_s3,
    prdata_s2,
    prdata_s1,
    prdata_s0
);

// -----------------------------------------------------------------------------
// Input & Output declarations
// -----------------------------------------------------------------------------
    // AHB signals
    input hclk;                    // AHB system clock
    input hresetn;                 // AHB system reset
    input [31:0] haddr;            // AHB bus address
    input hready;                  // AHB transfer done
    input hsel;                    // AHB slave select
    input [1:0] htrans;            // AHB transfer type
    input hwrite;                  // AHB transfer direction
    input [2:0] hsize;             // AHB transfer size
    input [2:0] hburst;            // AHB burst type
    output [1:0] hresp;            // AHB transfer response
    output hready_resp;            // AHB hready feedback
    input [31:0] hwdata;           // AHB write data
    output [31:0] hrdata;          // AHB read data bus

    // APB signals
    input pclk_en;                 // APB clock enable
    output [31:0] paddr;           // APB bus address
    output penable;                // APB bus enable
    output pwrite;                 // APB bus write signal
    output [31:0] pwdata;          // APB bus write data
    output psel_s6;                // APB bus port 6 peripheral select
    output psel_s5;                // APB bus port 5 peripheral select
    output psel_s4;                // APB bus port 4 peripheral select
    output psel_s3;                // APB bus port 3 peripheral select
    output psel_s2;                // APB bus port 2 peripheral select
    output psel_s1;                // APB bus port 1 peripheral select
    output psel_s0;                // APB bus port 0 peripheral select
    input [31:0] prdata_s6;        // APB bus port 6 read data
    input [31:0] prdata_s5;        // APB bus port 5 read data
    input [31:0] prdata_s4;        // APB bus port 4 read data
    input [31:0] prdata_s3;        // APB bus port 3 read data
    input [31:0] prdata_s2;        // APB bus port 2 read data
    input [31:0] prdata_s1;        // APB bus port 1 read data
    input [31:0] prdata_s0;        // APB bus port 0 read data

// -----------------------------------------------------------------------------
// Start main design from here
// -----------------------------------------------------------------------------
	wire pclk;
	assign pclk=pclk_en?hclk:pclk;
	
	
	wire [31:0]prdata;
	wire valid;
	wire [31:0] haddr1,haddr2;
	wire [31:0] hwdata1,hwdata2;
	wire hwritereg;
	wire [6:0]psel_reg;
	APB_Decoder apb1 (
		.pclk(pclk),
		.hresetn(hresetn),
		.hwrite(hwrite),
		.hreadyin(hready),
		.htrans(htrans),
		.hsel(hsel),
		.haddr(haddr),
		.hwdata(hwdata),
		.hresp(hresp),
		.prdata(prdata),
		.valid(valid),
		.haddr1(haddr1),
		.haddr2(haddr2),
		.hwdata1(hwdata1),
		.hwdata2(hwdata2),
		.hwritereg(hwritereg),
		.psel_reg(psel_reg),
		.prdata_s6(prdata_s6),
		.prdata_s5(prdata_s5),
		.prdata_s4(prdata_s4),
		.prdata_s3(prdata_s3),
		.prdata_s2(prdata_s2),
		.prdata_s1(prdata_s1),
		.prdata_s0(prdata_s0)
		);
	APB_Contral apb2 (
		.pclk(pclk),
		.hresetn(hresetn),
		.valid(valid),
		.haddr1(haddr1),
		.haddr2(haddr2),
		.hwdata1(hwdata1),
		.hwdata2(hwdata2),
		.hwritereg(hwritereg),
		.psel_reg(psel_reg), 
		.Prdata(prdata),
		.hwrite(hwrite),
		.haddr(haddr),
		.hwdata(hwdata),
		.Pwrite(pwrite),
		.Penable(penable),
		.Paddr(paddr),
		.Pwdata(pwdata),
		.hrdata(hrdata),
		.hreadyout(hready_resp),
		.psel_s6(psel_s6),
		.psel_s5(psel_s5),
		.psel_s4(psel_s4),
		.psel_s3(psel_s3),
		.psel_s2(psel_s2), 
		.psel_s1(psel_s1),
		.psel_s0(psel_s0)
		);
endmodule

