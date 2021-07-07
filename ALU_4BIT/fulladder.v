`include "hafladder.v";

module fulladder(a,b,cin,cout,s);
input a,b,cin;
output cout,s;
wire sum,carry1,carry2;

halfadder h1(a,b,carry1,sum);
halfadder h2(sum,cin,carry2,s);
assign cout=carry1|carry2;
endmodule
