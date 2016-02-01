# Wiring diagram of a single button #

Button, which requires a single input FPGA.

<img src='https://sites.google.com/site/analogsynthdiy/_/rsrc/1410552253065/sobstvennye-razrabotki/sintezator-na-baze-plis/11---vvod-vyvod/1-4-knopka/key.png?height=400&width=345'>

<b>IMPORTANT</b>. When reading from the buttons required buffering / input processing, otherwise it may be a signal line, characterized by 0 or 1, leading to errors in the modules which will cause very difficult to understand (Z-state of input).<br>
<br>
<b>IMPORTANT2</b>. Inverted input: if the button is pressed, the result is 0.<br>
<br>
<b>Example.</b>
<pre>
//3bit buffer<br>
reg [2:0] gate_buff;<br>
<br>
always @ (posedge clk50M)<br>
gate_buff <= {gate_buff[1:0],~key0};<br>
<br>
//buffered value<br>
assign GATE_D = (gate_buff == 3'b111);<br>
<br>
//pos edge<br>
assign GATE_POSEDGE = (gate_buff == 3'b011);<br>
<br>
//neg adge<br>
assign GATE_NEGEDGE = (gate_buff == 3'b110);<br>
<br>
</pre>