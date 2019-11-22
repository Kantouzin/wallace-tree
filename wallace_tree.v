module wallace_tree (
  input  wire [3:0] A,
  input  wire [3:0] B,
  output wire [7:0] P );

  wire C[9:0];
  wire S[7:0];

  assign P[0] = A[0] & B[0];

  full_adder f1 (
    .A(A[1] & B[0]), .B(A[0] & B[1]), .X(1'b0),
    .S(P[1]), .C(C[0])
  );

  full_adder f2 (
    .A(A[2] & B[0]), .B(A[1] & B[1]), .X(A[0] & B[2]),
    .S(S[0]), .C(C[1])
  );

  full_adder f3 (
    .A(~(A[3] & B[0])), .B(A[2] & B[1]), .X(A[1] & B[2]),
    .S(S[1]), .C(C[2])
  );

  full_adder f4 (
    .A(~(A[3] & B[1])), .B(A[2] & B[2]), .X(~(A[1] & B[3])),
    .S(S[2]), .C(C[3])
  );

  full_adder f5 (
    .A(~(A[3] & B[2])), .B(~(A[2] & B[3])), .X(1'b0),
    .S(S[3]), .C(C[4])
  );

  full_adder f6 (
    .A(S[0]), .B(C[0]), .X(1'b0),
    .S(P[2]), .C(C[5])
  );

  full_adder f7 (
    .A(S[1]), .B(~(A[0] & B[3])), .X(C[1]),
    .S(S[4]), .C(C[6])
  );

  full_adder f8 (
    .A(S[2]), .B(C[2]), .X(1'b1),
    .S(S[5]), .C(C[7])
  );

  full_adder f9 (
    .A(S[3]), .B(C[3]), .X(1'b0),
    .S(S[6]), .C(C[8])
  );

  full_adder f10 (
    .A(A[3] & B[3]), .B(C[4]), .X(1'b0),
    .S(S[7]), .C(C[9])
  );

  add5 a1 (
    .A({1'b1, S[7], S[6], S[5], S[4]}),
    .B({C[9], C[8], C[7], C[6], C[5]}),
    .S(P[7:3])
  );
endmodule
