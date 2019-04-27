/////////////////////////////////////////////
// File name : alu.v
// Author    : https://www.fpga4student.com/2017/06/Verilog-code-for-ALU.html
// Description : ALU
/////////////////////////////////////////////

/* ALU Arithmetic and Logic Operations
----------------------------------------------------------------------
|ALU_Sel|   ALU Operation
----------------------------------------------------------------------
| 0000  |   ALU_Out = A + B;
----------------------------------------------------------------------
| 0001  |   ALU_Out = A - B;
----------------------------------------------------------------------
| 0010  |   ALU_Out = A * B;
----------------------------------------------------------------------
| 0011  |   ALU_Out = A / B;
----------------------------------------------------------------------
| 0100  |   ALU_Out = A << 1;
----------------------------------------------------------------------
| 0101  |   ALU_Out = A >> 1;
----------------------------------------------------------------------
| 0110  |   ALU_Out = A rotated left by 1;
----------------------------------------------------------------------
| 0111  |   ALU_Out = A rotated right by 1;
----------------------------------------------------------------------
| 1000  |   ALU_Out = A and B;
----------------------------------------------------------------------
| 1001  |   ALU_Out = A or B;
----------------------------------------------------------------------
| 1010  |   ALU_Out = A xor B;
----------------------------------------------------------------------
| 1011  |   ALU_Out = A nor B;
----------------------------------------------------------------------
| 1100  |   ALU_Out = A nand B;
----------------------------------------------------------------------
| 1101  |   ALU_Out = A xnor B;
----------------------------------------------------------------------
| 1110  |   ALU_Out = 1 if A<B else 0;
----------------------------------------------------------------------
| 1111  |   ALU_Out = 1 if A=B else 0;
----------------------------------------------------------------------*/

module alu(
           input [31:0] A,B,  // ALU 32-bit Inputs                 
           input [3:0] alu_sel,// ALU Selection
           output [31:0] alu_out, // ALU 32-bit Output
           output carryout // Carry Out Flag
    );
    reg [31:0] alu_result;
    wire [32:0] tmp;
    assign alu_out = alu_result; // alu out
    assign tmp = {1'b0,A} + {1'b0,B};
    assign carryout = tmp[32]; // carryout flag
    always @(*)
    begin
        case(ALU_Sel)
          4'b0000: // Addition
             alu_result = A + B ; 
          4'b0001: // Subtraction
             alu_result = A - B ;
          4'b0010: // Multiplication
             alu_result = A * B;
          4'b0011: // Division
             alu_result = A/B;
          4'b0100: // Logical shift left
             alu_result = A<<1;
          4'b0101: // Logical shift right
            alu_result = A>>1;
          4'b0110: // Rotate left
            alu_result = {A[29:0],A[31]};
          4'b0111: // Rotate right
            alu_result = {A[0],A[31:1]};
          4'b1000: //  Logical and 
            alu_result = A & B;
          4'b1001: //  Logical or
            alu_result = A | B;
          4'b1010: //  Logical xor 
            alu_result = A ^ B;
          4'b1011: //  Logical nor
            alu_result = ~(A | B);
          4'b1100: // Logical nand 
            alu_result = ~(A & B);
          4'b1101: // Logical xnor
            alu_result = ~(A ^ B);
          4'b1110: // Less comparison
            alu_result = (A<B)?32'd1:32'd0 ;
          4'b1111: // Equal comparison   
            alu_result = (A==B)?32'd1:32'd0 ;
          default: alu_result = A + B ; 
        endcase
    end

endmodule
