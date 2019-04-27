/////////////////////////////////////////////
// File name : pc_ctrl.v
// Author    : Son Nguyen - nguyensonute@gmail.com
// Description : Progam counter(PC) control
/////////////////////////////////////////////


module (
       input wire        clk,
       input wire        rstn,
       input wire [31:0] pc,
       input wire [31:0] pc_jmp,
       input wire [31:0] pc_sel,
       output reg [31:0]  pc_out
       ):


  wire pc_inner;
  assign pc_inner =(pc_sel == 1'b1) pc_jmp : pc;

  //counter control
  always@(posedge clk or negedge rstn) begin
     if(!rstn) begin
       pc_out <= 32'h0000_0000;
     end
     else begin
       pc_out <= pc_inner + 32'd4;
     end
  end
      
endmodule
