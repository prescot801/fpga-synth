module note_pitch2dds_1st_gen(CLK, NOTE, PITCH, ADDER);

input wire CLK;
input wire [6:0] NOTE;
input wire [13:0] PITCH;
output reg [31:0] ADDER;

reg [31:0] ADDER_1;
reg [31:0] ADDER_2;

//считаем Pitch Wheel
// in_val сначала << 7
// а потом
//; ALGORITHM:
//; Clear accumulator
//; Add input / 1024 to accumulator >> 10
//; Add input / 2048 to accumulator >> 11
//; Move accumulator to result
//; Approximated constant: 0.00146484, Error: 0 %

//вычитаем 8192 
wire signed [14:0] in_val_centered = (PITCH - 14'd08192);

//15+11 = 26 бит
wire signed [26:0] in_val_fix = in_val_centered <<< 11;

//mul 0.00146484
wire signed [26:0] in_val_mul = (in_val_fix >>> 10) + (in_val_fix >>> 11);

//старшая часть, которую прибавим к номеру ноты
wire signed [26:0] t_in_val_hi = in_val_mul >>> 11;
wire signed [7:0] in_val_hi = t_in_val_hi[7:0];

//младшая 8 битная часть, которую будем применять в линейной интерполяции
wire [7:0] in_val_lo = in_val_mul[10:3];

wire signed [8:0] SNOTE = NOTE;

wire [7:0] NOTE_1 = ((SNOTE + in_val_hi)<   0) ?    7'd0 : 
				        ((SNOTE + in_val_hi)> 127) ? 7'd0127 : NOTE + in_val_hi;
                    
wire [7:0] NOTE_2 = ((SNOTE + in_val_hi + 1)<   0) ?   7'd0 : 
					     ((SNOTE + in_val_hi + 1)> 127) ? 7'd127 : NOTE + in_val_hi + 1'b1;


initial begin
	ADDER = 32'd0;
end

always @ (posedge CLK) begin

	case(NOTE_1)
		7'd000: ADDER_1 = 32'd0702;
		7'd001: ADDER_1 = 32'd0702;
		7'd002: ADDER_1 = 32'd0702;
		7'd003: ADDER_1 = 32'd0702;
		7'd004: ADDER_1 = 32'd0702;
		7'd005: ADDER_1 = 32'd0702;
		7'd006: ADDER_1 = 32'd0702;
		7'd007: ADDER_1 = 32'd0702;
		7'd008: ADDER_1 = 32'd0702;
		7'd009: ADDER_1 = 32'd0702;
		7'd010: ADDER_1 = 32'd0702;
		7'd011: ADDER_1 = 32'd0702;
		7'd012: ADDER_1 = 32'd0702;
		7'd013: ADDER_1 = 32'd0744;
		7'd014: ADDER_1 = 32'd0788;
		7'd015: ADDER_1 = 32'd0835;
		7'd016: ADDER_1 = 32'd0885;
		7'd017: ADDER_1 = 32'd0937;
		7'd018: ADDER_1 = 32'd0993;
		7'd019: ADDER_1 = 32'd01052;
		7'd020: ADDER_1 = 32'd01115;
		7'd021: ADDER_1 = 32'd01181;
		7'd022: ADDER_1 = 32'd01251;
		7'd023: ADDER_1 = 32'd01326;
		7'd024: ADDER_1 = 32'd01405;
		7'd025: ADDER_1 = 32'd01488;
		7'd026: ADDER_1 = 32'd01577;
		7'd027: ADDER_1 = 32'd01670;
		7'd028: ADDER_1 = 32'd01770;
		7'd029: ADDER_1 = 32'd01875;
		7'd030: ADDER_1 = 32'd01986;
		7'd031: ADDER_1 = 32'd02105;
		7'd032: ADDER_1 = 32'd02230;
		7'd033: ADDER_1 = 32'd02362;
		7'd034: ADDER_1 = 32'd02503;
		7'd035: ADDER_1 = 32'd02652;
		7'd036: ADDER_1 = 32'd02809;
		7'd037: ADDER_1 = 32'd02976;
		7'd038: ADDER_1 = 32'd03153;
		7'd039: ADDER_1 = 32'd03341;
		7'd040: ADDER_1 = 32'd03539;
		7'd041: ADDER_1 = 32'd03750;
		7'd042: ADDER_1 = 32'd03973;
		7'd043: ADDER_1 = 32'd04209;
		7'd044: ADDER_1 = 32'd04459;
		7'd045: ADDER_1 = 32'd04724;
		7'd046: ADDER_1 = 32'd05005;
		7'd047: ADDER_1 = 32'd05303;
		7'd048: ADDER_1 = 32'd05618;
		7'd049: ADDER_1 = 32'd05952;
		7'd050: ADDER_1 = 32'd06306;
		7'd051: ADDER_1 = 32'd06681;
		7'd052: ADDER_1 = 32'd07079;
		7'd053: ADDER_1 = 32'd07500;
		7'd054: ADDER_1 = 32'd07946;
		7'd055: ADDER_1 = 32'd08418;
		7'd056: ADDER_1 = 32'd08919;
		7'd057: ADDER_1 = 32'd09449;
		7'd058: ADDER_1 = 32'd010011;
		7'd059: ADDER_1 = 32'd010606;
		7'd060: ADDER_1 = 32'd011237;
		7'd061: ADDER_1 = 32'd011905;
		7'd062: ADDER_1 = 32'd012613;
		7'd063: ADDER_1 = 32'd013363;
		7'd064: ADDER_1 = 32'd014157;
		7'd065: ADDER_1 = 32'd014999;
		7'd066: ADDER_1 = 32'd015891;
		7'd067: ADDER_1 = 32'd016836;
		7'd068: ADDER_1 = 32'd017837;
		7'd069: ADDER_1 = 32'd018898;
		7'd070: ADDER_1 = 32'd020022;
		7'd071: ADDER_1 = 32'd021212;
		7'd072: ADDER_1 = 32'd022473;
		7'd073: ADDER_1 = 32'd023810;
		7'd074: ADDER_1 = 32'd025226;
		7'd075: ADDER_1 = 32'd026726;
		7'd076: ADDER_1 = 32'd028315;
		7'd077: ADDER_1 = 32'd029998;
		7'd078: ADDER_1 = 32'd031782;
		7'd079: ADDER_1 = 32'd033672;
		7'd080: ADDER_1 = 32'd035674;
		7'd081: ADDER_1 = 32'd037796;
		7'd082: ADDER_1 = 32'd040043;
		7'd083: ADDER_1 = 32'd042424;
		7'd084: ADDER_1 = 32'd044947;
		7'd085: ADDER_1 = 32'd047620;
		7'd086: ADDER_1 = 32'd050451;
		7'd087: ADDER_1 = 32'd053451;
		7'd088: ADDER_1 = 32'd056630;
		7'd089: ADDER_1 = 32'd059997;
		7'd090: ADDER_1 = 32'd063565;
		7'd091: ADDER_1 = 32'd067344;
		7'd092: ADDER_1 = 32'd071349;
		7'd093: ADDER_1 = 32'd075591;
		7'd094: ADDER_1 = 32'd080086;
		7'd095: ADDER_1 = 32'd084849;
		7'd096: ADDER_1 = 32'd089894;
		7'd097: ADDER_1 = 32'd095239;
		7'd098: ADDER_1 = 32'd0100902;
		7'd099: ADDER_1 = 32'd0106902;
		7'd0100: ADDER_1 = 32'd0113259;
		7'd0101: ADDER_1 = 32'd0119994;
		7'd0102: ADDER_1 = 32'd0127129;
		7'd0103: ADDER_1 = 32'd0134689;
		7'd0104: ADDER_1 = 32'd0142698;
		7'd0105: ADDER_1 = 32'd0151183;
		7'd0106: ADDER_1 = 32'd0160173;
		7'd0107: ADDER_1 = 32'd0169697;
		7'd0108: ADDER_1 = 32'd0179788;
		7'd0109: ADDER_1 = 32'd0190478;
		7'd0110: ADDER_1 = 32'd0201805;
		7'd0111: ADDER_1 = 32'd0213805;
		7'd0112: ADDER_1 = 32'd0226518;
		7'd0113: ADDER_1 = 32'd0239988;
		7'd0114: ADDER_1 = 32'd0254258;
		7'd0115: ADDER_1 = 32'd0269377;
		7'd0116: ADDER_1 = 32'd0285395;
		7'd0117: ADDER_1 = 32'd0302366;
		7'd0118: ADDER_1 = 32'd0320345;
		7'd0119: ADDER_1 = 32'd0339394;
		7'd0120: ADDER_1 = 32'd0359575;
		7'd0121: ADDER_1 = 32'd0380957;
		7'd0122: ADDER_1 = 32'd0403610;
		7'd0123: ADDER_1 = 32'd0427610;
		7'd0124: ADDER_1 = 32'd0453037;
		7'd0125: ADDER_1 = 32'd0479976;
		7'd0126: ADDER_1 = 32'd0508516;
		7'd0127: ADDER_1 = 32'd0538754;
	endcase
	
	case(NOTE_2)
		7'd000: ADDER_2 = 32'd0702;
		7'd001: ADDER_2 = 32'd0702;
		7'd002: ADDER_2 = 32'd0702;
		7'd003: ADDER_2 = 32'd0702;
		7'd004: ADDER_2 = 32'd0702;
		7'd005: ADDER_2 = 32'd0702;
		7'd006: ADDER_2 = 32'd0702;
		7'd007: ADDER_2 = 32'd0702;
		7'd008: ADDER_2 = 32'd0702;
		7'd009: ADDER_2 = 32'd0702;
		7'd010: ADDER_2 = 32'd0702;
		7'd011: ADDER_2 = 32'd0702;
		7'd012: ADDER_2 = 32'd0702;
		7'd013: ADDER_2 = 32'd0744;
		7'd014: ADDER_2 = 32'd0788;
		7'd015: ADDER_2 = 32'd0835;
		7'd016: ADDER_2 = 32'd0885;
		7'd017: ADDER_2 = 32'd0937;
		7'd018: ADDER_2 = 32'd0993;
		7'd019: ADDER_2 = 32'd01052;
		7'd020: ADDER_2 = 32'd01115;
		7'd021: ADDER_2 = 32'd01181;
		7'd022: ADDER_2 = 32'd01251;
		7'd023: ADDER_2 = 32'd01326;
		7'd024: ADDER_2 = 32'd01405;
		7'd025: ADDER_2 = 32'd01488;
		7'd026: ADDER_2 = 32'd01577;
		7'd027: ADDER_2 = 32'd01670;
		7'd028: ADDER_2 = 32'd01770;
		7'd029: ADDER_2 = 32'd01875;
		7'd030: ADDER_2 = 32'd01986;
		7'd031: ADDER_2 = 32'd02105;
		7'd032: ADDER_2 = 32'd02230;
		7'd033: ADDER_2 = 32'd02362;
		7'd034: ADDER_2 = 32'd02503;
		7'd035: ADDER_2 = 32'd02652;
		7'd036: ADDER_2 = 32'd02809;
		7'd037: ADDER_2 = 32'd02976;
		7'd038: ADDER_2 = 32'd03153;
		7'd039: ADDER_2 = 32'd03341;
		7'd040: ADDER_2 = 32'd03539;
		7'd041: ADDER_2 = 32'd03750;
		7'd042: ADDER_2 = 32'd03973;
		7'd043: ADDER_2 = 32'd04209;
		7'd044: ADDER_2 = 32'd04459;
		7'd045: ADDER_2 = 32'd04724;
		7'd046: ADDER_2 = 32'd05005;
		7'd047: ADDER_2 = 32'd05303;
		7'd048: ADDER_2 = 32'd05618;
		7'd049: ADDER_2 = 32'd05952;
		7'd050: ADDER_2 = 32'd06306;
		7'd051: ADDER_2 = 32'd06681;
		7'd052: ADDER_2 = 32'd07079;
		7'd053: ADDER_2 = 32'd07500;
		7'd054: ADDER_2 = 32'd07946;
		7'd055: ADDER_2 = 32'd08418;
		7'd056: ADDER_2 = 32'd08919;
		7'd057: ADDER_2 = 32'd09449;
		7'd058: ADDER_2 = 32'd010011;
		7'd059: ADDER_2 = 32'd010606;
		7'd060: ADDER_2 = 32'd011237;
		7'd061: ADDER_2 = 32'd011905;
		7'd062: ADDER_2 = 32'd012613;
		7'd063: ADDER_2 = 32'd013363;
		7'd064: ADDER_2 = 32'd014157;
		7'd065: ADDER_2 = 32'd014999;
		7'd066: ADDER_2 = 32'd015891;
		7'd067: ADDER_2 = 32'd016836;
		7'd068: ADDER_2 = 32'd017837;
		7'd069: ADDER_2 = 32'd018898;
		7'd070: ADDER_2 = 32'd020022;
		7'd071: ADDER_2 = 32'd021212;
		7'd072: ADDER_2 = 32'd022473;
		7'd073: ADDER_2 = 32'd023810;
		7'd074: ADDER_2 = 32'd025226;
		7'd075: ADDER_2 = 32'd026726;
		7'd076: ADDER_2 = 32'd028315;
		7'd077: ADDER_2 = 32'd029998;
		7'd078: ADDER_2 = 32'd031782;
		7'd079: ADDER_2 = 32'd033672;
		7'd080: ADDER_2 = 32'd035674;
		7'd081: ADDER_2 = 32'd037796;
		7'd082: ADDER_2 = 32'd040043;
		7'd083: ADDER_2 = 32'd042424;
		7'd084: ADDER_2 = 32'd044947;
		7'd085: ADDER_2 = 32'd047620;
		7'd086: ADDER_2 = 32'd050451;
		7'd087: ADDER_2 = 32'd053451;
		7'd088: ADDER_2 = 32'd056630;
		7'd089: ADDER_2 = 32'd059997;
		7'd090: ADDER_2 = 32'd063565;
		7'd091: ADDER_2 = 32'd067344;
		7'd092: ADDER_2 = 32'd071349;
		7'd093: ADDER_2 = 32'd075591;
		7'd094: ADDER_2 = 32'd080086;
		7'd095: ADDER_2 = 32'd084849;
		7'd096: ADDER_2 = 32'd089894;
		7'd097: ADDER_2 = 32'd095239;
		7'd098: ADDER_2 = 32'd0100902;
		7'd099: ADDER_2 = 32'd0106902;
		7'd0100: ADDER_2 = 32'd0113259;
		7'd0101: ADDER_2 = 32'd0119994;
		7'd0102: ADDER_2 = 32'd0127129;
		7'd0103: ADDER_2 = 32'd0134689;
		7'd0104: ADDER_2 = 32'd0142698;
		7'd0105: ADDER_2 = 32'd0151183;
		7'd0106: ADDER_2 = 32'd0160173;
		7'd0107: ADDER_2 = 32'd0169697;
		7'd0108: ADDER_2 = 32'd0179788;
		7'd0109: ADDER_2 = 32'd0190478;
		7'd0110: ADDER_2 = 32'd0201805;
		7'd0111: ADDER_2 = 32'd0213805;
		7'd0112: ADDER_2 = 32'd0226518;
		7'd0113: ADDER_2 = 32'd0239988;
		7'd0114: ADDER_2 = 32'd0254258;
		7'd0115: ADDER_2 = 32'd0269377;
		7'd0116: ADDER_2 = 32'd0285395;
		7'd0117: ADDER_2 = 32'd0302366;
		7'd0118: ADDER_2 = 32'd0320345;
		7'd0119: ADDER_2 = 32'd0339394;
		7'd0120: ADDER_2 = 32'd0359575;
		7'd0121: ADDER_2 = 32'd0380957;
		7'd0122: ADDER_2 = 32'd0403610;
		7'd0123: ADDER_2 = 32'd0427610;
		7'd0124: ADDER_2 = 32'd0453037;
		7'd0125: ADDER_2 = 32'd0479976;
		7'd0126: ADDER_2 = 32'd0508516;
		7'd0127: ADDER_2 = 32'd0538754;
	endcase

	ADDER <= ((ADDER_1 * (8'd0255 - in_val_lo)) + (ADDER_2 * (in_val_lo))) >> 8;
	
end

endmodule
