module add5 (
  input  wire [4:0] A,
  input  wire [4:0] B,
  output wire [4:0] S );

  wire C[3:0];

  full_adder f1 (
    .A(A[0]), .B(B[0]), .X(1'b0),
    .S(S[0]), .C(C[0])
  );

  full_adder f2 (
    .A(A[1]), .B(B[1]), .X(C[0]),
    .S(S[1]), .C(C[1])
  );

  full_adder f3 (
    .A(A[2]), .B(B[2]), .X(C[1]),
    .S(S[2]), .C(C[2])
  );

  full_adder f4 (
    .A(A[3]), .B(B[3]), .X(C[2]),
    .S(S[3]), .C(C[3])
  );

  full_adder f5 (
    .A(A[4]), .B(B[4]), .X(C[3]),
    .S(S[4]), .C()
  );
endmodule
