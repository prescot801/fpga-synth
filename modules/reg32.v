module reg32(CLK, WR, DATA, DATA_OUT);

input wire CLK;
input wire [31:0] DATA;
input wire WR;
output reg [31:0] DATA_OUT;

initial begin
	DATA_OUT <= 32'd0;
end

always @ (posedge CLK) begin
	if (WR==1) begin
		DATA_OUT <= DATA;
	end
end

endmodule
