`timescale 1ns / 10ps

module alu(
  input [31:0] inputA,
  input [31:0] inputB,
  input [3:0] aluSel,
  output [31:0] result,
  output zero,
);
  wire signed [31:0] add, sra, sla, sll, and, or, xor;

  assign add = inputA + inputB;
  assign sra = inputA >>> inputB;
  assign srl = inputA >> inputB;
  assign sll = inputA << inputB;
  assign and = inputA & inputB;
  assign or = inputA | inputB;
  assign xor = inputA ^ inputB;

  wire [31:0] a, b, c, d, e, f;

  assign a = aluSel[0] ? add : sub;
  assign b = aluSel[0] ? sra : sla;
  assign c = aluSel[0] ? sll : and;
  assign d = aluSel[0] ? or : xor;

  assign e = aluSel[1] ? a : b;
  assign f = aluSel[1] ? c : d;

  assign result = aluSel[2] ? e : f;
  assign zero = (result === 0) ? 1b'1 : 1b'0;
  
endmodule