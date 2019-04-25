/////////////////////////////////////////////
// File name : mem.v
// Author    : Son Nguyen - nguyensonute@gmail.com
// Description : Memory with mem size configuarable
/////////////////////////////////////////////

module mem (
  input wire [31:0] addr,      // Mem Address
  input wire [31:0] wr_data,   // Mem write data
  input wire we, re,           // Write enable, read enable
  input wire clk,              // This is synchronous mem, should run with clock 
  output reg [31:0] rd_data    // Output of Memory Address Contents
       
                   );

  parameter MEM_SIZE = 256; //default size is 256

  reg [31:0] MEM[0: MEM_SIZE -1];
  
  
  always @(posedge clk) begin
    //write
    if (we == 1'b1) begin
      MEM[addr] <= write_data;
    end
   //read
    if (re == 1'b1) begin
      rd_data <= MEM[addr];
    end
  end

endmodule
