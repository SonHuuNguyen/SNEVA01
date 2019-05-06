/////////////////////////////////////////////
// File name : main_ctrl.v
// Author    : Son Nguyen - nguyensonute@gmail.com
// Description : Main control logic for SNEVA01 core
/////////////////////////////////////////////

//opcode table
parameter [6:0] OPCODE_G1 = 7'b011_0011; //ADD, SUB, SLL, SLT, SLTU, XOR, SRL, SRA, OR, AND
parameter [6:0] OPCODE_G2 = 7'b001_0011; //ADDI, SLTI, SLTIU, XORI, ORI, ANDI
parameter [6:0] OPCODE_G3 = 7'b010_0011; //SB, SH, SW
parameter [6:0] OPCODE_G4 = 7'b000_0011; //LB, LH, LW, LBU, LHU
parameter [6:0] OPCODE_G5 = 7'b110_0011; //BEQ, BNE, BLT, BGEm BLTU, BGEU
parameter [6:0] OPCODE_G6 = 7'b110_0111; //JALR
parameter [6:0] OPCODE_G7 = 7'b110_1111; //JAL
parameter [6:0] OPCODE_G8 = 7'b001_0111; //AUIPC
parameter [6:0] OPCODE_G9 = 7'b011_0111; //LUI

parameter ADD_SUB_3BIT = 3'b000;
parameter SLL_3BIT     = 3'b001;
parameter SLT_3BIT     = 3'b010;
parameter SLTU_3BIT    = 3'b011;
parameter XOR_3BIT     = 3'b100;
parameter SRL_SRA_3BIT = 3'b101;
parameter OR_3BIT      = 3'b110;
parameter AND_3BIT     = 3'b111;

parameter ALU_ADD = 4'b0000;
parameter ALU_SUB = 4'b0001;
parameter ALU_SLL = 4'b0100; //shift left logical
parameter ALU_SLT = 4'b0100; //set if less than
parameter ALU_SLTU = 4'b0100; //set if less than unsigned
parameter ALU_XOR = 4'b1010; //XOR
parameter ALU_XOR = 4'b0101; //SRL

parameter ALU_ADD       = 4'b0000;  //|   ALU_Out = A + B;
parameter ALU_SUB       = 4'b0001;  //|   ALU_Out = A - B;
//parameter ALU_       = 4'b0010;  //|   ALU_Out = A * B;
//parameter ALU_       = 4'b0011;  //|   ALU_Out = A / B;
parameter ALU_SLL       = 4'b0100;  //|   ALU_Out = A << 1;
parameter ALU_SRL       = 4'b0101;  //|   ALU_Out = A >> 1;
//parameter ALU_       = 4'b0110;  //|   ALU_Out = A rotated left by 1;
//parameter ALU_       = 4'b0111;  //|   ALU_Out = A rotated right by 1;
parameter ALU_AND       = 4'b1000;  //|   ALU_Out = A and B;
parameter ALU_OR     = 4'b1001;  //|   ALU_Out = A or B;
parameter ALU_XOR      = 4'b1010;  //|   ALU_Out = A xor B;
parameter ALU_NOR       = 4'b1011;  //|   ALU_Out = A nor B;
parameter ALU_NAND       = 4'b1100;  //|   ALU_Out = A nand B;
parameter ALU_XNOR       = 4'b1101;  //|   ALU_Out = A xnor B;
parameter ALU_SLT       = 4'b1110;  //|   ALU_Out = 1 if A<B else 0;
//parameter ALU_       = 4'b1111;  //|   ALU_Out = 1 if A=B else 0;


parameter BYTE = 2'b00;
parameter HALF_WORD = 2'b01;
parameter WORD = 2'b10;


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
                
  //tmp variable
  reg imm_sel_tmp;
  reg reg_wen_tmp;
  reg bsel_tmp;
  reg alu_sel_tmp;
  reg dmem_rw_tmp;
  reg wbsel_tmp;
  reg be_tmp;
  reg usel_tmp;

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
      end
      OPCODE_G4: begin
        if(inst[14:12] == {1'b0, BYTE} || inst[14:12] == {1'b0, HALF_WORD} || inst[14:12] == {1'b0, WORD}) begin //LB/LH/LW
	  imm_sel_tmp = 1;
	  reg_wen_tmp = 1;
	  bsel_tmp = 1;
	  dmem_rw_tmp = 1;
	  wbsel_tmp = 0;
	  be_tmp = inst[14:12];
	  usel_tmp = 1'b0; //unsigned deselect
	  alu_sel_tmp = ALU_ADD; 
	end
        else if(inst[14:12] == {1'b1, BYTE} || inst[14:12] == {1'b1, HALF_WORD} ) begin //LBU/LHU
	  imm_sel_tmp = 1;
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
