
module t_full_adder ;
reg [3:0]a;
reg [3:0]b;
reg cin ;
wire cout;
wire [3:0]s;

parameter time_out = 100;
bocong  U1 (a,b,cin,cout,s);
initial $monitor($time," %b + %b + %b = %b , %b", a , b , cin  , cout , s );
/*initial #time_out $finish;*/
initial
begin 
#5 a = 4'b0101;
b = 4'b0000;
cin=0;
#20 a = 4'b0101;
b = 4'b0001;
cin=0;
#20 a = 4'b1101;
b = 4'b1001;
cin=0;
#300 $finish;
 end
endmodule