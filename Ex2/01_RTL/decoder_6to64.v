`include "../01_RTL/decoder_3to8.v"

module decoder_6to64(
   input clk,
   input rst_n,
   input [5:0] in_addr,
	output [63:0] wordline
);

   reg [5:0] addr;
   
   always @(posedge clk or negedge rst_n) begin
      if (!rst_n)
         addr <= 6'd0;
      else
         addr <= in_addr;
   end
   
   //Split addresses into 2 parts
   wire [2:0] msb, lsb;
   assign msb = addr[5:3];
   assign lsb = addr[2:0];
    	
   //Create MSB decoder with 8 enable signals connecting to 8 LSB decoders 
   wire [7:0] msb_en;
   decoder_3to8 msb_decoder(
   	.a(msb),
   	.word(msb_en)
   );
   	
   //Create a group of 8 LSB decoders
   wire [63:0] wl_temp;
   
   genvar i;
   generate
   	for (i = 0; i < 8; i = i + 1) begin: lsb_decoder_group
   	wire [7:0] lsb_out;
   
   decoder_3to8 lsb_decoder(
   	.a(lsb),
   	.word(lsb_out)
   );
   
   //Combine MSB decoders to 8 LSB decoders (active low)
   assign wl_temp[i * 8 +: 8] = (msb_en[i] == 1'b0) ? lsb_out : 8'b11111111;
   	end
   endgenerate
   
   //Assign the final output
   assign wordline = wl_temp;

endmodule










