`include "ALU.v";
module ALU4bit(a,b,cin,s1,s0,m,cout,f, clk, rst_n);
input [3:0] a;
input [3:0] b;
input cin, s1, s0, m;
input clk, rst_n;

output reg [3:0] f;
output  reg cout;

wire [2:0] cout_tmp;
wire [3:0] f_tmp;
wire cout_tmp1;

ALU1bit A1(.A(a[0]),.B(b[0]),.Cin(cin),.S1(s1),.S0(s0),.M(m),.Cout(cout_tmp[0]),.F(f_tmp[0]));
ALU1bit A2(.A(a[1]),.B(b[1]),.Cin(cout_tmp[0]),.S1(s1),.S0(s0),.M(m),.Cout(cout_tmp[1]),.F(f_tmp[1]));
ALU1bit A3(.A(a[2]),.B(b[2]),.Cin(cout_tmp[1]),.S1(s1),.S0(s0),.M(m),.Cout(cout_tmp[2]),.F(f_tmp[2]));
ALU1bit A4(.A(a[3]),.B(b[3]),.Cin(cout_tmp[2]),.S1(s1),.S0(s0),.M(m),.Cout(cout_tmp1),.F(f_tmp[3]));

always @(posedge clk or negedge rst_n) begin
   if (!rst_n) begin
      f <= 4'b0;
      cout <=  1'b0;
   end else begin
      f <= f_tmp;
       cout <= cout_tmp1;
   end
end
endmodule
