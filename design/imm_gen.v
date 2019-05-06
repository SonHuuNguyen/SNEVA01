/////////////////////////////////////////////
// File name : imm_gen.v
// Author    : Son Nguyen - nguyensonute@gmail.com
// Description : Align immediate value to 32bit output
/////////////////////////////////////////////

module imm_gen(
              input wire [11:0] inst_in,
	      input wire        usel,
	      output wire [31:0] imm_out
              );

   assign imm_out = {(usel == 1'b1)? 21'b0 : 21{inst_in[11]}, inst_in[10:0]};
endmodule
