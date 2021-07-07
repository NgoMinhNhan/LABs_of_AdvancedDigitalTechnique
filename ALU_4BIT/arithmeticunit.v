`include "fulladder.v";
module arithmetic_unit(s1,s0,a,b,cin,cout,f);
input s1,s0,a,b,cin;
output cout,f;
wire out_01, out_10, out_11, cout_01, cout_10, cout_11;

fulladder f01(.a(a),.b(b),.cin(cin),.cout(cout_01),.s(out_01));
fulladder f10(.a(a),.b(~b),.cin(cin),.cout(cout_10),.s(out_10));
fulladder f11(.a(~a),.b(b),.cin(cin),.cout(cout_11),.s(out_11));

assign {cout,f}=({s1,s0}==2'b00)?a+cout:
					 ({s1,s0}==2'b01)?{cout_01,out_01}:
					 ({s1,s0}==2'b10)?{cout_10,out_10}:
				 	 ({s1,s0}==2'b11)?{cout_11,out_11}: 2'b00;
endmodule

