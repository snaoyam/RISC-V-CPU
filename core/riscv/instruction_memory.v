`timescale 1ns / 10ps

module data_memory(
  input [31:0] address,
  output [31:0] instruction,
);
  wire [31:0] readData;

  reg [31:0] Mem [0:16'h1000];
  initial $readmemh("instruction_binary.txt", Mem);

  always @(*) begin
    instruction <= Mem[address[31:2]];
  end

endmodule