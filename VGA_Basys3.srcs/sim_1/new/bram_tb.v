

module bram_tb();
    
    reg clk;
    reg bram_enable;
    reg [16:0] addra;
    wire [11:0] douta;
    
    blk_mem_gen_0 bram_instance (
        .clka(clk),    // input wire clka
        .ena(bram_enable),      // input wire ena
        .addra(addra),  // input wire [16 : 0] addra
        .douta(douta)  // output wire [11 : 0] douta
        );
        
    always #20 clk = ~clk;  
    
    initial begin
        clk <=0;
        bram_enable <= 0;
        addra <=0;
        #40;
        bram_enable<=1;
        
        #1000000;
        $finish;                // End simulation
    end    
    
    always@(posedge clk)
    begin
        addra <= addra +1;
    end
endmodule
