`timescale 1ns / 100ps
module ModuleTester(
			input wire clk50M,
			input wire [6:0] in_data,
			output led0,
			output led1,
			output wire [31:0] out_data
);

//генератор 50 МГц
//wire clk50PLL;
//wire locked;
//nco clk50M_PLL(clk50M, clk50PLL, locked);

reg [6:0] in_d;

initial in_d <= 0;

wire [7:0] rnd;
note_pitch2dds exp2(clk50M, in_data, in_data + 2, out_data);
//note2dds exp2(clk50M, in_data, out_data);

assign led0 = (in_d == 8'd0);

always @ (posedge clk50M) in_d <= in_d + 1;


endmodule
