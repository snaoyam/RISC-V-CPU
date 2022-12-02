`timescale 1ns / 10ps

module clock(
  output clk
);
  reg clk;

  initial begin
    clk <= 0;
  end

  always begin
    #1 clk <= ~clk;
  end

endmodule