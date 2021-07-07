`include "ALU4bit.v";
module testbench;
//input
reg [3:0] A;
reg [3:0] B;
reg Cin, S1, S0, M;
reg t_clk, t_rst_n;
//output
wire [3:0] F;
wire Cout;
//tao xung clk
always begin
t_clk = 1'b0;
# 10;
t_clk = 1'b1;
# 10;
end
//instance define
ALU4bit test1(.a(A), .b(B), .cin(Cin), .s1(S1), .s0(S0), .m(M), .cout(Cout), .f(F), .clk(t_clk), .rst_n(t_rst_n));
//display the output
initial begin
$monitor("time=%d, clk=%b, rst_n=%b, a=%b, b=%b, cin=%b, s1=%b, s0=%b, m=%b, cout=%b, f=%b \n",
	   $time, t_clk, t_rst_n, A, B, Cin, S1, S0, M, Cout, F);
end
//declare testcase

initial begin
#1 t_rst_n = 0;
#10 t_rst_n = 1;
//case 1
#10 A = 4'b1111; B = 4'b1010; Cin = 0; S1 = 0; S0 = 0; M = 0;
//case 2
#10 A = 4'b1011; B = 4'b1010; Cin = 1; S1 = 0; S0 = 1; M = 0;
//case 3
#1 A = 4'b1111; B = 4'b1010; Cin = 0; S1 = 1; S0 = 0; M = 0;
//case 4
#10 A = 4'b1011; B = 4'b1010; Cin = 1; S1 = 1; S0 = 1; M = 0;
//case 5
#10 A = 4'b1011; B = 4'b1010; Cin = 0; S1 = 0; S0 = 0; M = 1;
//case 6
#10 A = 4'b1011; B = 4'b1010; Cin = 1; S1 = 0; S0 = 1; M = 1;
//case 7
#10 A = 4'b1011; B = 4'b1010; Cin = 0; S1 = 1; S0 = 0; M = 1;
//case 8
#10 A = 4'b1011; B = 4'b1010; Cin = 1; S1 = 1; S0 = 1; M = 1;
#100 $finish;
end

initial begin
 $vcdplusfile ("testALU.vpd");
 $vcdpluson();
end 

endmodule
