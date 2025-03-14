module note2dds(CLK, NOTE, ADDER);

input wire CLK;
input wire [6:0] NOTE;
output [31:0] ADDER;

reg [31:0] ADDER_tbl [15:0];
reg [3:0] addr;
reg [3:0] divider;

// note div 12 ( * 0,08333333333333333333333333333333)
//; Add input / 16 to accumulator
//; Add input / 64 to accumulator

initial begin
   addr <= 4'd0;
	divider <= 4'd0;
	ADDER_tbl[ 4'd0] <= 32'd0359575;
	ADDER_tbl[ 4'd1] <= 32'd0380957;
	ADDER_tbl[ 4'd2] <= 32'd0403610;
	ADDER_tbl[ 4'd3] <= 32'd0427610;
	ADDER_tbl[ 4'd4] <= 32'd0453037;
	ADDER_tbl[ 4'd5] <= 32'd0479976;
	ADDER_tbl[ 4'd6] <= 32'd0508516;
	ADDER_tbl[ 4'd7] <= 32'd0538754;
	ADDER_tbl[ 4'd8] <= 32'd0570790;
	ADDER_tbl[ 4'd9] <= 32'd0604731;
	ADDER_tbl[4'd10] <= 32'd0640691;
	ADDER_tbl[4'd11] <= 32'd0678788;
	ADDER_tbl[4'd12] <= 32'd0;
	ADDER_tbl[4'd13] <= 32'd0;
	ADDER_tbl[4'd14] <= 32'd0;
	ADDER_tbl[4'd15] <= 32'd0;
end

assign ADDER = ADDER_tbl[addr] >> divider;

wire [3:0] diap   = (NOTE <  12) ? 4'd00 :
					     (NOTE <  24) ? 4'd01 :
					     (NOTE <  36) ? 4'd02 :
					     (NOTE <  48) ? 4'd03 :
					     (NOTE <  60) ? 4'd04 :
					     (NOTE <  72) ? 4'd05 :
					     (NOTE <  84) ? 4'd06 :
					     (NOTE <  96) ? 4'd07 :
					     (NOTE < 108) ? 4'd08 :
					     (NOTE < 120) ? 4'd09 : 4'd010 ;

wire [6:0] c_addr = NOTE - (diap * 4'd012); 
						 
always @ (posedge CLK) begin
	addr    <= c_addr[3:0];
	divider <= 4'd010 - diap;
end

endmodule
