`timescale 1ns / 1ps

module testbench;

    // Inputs
    reg clk;
    reg reset;
    reg [11:0] sw;

    // Outputs
    wire hsync;
    wire vsync;
    wire [11:0] rgb;

    // Instantiate the module under test
    vga_top dut (
        .clk(clk),
        .reset(reset),
        .sw(sw),
        .hsync(hsync),
        .vsync(vsync),
        .rgb(rgb)
    );
    
    //clock gen logic
    always 
    begin
        clk = 1'b1; 
        #5; // 10 ns
    
        clk = 1'b0;
        #5;
    end
    
    

    // Initial stimulus
    initial begin
        // Initialize inputs
        reset = 1;
        sw = 12'b000000000000;

        // Wait for a few clock cycles
        #100;

        // De-assert reset
        reset = 0;

        // Apply test pattern
        sw = 12'b000000000011;

        // End simulation after the pattern is displayed
        #1000000;
        $finish;
    end

endmodule
