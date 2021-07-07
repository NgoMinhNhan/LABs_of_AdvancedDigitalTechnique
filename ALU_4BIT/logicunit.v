module logic_unit(s1,s0,a,b,f);
input s1,s0,a,b;
output f;
assign f=({s1,s0}==2'b00)?a&b:
         ({s1,s0}==2'b01)?a|b:
         ({s1,s0}==2'b10)?a^b:
         ({s1,s0}==2'b11)?~(a^b):1'b0;
endmodule
