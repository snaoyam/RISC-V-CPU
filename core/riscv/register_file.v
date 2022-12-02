`timescale 1ns / 10ps

module register_file(
  input clk,
  input [4:0] readReg1, readReg2, writeReg,
  input [31:0] writeData,
  input writeEnable, //WriteBack enable
  input reset,
  output [31:0] readData1, readData2, // ReadData
);

  wire [31:0] readData1, readData2;11
  reg [31:0] Regs [0:31];
  assign readData1 = Regs[readReg1];
  assign readData2 = Regs[readReg2];
  integer i;

  initial begin
    for(i=0; i<32; i=i+1)
      Regs[i] <= 32'b0;
  end

  always @(posedge clk) begin
    Regs[0] <= 32'b0;
    if(reset)
      for(i=0; i<32; i=i+1)
        Regs[i] <= 32'b0;
    else if(writeEnable && writeReg != 5'h0) begin
      Regs[writeReg] <= writeData;
      $display("RegWrite: x%d = %h", writeReg, writeData);
    end
  end

  always @(*) begin
    if(readReg1)
      readData1 <= Regs[readReg1];
    else
      readData1 < 32'b0;
  end

  always @(*) begin
    if(readReg2)
      readData2 <= Regs[readReg2];
    else
      readData2 < 32'b0;
  end

endmodule
