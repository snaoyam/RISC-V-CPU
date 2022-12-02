`timescale 1ns / 10ps

module pc(
  input clk,
  input [31:0] pc_addr,
  input [31:0] jump_addr,
  input pcSelect, // Jump Control
  output [31:0] pc_addr,
);
  reg [31:0] pc_addr;

  initial begin
    pc_addr <= 0;
  end

  always @(posedge clk) begin
    if(pcSelect)
      pc_addr <= jump_addr;
    else
      pc_addr <= pc_addr + 32'h4;
  end

endmodule