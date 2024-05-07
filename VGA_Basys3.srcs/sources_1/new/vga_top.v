module vga_top
	(
		input wire clk, reset,
		input wire [11:0] sw,
		output wire hsync, vsync,
		output wire [11:0] rgb
	);
	//clock signals
    wire clk_25mhz;
    wire clk_100mhz;
	clk_wiz_0 clock_instance (
        .clk_25mhz(clk_25mhz),     // output clk_25mhz
        .clk_100mhz(clk_100mhz),     // output clk_100mhz
        .clk_in1(clk)
        );
        
    localparam bram_enable = 1; 
    reg [16:0] bram_addr;
    wire [11:0] bram_dout;
    blk_mem_gen_0 bram_instance (
        .clka(clk_100mhz),    // input wire clka
        .ena(bram_enable),      // input wire ena
        .addra(bram_addr),  // input wire [16 : 0] addra
        .douta(bram_dout)  // output wire [11 : 0] douta
        );
	
	// register for Basys 2 8-bit RGB DAC 
	reg [11:0] rgb_reg;
	//signal to indicate pixel location is within active area
	wire active_area;
	wire [9:0]x;
	wire [9:0]y;
    // instantiate vga_sync
    vga_timing vga_timing_unit (
        .clk(clk_100mhz), 
        .clk25mhz(clk_25mhz), 
        .reset(reset), 
        .hsync(hsync), 
        .vsync(vsync),
        .active_area(active_area), 
        .x(x), 
        .y(y)
        );
         
    // rgb buffer value set via switches
    always @(posedge clk_100mhz, posedge reset)
    if (reset)
        rgb_reg <= 0;
    else
    begin
        bram_addr <= (y*320) + x;
        if(bram_addr < 77120 && x<320 && y <240)
        begin
            rgb_reg <= bram_dout;
        end
        else
            rgb_reg <= 12'b0;
    end
    
    // Output RGB signals during active area. Else blank outside of the active area
    assign rgb = (active_area) ? rgb_reg : 12'b0;
    
    
endmodule



