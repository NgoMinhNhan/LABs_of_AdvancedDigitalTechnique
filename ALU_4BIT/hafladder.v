module halfadder(a,b,cout,s);
input a,b;
output cout,s;
assign s=a^b;
assign cout=a&b;
endmodule

