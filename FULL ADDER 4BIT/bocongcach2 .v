module bocong( a,b, cin , cout , s);
input [3:0]a;
input [3:0]b;
input cin;
output cout;
output [3:0]s;
wire [3:0]a;
wire [3:0]b;
wire cin;
wire c0,c1,c2;
wire [3:0]s;
begin 
cong cong01(a[0], b[0], cin, c0, s[0]);
cong cong02(a[1], b[1], c0, c1, s[1]);
cong cong03(a[2], b[2], c1, c2, s[2]);
cong cong04(a[3], b[3], c2, cout , s[3]);
end 
endmodule
module cong (a, b, cin, cout, s);
input a , b , cin;
output s , cout;
wire a,b,cin;
reg cout,s  ;
always @( a or b or cin )
begin 
if(a==0&& b==0 && cin==0)
   begin 
   /*assign*/ cout= 0 ; /*assign*/ s=0;
   end 
else if(a==0&& b==0 && cin==1)
   begin 
    /*assign cout*/cout  = 0 ; /*assign*/ s=1;
   end 
else if(a==0&& b==1 && cin==0)
   begin 
    /*assign*/ cout = 0 ; /*assign*/ s=1;
   end
else if(a==0&& b==1 && cin==1)
   begin 
    /*assign*/ cout = 1 ;/*assign*/  s=0;
   end 
else if(a==1&& b==0 && cin==0)
   begin 
    /*assign*/ cout = 0 ; /*assign*/ s=1;
   end 
else if(a==1&& b==0 && cin==1)
   begin 
    /*assign*/ cout = 1 ; /*assign*/ s=0;
   end 
else if(a==1&& b==1 && cin==0)
   begin 
    /*assign*/ cout = 1 ; /*assign*/ s=0;
   end 
if(a==1&& b==1 && cin==1)
   begin 
    /*assign*/ cout = 1 ; /*assign*/ s=1;
   end 
end
endmodule