`timescale 1ns / 1ps

`ifdef RTL
   `include "../01_RTL/decoder_6to64.v" 
`endif

`ifdef GATE
   `include "../02_SYN/Netlist/decoder_6to64_SYN.v"
`endif

`define CLK_TIME 1

module decoder_6to64_tb;
   real CLK_PRD = `CLK_TIME;
   // Testbench signals
   reg clk;
   reg rst_n;
   reg  [5:0] addr;
   wire [63:0] wordline;

   // Instantiate the decoder
   decoder_6to64 u_decoder (
      .clk(clk)
      ,.rst_n(rst_n)
      ,.in_addr(addr)
      ,.wordline(wordline)
   );

   integer i;

   initial begin
     `ifdef RTL
         $fsdbDumpfile("decoder_6to64.fsdb");
         $fsdbDumpvars(0,"+mda");
         $fsdbDumpvars();
     `endif
     `ifdef GATE
         $sdf_annotate("../02_SYN/Netlist/decoder_SYN.sdf", u_decoder);
         $fsdbDumpfile("decoder_SYN.fsdb");
         $fsdbDumpvars(0,"+mda");
         $fsdbDumpvars();
     `endif
   end

   initial begin
      clk = 0;
      addr = 10;
      forever begin
      #(0.5*CLK_PRD) clk = ~clk; 
      end
   end
   initial begin
      rst_n = 1;
      #(0.5*CLK_PRD) rst_n = 0;
      #(2*CLK_PRD) rst_n = 1;
   end

   initial begin
      $display("=== Simulation of dec_6to64 ===");
      $display("ADDR | Wordline (only 1 bit should be LOW)");
      #(2*CLK_PRD)
      // Loop through all 64 address values
      for (i = 0; i < 64; i = i + 1) begin
         addr = i[5:0];       // Apply address
         #CLK_PRD;               // Wait 5ns for propagation
         $display("  %2d  | %064b", addr, wordline);
      end

      $finish;
   end

endmodule

