`timescale 1ns / 10ps

module data_memory(
  input clk,
  input [16:0] address,
  input [31:0] writeData,
  input writeEnable,
  output [31:0] readData,
);
  wire [31:0] readData;

  reg [31:0] Mem [0:16'hffff];
  //initial $readmemh("initial_data_memory.txt", Mem);

  assign readData = Mem[address[16:2]];

  always @(posedge clk) begin
    if(writeEnable)
      Mem[address[31:2]] <= writeData;
  end

endmodule