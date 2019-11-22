`timescale 1ns/1ps
module wallace_tree_tb;
  reg  [3:0] A,B;
  wire [7:0] P;
  wallace_tree i1 (.A(A), .B(B), .P(P));
  integer i, j;
  initial begin
    #0 A = 0; B = 0;
    for (i = 0; i < 16; i = i + 1) begin
      for (j = 0; j < 16; j = j + 1) begin
        #1 A = i; B = j;
      end
    end
    #1 $stop;
  end
endmodule
