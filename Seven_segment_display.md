# Wiring diagram of 7-segment display #

7-segment display - static mode.

<img src='https://sites.google.com/site/analogsynthdiy/_/rsrc/1410552977566/sobstvennye-razrabotki/sintezator-na-baze-plis/11---vvod-vyvod/1-6---semisegmentnyj-indikator/HEX.png'>

Display the number on the display<br>
<br>
<pre>
//Register, which will be joining the indicator<br>
output [7:0] SEG;<br>
<br>
//integer from 0 to 15, to be displayed on the indicator<br>
reg [3:0] data;<br>
<br>
reg [6:0] SEG_buf;<br>
always @ (data)<br>
begin<br>
case(data)<br>
4'h0: SEG_buf <= 7'b0111111;<br>
4'h1: SEG_buf <= 7'b0000110;<br>
4'h2: SEG_buf <= 7'b1011011;<br>
4'h3: SEG_buf <= 7'b1001111;<br>
4'h4: SEG_buf <= 7'b1100110;<br>
4'h5: SEG_buf <= 7'b1101101;<br>
4'h6: SEG_buf <= 7'b1111101;<br>
4'h7: SEG_buf <= 7'b0000111;<br>
4'h8: SEG_buf <= 7'b1111111;<br>
4'h9: SEG_buf <= 7'b1101111;<br>
4'hA: SEG_buf <= 7'b1110111;<br>
4'hB: SEG_buf <= 7'b1111100;<br>
4'hC: SEG_buf <= 7'b0111001;<br>
4'hD: SEG_buf <= 7'b1011110;<br>
4'hE: SEG_buf <= 7'b1111001;<br>
4'hF: SEG_buf <= 7'b1110001;<br>
default: SEG_buf <= 7'b0111111;<br>
endcase<br>
end<br>
<br>
assign SEG = {1'b0,SEG_buf}; //Hight bit (point) always 0.<br>
</pre>