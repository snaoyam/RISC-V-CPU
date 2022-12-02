`timescale 1ns / 10ps

module adder(
  input [31:0] a;
  input [31:0] b;
  output [31: 0] c;
);

  wire [31:0] w;
  assign w[0]=0;
  genvar i;
  generate 
    for(i=0;i<=31;i=i+1) begin:adding
      FA FA_inst(.a(a[i]),.b(b[i]), .cin(w[i]), .cout(w[i+1]), .s(y[i]));
    end
  endgenerate

  endmodule

  module FA(input a, input b, input cin, output cout, output s);

  assign {cout,s}=a+b+cin;

endmodule