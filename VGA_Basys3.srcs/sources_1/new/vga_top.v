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
        .clk_in1(clk));
	
	// register for Basys 2 8-bit RGB DAC 
	reg [11:0] rgb_reg;
	//signal to indicate pixel location is within active area
	wire active_area;
    // instantiate vga_sync
    vga_timing vga_timing_unit (.clk(clk_100mhz), .clk25mhz(clk_25mhz), .reset(reset), .hsync(hsync), .vsync(vsync),
                            .active_area(active_area), .x(), .y());
    // rgb buffer value set via switches
    always @(posedge clk_100mhz, posedge reset)
    if (reset)
        rgb_reg <= 0;
    else
        rgb_reg <= sw;
    
    // Output RGB signals during active area. Else blank outside of the active area
    assign rgb = (active_area) ? rgb_reg : 12'b0;
    
    
endmodule



