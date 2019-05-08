/////////////////////////////////////////////
// File name : main_ctrl.v
// Author    : Son Nguyen - nguyensonute@gmail.com
// Description : Main control logic for SNEVA01 core
/////////////////////////////////////////////



module main_ctrl(
                 input wire [31:0] inst,  //input from instruction mem
		 output wire imm_sel,    //immediate select
		 output wire reg_wen,     //register write enable to reg_bank
		 output wire bsel,        //select of mux before ALU
		 output wire [3:0] alu_sel, //select for ALU
		 output wire dmem_rw,     //control dmem read/write
		 output wire wbsel,
		 output wire usel,        //unsign select for imm gen
		 output wire [1:0] be          //byte enable
		 

                );
                
  `include "params_def.v"

  //tmp variable
  reg imm_sel_tmp;
  reg reg_wen_tmp;
  reg bsel_tmp;
  reg alu_sel_tmp;
  reg dmem_rw_tmp;
  reg wbsel_tmp;
  reg be_tmp;
  reg usel_tmp;

  assign imm_sel =  imm_sel_tmp;
  assign reg_wen =  reg_wen_tmp;
  assign bsel    =  bsel_tmp;
  assign alu_sel =  alu_sel_tmp;
  assign dmem_rw =  dmem_rw_tmp;
  assign wbsel   =  wbsel_tmp;
  assign be      =  be_tmp;
  assign usel    =  usel_tmp;

  always @(*) begin
    case(inst[6:0]) begin //opcode
      OPCODE_G1: begin
        if(inst[14:12] == ADD_SUB_3BIT && !inst[30]) begin
	  alu_sel_tmp = ALU_ADD; //alu add
	end
        else if(inst[14:12] == ADD_SUB_3BIT && inst[30]) begin
	  alu_sel_tmp = ALU_SUB; //alu sub
	end
        else if(inst[14:12] == SLL_3BIT) begin
	  alu_sel_tmp = ALU_SLL; //alu sll
	end
        else if(inst[14:12] == SLT_3BIT) begin
	  alu_sel_tmp = ALU_SLT; //alu slt
	end
        else if(inst[14:12] == SLTU_3BIT) begin
	  alu_sel_tmp = ALU_SLT; //???? need to check again
	end
        else if(inst[14:12] == XOR_3BIT) begin
	  alu_sel_tmp = ALU_XOR;
	end
        else if(inst[14:12] == SRL_SRA_3BIT && !inst[30]) begin //SRL
	  alu_sel_tmp = ALU_SRL; 
	end
        else if(inst[14:12] == SRL_SRA_3BIT && inst[30]) begin //SRLA
	  alu_sel_tmp = ALU_SRL;  //???? need to check again
	end
        else if(inst[14:12] == OR_3BIT) begin
	  alu_sel_tmp = ALU_OR;
	end
        else if(inst[14:12] == AND_3BIT) begin
	  alu_sel_tmp = ALU_AND;
	end
	reg_wen_tmp = 0; //write enable
      end

      OPCODE_G2: begin
      end
      OPCODE_G3: begin
        if(inst[14:1] == 3'b010) begin //SW
	  imm_sel_tmp = IMM_S;
	  reg_wen_tmp = 0; 
	  bsel_tmp = 1;
	  dmem_rw_tmp = 1; //write
	  alu_sel_tmp = ALU_ADD; 
	end
      end
      OPCODE_G4: begin
        if(inst[14:12] == {1'b0, BYTE} || inst[14:12] == {1'b0, HALF_WORD} || inst[14:12] == {1'b0, WORD}) begin //LB/LH/LW
	  imm_sel_tmp = IMM_I;
	  reg_wen_tmp = 1;
	  bsel_tmp = 1;
	  dmem_rw_tmp = 1;
	  wbsel_tmp = 0;
	  be_tmp = inst[14:12];
	  usel_tmp = 1'b0; //unsigned deselect
	  alu_sel_tmp = ALU_ADD; 
	end
        else if(inst[14:12] == {1'b1, BYTE} || inst[14:12] == {1'b1, HALF_WORD} ) begin //LBU/LHU
	  imm_sel_tmp = IMM_I;
	  reg_wen_tmp = 1;
	  bsel_tmp = 1;
	  dmem_rw_tmp = 1;
	  wbsel_tmp = 0;
	  be_tmp = inst[14:12];
	  usel_tmp = 1'b1; //unsigned select
	  alu_sel_tmp = ALU_ADD; 
	end
      end
      OPCODE_G5: begin
      end
      OPCODE_G6: begin
      end
      OPCODE_G7: begin
      end
      OPCODE_G8: begin
      end
      OPCODE_G9: begin
      end
    endcase
  end
endmodule
