`include "arithmeticunit.v";
`include "mux2to1.v";
`include "logicunit.v";

module ALU1bit(A,B,Cin,S1,S0,M,Cout,F);
input A, B, Cin, S1, S0, M;
output F, Cout;
wire G,H;

logic_unit LU(S1,S0,A,B,H);
arithmetic_unit AU(S1,S0,A,B,Cin,Cout,G);
mux2to1 MUX(G,H,M,F);
endmodule




