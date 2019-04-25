
/////////////////////////////////////////////
// File name : reg_bank.v
// Author    : Son Nguyen - nguyensonute@gmail.com
// Description : Register bank for SNVEVA01 core
/////////////////////////////////////////////

module reg_bank (
                input wire        clk,    //clock
                input wire        rstn,   //async reset
                input wire        reg_wen,//reg write enable , active low
                input wire [4:0]  addr_a, //address A
                input wire [4:0]  addr_b, //address B
		input wire [31:0] data_i, //data input
	        output wire [31:0] data_o_a, //data out A
	        output wire [31:0] data_o_b  //data out B
                );


  //register 32-bit : r0 -> r31 
  reg [31:0] r0; //always 0
  reg [31:0] r1;
  reg [31:0] r2;
  reg [31:0] r3;
  reg [31:0] r4;
  reg [31:0] r5;
  reg [31:0] r6;
  reg [31:0] r7;
  reg [31:0] r8;
  reg [31:0] r9;
  reg [31:0] r10;
  reg [31:0] r11;
  reg [31:0] r12;
  reg [31:0] r13;
  reg [31:0] r14;
  reg [31:0] r15;
  reg [31:0] r16;
  reg [31:0] r17;
  reg [31:0] r18;
  reg [31:0] r19;
  reg [31:0] r20;
  reg [31:0] r21;
  reg [31:0] r22;
  reg [31:0] r23;
  reg [31:0] r24;
  reg [31:0] r25;
  reg [31:0] r26;
  reg [31:0] r27;
  reg [31:0] r28;
  reg [31:0] r29;
  reg [31:0] r30;
  reg [31:0] r31;

  //r0 ~
  always@(posedge clk or negedge rstn) begin
     if(!rstn) begin
       r0 <= 32'h0000_0000;
     end
     else begin
       r0 <= r0;
     end
  end

  //r1 ~
  always@(posedge clk or negedge rstn) begin
     if(!rstn) begin
       r1 <= 32'h0000_0000;
     end
     else begin
       if (!reg_wen && addr_a == 5'd01) begin //write
         r1 <= data_i;
       end
       else begin
         r1 <= r1;
       end
     end
  end
  //r2 ~
  always@(posedge clk or negedge rstn) begin
     if(!rstn) begin
       r2 <= 32'h0000_0000;
     end
     else begin
       if (!reg_wen && addr_a == 5'd02) begin //write
         r2 <= data_i;
       end
       else begin
         r2 <= r2;
       end
     end
  end
  //r3 ~
  always@(posedge clk or negedge rstn) begin
     if(!rstn) begin
       r3 <= 32'h0000_0000;
     end
     else begin
       if (!reg_wen && addr_a == 5'd03) begin //write
         r3 <= data_i;
       end
       else begin
         r3 <= r3;
       end
     end
  end
  //r4 ~
  always@(posedge clk or negedge rstn) begin
     if(!rstn) begin
       r4 <= 32'h0000_0000;
     end
     else begin
       if (!reg_wen && addr_a == 5'd04) begin //write
         r4 <= data_i;
       end
       else begin
         r4 <= r4;
       end
     end
  end
  //r5 ~
  always@(posedge clk or negedge rstn) begin
     if(!rstn) begin
       r5 <= 32'h0000_0000;
     end
     else begin
       if (!reg_wen && addr_a == 5'd05) begin //write
         r5 <= data_i;
       end
       else begin
         r5 <= r5;
       end
     end
  end
  //r6 ~
  always@(posedge clk or negedge rstn) begin
     if(!rstn) begin
       r6 <= 32'h0000_0000;
     end
     else begin
       if (!reg_wen && addr_a == 5'd06) begin //write
         r6 <= data_i;
       end
       else begin
         r6 <= r6;
       end
     end
  end
  //r7 ~
  always@(posedge clk or negedge rstn) begin
     if(!rstn) begin
       r7 <= 32'h0000_0000;
     end
     else begin
       if (!reg_wen && addr_a == 5'd07) begin //write
         r7 <= data_i;
       end
       else begin
         r7 <= r7;
       end
     end
  end
  //r8 ~
  always@(posedge clk or negedge rstn) begin
     if(!rstn) begin
       r8 <= 32'h0000_0000;
     end
     else begin
       if (!reg_wen && addr_a == 5'd08) begin //write
         r8 <= data_i;
       end
       else begin
         r8 <= r8;
       end
     end
  end
  //r9 ~
  always@(posedge clk or negedge rstn) begin
     if(!rstn) begin
       r9 <= 32'h0000_0000;
     end
     else begin
       if (!reg_wen && addr_a == 5'd09) begin //write
         r9 <= data_i;
       end
       else begin
         r9 <= r9;
       end
     end
  end
  //r10 ~
  always@(posedge clk or negedge rstn) begin
     if(!rstn) begin
       r10 <= 32'h0000_0000;
     end
     else begin
       if (!reg_wen && addr_a == 5'd10) begin //write
         r10 <= data_i;
       end
       else begin
         r10 <= r10;
       end
     end
  end
  //r11 ~
  always@(posedge clk or negedge rstn) begin
     if(!rstn) begin
       r11 <= 32'h0000_0000;
     end
     else begin
       if (!reg_wen && addr_a == 5'd11) begin //write
         r11 <= data_i;
       end
       else begin
         r11 <= r11;
       end
     end
  end
  //r12 ~
  always@(posedge clk or negedge rstn) begin
     if(!rstn) begin
       r12 <= 32'h0000_0000;
     end
     else begin
       if (!reg_wen && addr_a == 5'd12) begin //write
         r12 <= data_i;
       end
       else begin
         r12 <= r12;
       end
     end
  end
  //r13 ~
  always@(posedge clk or negedge rstn) begin
     if(!rstn) begin
       r13 <= 32'h0000_0000;
     end
     else begin
       if (!reg_wen && addr_a == 5'd03) begin //write
         r13 <= data_i;
       end
       else begin
         r13 <= r13;
       end
     end
  end
  //r14 ~
  always@(posedge clk or negedge rstn) begin
     if(!rstn) begin
       r14 <= 32'h0000_0000;
     end
     else begin
       if (!reg_wen && addr_a == 5'd14) begin //write
         r14 <= data_i;
       end
       else begin
         r14 <= r14;
       end
     end
  end
  //r15 ~
  always@(posedge clk or negedge rstn) begin
     if(!rstn) begin
       r15 <= 32'h0000_0000;
     end
     else begin
       if (!reg_wen && addr_a == 5'd15) begin //write
         r15 <= data_i;
       end
       else begin
         r15 <= r15;
       end
     end
  end
  //r16 ~
  always@(posedge clk or negedge rstn) begin
     if(!rstn) begin
       r16 <= 32'h0000_0000;
     end
     else begin
       if (!reg_wen && addr_a == 5'd16) begin //write
         r16 <= data_i;
       end
       else begin
         r16 <= r16;
       end
     end
  end
  //r17 ~
  always@(posedge clk or negedge rstn) begin
     if(!rstn) begin
       r17 <= 32'h0000_0000;
     end
     else begin
       if (!reg_wen && addr_a == 5'd17) begin //write
         r17 <= data_i;
       end
       else begin
         r17 <= r17;
       end
     end
  end
  //r18 ~
  always@(posedge clk or negedge rstn) begin
     if(!rstn) begin
       r18 <= 32'h0000_0000;
     end
     else begin
       if (!reg_wen && addr_a == 5'd18) begin //write
         r18 <= data_i;
       end
       else begin
         r18 <= r18;
       end
     end
  end
  //r19 ~
  always@(posedge clk or negedge rstn) begin
     if(!rstn) begin
       r19 <= 32'h0000_0000;
     end
     else begin
       if (!reg_wen && addr_a == 5'd19) begin //write
         r19 <= data_i;
       end
       else begin
         r19 <= r19;
       end
     end
  end
  //r20 ~
  always@(posedge clk or negedge rstn) begin
     if(!rstn) begin
       r20 <= 32'h0000_0000;
     end
     else begin
       if (!reg_wen && addr_a == 5'd20) begin //write
         r20 <= data_i;
       end
       else begin
         r20 <= r20;
       end
     end
  end
  //r21 ~
  always@(posedge clk or negedge rstn) begin
     if(!rstn) begin
       r21 <= 32'h0000_0000;
     end
     else begin
       if (!reg_wen && addr_a == 5'd21) begin //write
         r21 <= data_i;
       end
       else begin
         r21 <= r21;
       end
     end
  end
  //r22 ~
  always@(posedge clk or negedge rstn) begin
     if(!rstn) begin
       r22 <= 32'h0000_0000;
     end
     else begin
       if (!reg_wen && addr_a == 5'd22) begin //write
         r22 <= data_i;
       end
       else begin
         r22 <= r22;
       end
     end
  end
  //r23 ~
  always@(posedge clk or negedge rstn) begin
     if(!rstn) begin
       r23 <= 32'h0000_0000;
     end
     else begin
       if (!reg_wen && addr_a == 5'd23) begin //write
         r23 <= data_i;
       end
       else begin
         r23 <= r23;
       end
     end
  end
  //r24 ~
  always@(posedge clk or negedge rstn) begin
     if(!rstn) begin
       r24 <= 32'h0000_0000;
     end
     else begin
       if (!reg_wen && addr_a == 5'd24) begin //write
         r24 <= data_i;
       end
       else begin
         r24 <= r24;
       end
     end
  end
  //r25 ~
  always@(posedge clk or negedge rstn) begin
     if(!rstn) begin
       r25 <= 32'h0000_0000;
     end
     else begin
       if (!reg_wen && addr_a == 5'd25) begin //write
         r25 <= data_i;
       end
       else begin
         r25 <= r25;
       end
     end
  end
  //r26 ~
  always@(posedge clk or negedge rstn) begin
     if(!rstn) begin
       r26 <= 32'h0000_0000;
     end
     else begin
       if (!reg_wen && addr_a == 5'd25) begin //write
         r26 <= data_i;
       end
       else begin
         r26 <= r26;
       end
     end
  end
  //r27 ~
  always@(posedge clk or negedge rstn) begin
     if(!rstn) begin
       r27 <= 32'h0000_0000;
     end
     else begin
       if (!reg_wen && addr_a == 5'd27) begin //write
         r27 <= data_i;
       end
       else begin
         r27 <= r27;
       end
     end
  end
  //r28 ~
  always@(posedge clk or negedge rstn) begin
     if(!rstn) begin
       r28 <= 32'h0000_0000;
     end
     else begin
       if (!reg_wen && addr_a == 5'd24) begin //write
         r28 <= data_i;
       end
       else begin
         r28 <= r28;
       end
     end
  end
  //r29 ~
  always@(posedge clk or negedge rstn) begin
     if(!rstn) begin
       r29 <= 32'h0000_0000;
     end
     else begin
       if (!reg_wen && addr_a == 5'd29) begin //write
         r29 <= data_i;
       end
       else begin
         r29 <= r29;
       end
     end
  end
  //r30 ~
  always@(posedge clk or negedge rstn) begin
     if(!rstn) begin
       r30 <= 32'h0000_0000;
     end
     else begin
       if (!reg_wen && addr_a == 5'd30) begin //write
         r30 <= data_i;
       end
       else begin
         r30 <= r30;
       end
     end
  end
  //r31 ~
  always@(posedge clk or negedge rstn) begin
     if(!rstn) begin
       r31 <= 32'h0000_0000;
     end
     else begin
       if (!reg_wen && addr_a == 5'd31) begin //write
         r31 <= data_i;
       end
       else begin
         r31 <= r31;
       end
     end
  end
endmodule
