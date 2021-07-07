module testtong2 ;
//reg [3:0]a;
//reg [3:0]b;
reg c1;
reg c2;
reg c5;
wire [3:0]r1 ;
wire [3:0]r2;
wire [3:0]r5;
wire [3:0]so ;
wire [3:0]wo ;
wire [6:0]hientai,ketiep;
reg  wi , si,clk , rst   , tratien;
assign wi = 0; 
assign si=0; 
assign tratien=0;
//assign r1 =0; assign r2 =0; assign r5 =0;

parameter time_out = 100;
maybanhang  U78 (c1, c2 , c5 ,si , wi, clk , rst , tratien , r1 ,r2 , r5, so , wo ,hientai , ketiep  );
initial $monitor($time," soda %b , nuoc %b ,coin 1 %b ,coin 2 %b ,coin 5 %b , %b , %b ", so,wo,r1,r2,r5,hientai , ketiep );
/*initial #time_out $finish;*/
initial begin
	clk = 0;
end

// -- Generate Clock
always #5 clk = ~clk;

initial
begin 
// test 1 
#0 tratien =1;
#10 c1=1; c2=1; c5 = 1; si= 1 ; wi=1 ;rst = 1 ; tratien =1;
#10 c1=1; c2=1; c5 = 0; si= 1 ; wi=1 ;rst = 0 ; tratien =1; // 5 xu 
#10 c1=1; c2=1; c5 = 0; si= 1 ; wi=1 ;rst = 0 ; tratien =1;  // 5 xu 
#10 c1=1; c2=0; c5 = 1; si= 1 ; wi=1 ;rst = 0 ; tratien =1;   // 2 xu 
#10 c1=0; c2=1;c5=1;    si= 1 ; wi=1 ;rst = 0 ; tratien =1;  // 1 xu 
//#10  c1=1;c2=0; c5=1;   si= 1 ; wi=1 ;rst = 0 ; tratien =1;
#10 c1=1; c2=1;c5=1;    si= 1 ;wi=0  ;rst = 0 ; tratien =1;  // chon nuoc
#10 c1 =1;  c2=1; c5=1;   si= 1 ; wi=1 ;rst = 0 ; tratien=0;  // tra tien 
#10 c1 =1;  c2=1; c5=1;   si= 1 ; wi=1 ;rst = 0 ; tratien=1;

//#10 rst=1;
/*#5 c1=4'b0001;
#5 c5=4'b0001; c2=4'b0001; 
#5 c5=4'b0001;
#5 wi=1;
#5 tratien=1;*/



#300 $finish;
 end
endmodule
