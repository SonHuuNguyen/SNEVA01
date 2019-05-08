/////////////////////////////////////////////
// File name : imm_gen.v
// Author    : Son Nguyen - nguyensonute@gmail.com
// Description : Align immediate value to 32bit output
/////////////////////////////////////////////

module imm_gen(
              input wire [11:0] inst_in,
	      input wire        imm_sel,
	      output wire [31:0] imm_out
              );

   `include "params_def.v"
   assign imm_out = { 21{inst_in[11]}, inst_in[30:25], (imm_sel == IMM_I) ? inst_in[24:20] : inst_in[11:7]};

endmodule
