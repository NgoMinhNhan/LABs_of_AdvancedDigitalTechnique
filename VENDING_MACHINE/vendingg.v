module maybanhang(c1, c2 , c5 ,si , wi, clk , rst , tratien , r1 ,r2 , r5, so , wo ,hientai , ketiep   );
input c1,c2,c5;  
input si , wi;           // 2 nut chon do uong 
input  tratien ;        // nut nhan tra tien 
input clk , rst ;  
output   so , wo ;
output [6:0]hientai,ketiep;
output r1,r2,r5 ;   reg [3:0]r1; reg [3:0]r2; reg [3:0]r5;
reg [3:0] wo ; // nuoc ra  
reg [3:0] so ; // soda ra 
reg [6:0]hientai;    // trang thai hien tai 
reg [6:0]ketiep;    // trang thai ke tiep
assign wo=4'b0000; assign so=4'b0000;
//assign r1=4'b0000;assign r2=4'b0000; assign r5=4'b0000;
// 7 bit 3 bit dau the hien trang thai 
// 00 trang thai ban dau 01 trang thai nhan tien 10 trang thai tra ra nuoc hoac soda  11 trang thai tra tien du 
// 010 tran thai nhan tien 011 trang thai nhan tien tra ra tien du 
// 100 trang thai tra ra nuoc 
// 101 trang thai tra ra soda
always @ (posedge clk or posedge rst )
            begin
                if(rst)
                   hientai<=7'b0000000;
                else
                   hientai<=ketiep;                   
            end 
always @(negedge clk)           
           begin           
                case (hientai)
        7'b000000:                  // trang thai ban dau
                  if (c1==0)
                             ketiep<=7'b0100001;  // tong tien nhan là 1
                        else if (c2==0) 
                             ketiep<=7'b0100010;  // tong tien nhan la 2 
                        else if (c5==0)
                             ketiep<=7'b0100101;  // tong tien nhan la 5 
        7'b0100001 :           // trang thái tong tien nhan là 1                  
                  if (c1==0)
                             ketiep<=7'b0100010;  // tong tien nhan là 2
                        else if (c2==0)
                             ketiep<=7'b0100011;  // tong tien nhan la 3
                        else if (c5==0)
                             ketiep<=7'b0100110;  // tong tien nhan la 6 
                        else if (tratien==0)
                             ketiep<=7'b1100001;  // tra 1 xu    
            7'b0100010 :    // trang thái tong tien nhan là 2 
                   if (c1==0)
                             ketiep<=7'b0100011;  // tong tien nhan là  3
                        else if (c2==0)
                             ketiep<=7'b0100100;  // tong tien nhan la 4
                        else if (c5==0)
                             ketiep<=7'b0100111;  // tong tien nhan la 7
                        else if (tratien==0)
                             ketiep<=7'b1100010;  // tra 2 xu 
            7'b0100011 :   // trang thái tong tien nhan là 3
                     if (c1==0)
                             ketiep<=7'b0100100;  // tong tien nhan là  4
                         else if (c2==0)
                             ketiep<=7'b0100101;  // tong tien nhan la 5
                        else if (c5==0)
                             ketiep<=7'b0101000;  // tong tien nhan la 8
                         else if (tratien==0)
                             ketiep<=7'b1100011;  // tra 3 xu 
            7'b0100100 :   // trang thái tong tien nhan là 4
                       if (c1==0)
                             ketiep<=7'b0100101;  // tong tien nhan là  5
                        else if (c2==0)
                             ketiep<=7'b0100110;  // tong tien nhan la 6
                        else if (c5==0)
                             ketiep<=7'b0101001;  // tong tien nhan la 9
            else if (tratien==0)
                             ketiep<=7'b1100100;  // tra 4 xu 
        7'b0100101 :   // trang thái tong tien nhan là 5
                     if (c1==0)
                             ketiep<=7'b0100110;  // tong tien nhan là  6
                        else if (c2==0)
                             ketiep<=7'b0100111;  // tong tien nhan la 7
                        else if (c5==0)
                             ketiep<=7'b0110001;  // tong tien nhan la 5 thoi lai 5 xu 
                        else if (tratien==0)
                             ketiep<=7'b1100101;  // tra 5 xu 
     7'b0100110 :   // trang thái tong tien nhan là 6
                     if (c1==0)
                             ketiep<=7'b0100111;  // tong tien nhan là  7
                        else if (c2==0)
                             ketiep<=7'b0101000;  // tong tien nhan la 8
                        else if (c5==0)
                             ketiep<=7'b0110010;  // tong tien nhan la 6 thoi lai 5 xu 
                        else if (tratien==0)
                             ketiep<=7'b1100110;  // tra 6 xu 
     7'b0100111 :   // trang thái tong tien nhan là 7
                     if (c1==0)
                             ketiep<=7'b0101000;  // tong tien nhan là  8
                        else if (c2==0)
                             ketiep<=7'b0101001;  // tong tien nhan la 9
                        else if (c5==0)
                             ketiep<=7'b0110011;  // tong tien nhan la 7 thoi lai 5 xu 
                       else if (wi==0)
                             ketiep<=7'b1000000;  // chon mua nuoc  du 0 
                       else if (tratien==0)
                             ketiep<=7'b1100111;  // tra 7 xu 
        7'b0101000 :   // trang thái tong tien nhan là 8
                     if (c1==0)
                             ketiep<=7'b0101001;  // tong tien nhan là  9
                        else if (c2==0)
                             ketiep<=7'b0110100;  // tong tien nhan la 8 thoi lai 2 xu 
                        else if (c5==0)
                             ketiep<=7'b0110101;  // tong tien nhan la 8 thoi lai 5 xu 
                        else if (tratien==0)
                             ketiep<=7'b1101000;  // tra 8 xu 
                        else if (wi==0)
                             ketiep<=7'b1000001;  // chon mua nuoc du 1 
         7'b0101001 :   // trang thái tong tien nhan là 9
                     if (c1==0)
                             ketiep<=7'b0110110;  // tong tien nhan là 9 thoi lai 1 xu
                        else if (c2==0)
                             ketiep<=7'b0110111;  // tong tien nhan la 9 thoi lai 2 xu 
                        else if (c5==0)
                             ketiep<=7'b0111000;  // tong tien nhan la 9 thoi lai 5 xu 
                        else if (tratien==0)
                             ketiep<=7'b1101000;  // tra 8 xu 
                        else if (wi==0)
                             ketiep<=7'b1000001;  // chon mua nuoc du 1  
          7'b0110001:      // trang thai nhan 5 tra lai 5
                    if (c1==0)
                             ketiep<=7'b0100110;  // tong tien nhan là  6
                        else if (c2==0)
                             ketiep<=7'b0100111;  // tong tien nhan la 7
                        else if (c5==0)
                             ketiep<=7'b0110001;  // tong tien nhan la 5 thoi lai 5 xu 
                        else if (tratien==0)
                             ketiep<=7'b1100101;  // tra 5 xu 
            7'b0110010:      // trang thai nhan 6 tra lai 5
                   if (c1==0)
                             ketiep<=7'b0100111;  // tong tien nhan là  7
                        else if (c2==0)
                             ketiep<=7'b0101000;  // tong tien nhan la 8
                        else if (c5==0)
                             ketiep<=7'b0110010;  // tong tien nhan la 6 thoi lai 5 xu 
                        else if (tratien==0)
                             ketiep<=7'b1100110;  // tra 6 xu
           7'b0110011:      // trang thai nhan 7 tra lai 5
                   if (c1==0)
                             ketiep<=7'b0101000;  // tong tien nhan là  8
                        else if (c2==0)
                             ketiep<=7'b0101001;  // tong tien nhan la 9
                        else if (c5==0)
                             ketiep<=7'b0110011;  // tong tien nhan la 7 thoi lai 5 xu 
                       else if (wi==0)
                             ketiep<=7'b1000000;  // chon mua nuoc  du 0 
                       else if (tratien==0)
                             ketiep<=7'b1100111;  // tra 7 xu 
          7'b0110100:      // trang thai nhan 8 tra lai 2
                  if (c1==0)
                             ketiep<=7'b0101001;  // tong tien nhan là  9
                        else if (c2==0)
                             ketiep<=7'b0110100;  // tong tien nhan la 8 thoi lai 2 xu 
                        else if (c5==0)
                             ketiep<=7'b0110101;  // tong tien nhan la 8 thoi lai 5 xu 
                        else if (tratien==0)
                             ketiep<=7'b1101000;  // tra 8 xu 
                        else if (wi==0)
                             ketiep<=7'b1000001;  // chon mua nuoc du 1 
           7'b0110101:      // trang thai nhan 8 tra lai 5
               if (c1==0)
                             ketiep<=7'b0101001;  // tong tien nhan là  9
                        else if (c2==0)
                             ketiep<=7'b0110100;  // tong tien nhan la 8 thoi lai 2 xu 
                        else if (c5==0)
                             ketiep<=7'b0110101;  // tong tien nhan la 8 thoi lai 5 xu 
                        else if (tratien==0)
                             ketiep<=7'b1101000;  // tra 8 xu 
                        else if (wi==0)
                             ketiep<=7'b1000001;  // chon mua nuoc du 1 
            7'b0110110:      // trang thai nhan 9 tra lai 1
                  if (c1==0)
                             ketiep<=7'b0110110;  // tong tien nhan là 9 thoi lai 1 xu
                        else if (c2==0)
                             ketiep<=7'b0110111;  // tong tien nhan la 9 thoi lai 2 xu 
                        else if (c5==0)
                             ketiep<=7'b0111000;  // tong tien nhan la 9 thoi lai 5 xu 
                        else if (tratien==0)
                             ketiep<=7'b1101000;  // tra 8 xu 
                        else if (wi==0)
                             ketiep<=7'b1000001;  // chon mua nuoc du 1 
            7'b0110111:      // trang thai nhan 9 tra lai 2
                  if (c1==0)
                             ketiep<=7'b0110110;  // tong tien nhan là 9 thoi lai 1 xu
                        else if (c2==0)
                             ketiep<=7'b0110111;  // tong tien nhan la 9 thoi lai 2 xu 
                        else if (c5==0)
                             ketiep<=7'b0111000;  // tong tien nhan la 9 thoi lai 5 xu 
                        else if (tratien==0)
                             ketiep<=7'b1101000;  // tra 8 xu 
                        else if (wi==0)
                             ketiep<=7'b1000001;  // chon mua nuoc du 1 
            7'b0111000:      // trang thai nhan 9 tra lai 5
                 if (c1==0)
                             ketiep<=7'b0110110;  // tong tien nhan là 9 thoi lai 1 xu
                        else if (c2==0)
                             ketiep<=7'b0110111;  // tong tien nhan la 9 thoi lai 2 xu 
                        else if (c5==0)
                             ketiep<=7'b0111000;  // tong tien nhan la 9 thoi lai 5 xu 
                        else if (tratien==0)
                             ketiep<=7'b1101000;  // tra 8 xu 
                        else if (wi==0)
                             ketiep<=7'b1000001;  // chon mua nuoc du 1 
           7'b1000000:            // chon mua nuoc du 0 
                     if (c1==0) 
                             ketiep<=7'b0100001;  // tong tien nhan là 1 
                        else if (c2==0)
                             ketiep<=7'b0100010;  // tong tien nhan la 2 
                        else if (c5==0)
                             ketiep<=7'b0100101;  // tong tien nhan la 5 
                        else ketiep<=7'b0000000;  // trang thai ban d?u 
         7'b1000001:     // chon mua nuoc du 1 
                    if (c1==0) 
                             ketiep<=7'b0100010;  // tong tien nhan là 2 
                        else if (c2==0)
                             ketiep<=7'b0100011;  // tong tien nhan la 3
                        else if (c5==0)
                             ketiep<=7'b0100110;  // tong tien nhan la 6 
                        else if(tratien==1)
                            ketiep <= 7'b1100001;  // trang thai tra 1 xu 
        7'b1000010:     // chon mua nuoc du 2 
                    if (c1==0)
                             ketiep<=7'b0100011;  // tong tien nhan là 3 
                        else if (c2==0)
                             ketiep<=7'b0100100;  // tong tien nhan la 4
                        else if (c5==0)
                             ketiep<=7'b0100111;  // tong tien nhan la 7 
                        else if(tratien==1)
                            ketiep <= 7'b1100010;  // trang thai tra 2 xu 
          7'b1010000:     // chon mua soda du  0
                    if (c1==0)
                             ketiep<=7'b0100001;  // tong tien nhan là 1 
                        else if (c2==0)
                             ketiep<=7'b0100010;  // tong tien nhan la 2
                        else if (c5==0)
                             ketiep<=7'b0100101;  // tong tien nhan la 5 
                        else 
                            ketiep <= 7'b0000000;  // trang thai ban dau 
          
           7'b1100001:     //  tra  1 xu 
                            ketiep <= 7'b0000000;  // trang thai ban dau 
           7'b1100010:     //  tra  2 xu 
                            ketiep <= 7'b0000000;  // trang thai ban dau
           7'b1100011:     //  tra  3 xu 
                            ketiep <= 7'b0000000;  // trang thai ban dau
           7'b1100100:     //  tra  4 xu 
                            ketiep <= 7'b0000000;  // trang thai ban dau
           7'b1100101:     //  tra  5 xu 
                            ketiep <= 7'b0000000;  // trang thai ban dau 
           7'b1100110:     //  tra  6 xu 
                            ketiep <= 7'b0000000;  // trang thai ban dau
           7'b1100111:     //  tra  7 xu 
                            ketiep <= 7'b0000000;  // trang thai ban dau
           7'b1101000:     //  tra  8 xu 
                            ketiep <= 7'b0000000;  // trang thai ban dau
           7'b1101001:     //  tra  9 xu 
                            ketiep <= 7'b0000000;  // trang thai ban dau 
        
           default  ketiep <=7'b0000000; 
endcase 

end
always @(hientai)          
                case (hientai)
        7'b0000000: begin wo<=4'b0000 ; so<=4'b0000; r1<=4'b0000; r2<=4'b0000; r5<=4'b0000; end 
        // tra lai tien du 
        7'b0110001: begin wo<=4'b0000 ; so<=4'b0000; r1<=4'b0000; r2<=4'b0000; r5<=4'b0001; end 
        7'b0110010: begin wo<=4'b0000 ; so<=4'b0000; r1<=4'b0000; r2<=4'b0000; r5<=4'b0001; end 
        7'b0110011: begin wo<=4'b0000 ; so<=4'b0000; r1<=4'b0000; r2<=4'b0000; r5<=4'b0001; end 
        7'b0110100: begin wo<=4'b0000 ; so<=4'b0000; r1<=4'b0000; r2<=4'b0001; r5<=4'b0000; end 
        7'b0110101: begin wo<=4'b0000 ; so<=4'b0000; r1<=4'b0000; r2<=4'b0000; r5<=4'b0001; end 
        7'b0110110: begin wo<=4'b0000 ; so<=4'b0000; r1<=4'b0001; r2<=4'b0000; r5<=4'b0000; end 
        7'b0110111: begin wo<=4'b0000 ; so<=4'b0000; r1<=4'b0000; r2<=4'b0001; r5<=4'b0000; end 
        7'b0111000: begin wo<=4'b0000 ; so<=4'b0000; r1<=4'b0000; r2<=4'b0000; r5<=4'b0001; end
        // ban hang 
        7'b1000000: begin wo<=4'b0001 ; so<=4'b0000; r1<=4'b0000; r2<=4'b0000; r5<=4'b0000; end 
        7'b1000001: begin wo<=4'b0001 ; so<=4'b0000; r1<=4'b0000; r2<=4'b0000; r5<=4'b0000; end
        7'b1000010: begin wo<=4'b0001 ; so<=4'b0000; r1<=4'b0000; r2<=4'b0000; r5<=4'b0000; end
        7'b1010000: begin wo<=4'b0000 ; so<=4'b0001; r1<=4'b0000; r2<=4'b0000; r5<=4'b0000; end
        // tra lai tien 
        7'b1100001: begin wo<=4'b0000 ; so<=4'b0000; r1<=4'b0001; r2<=4'b0000; r5<=4'b0000; end
        7'b1100010: begin wo<=4'b0000 ; so<=4'b0000; r1<=4'b0000; r2<=4'b0001; r5<=4'b0000; end
        7'b1100011: begin wo<=4'b0000 ; so<=4'b0000; r1<=4'b0001; r2<=4'b0001; r5<=4'b0000; end
        7'b1100100: begin wo<=4'b0000 ; so<=4'b0000; r1<=4'b0000; r2<=4'b0010; r5<=4'b0000; end
        7'b1100101: begin wo<=4'b0000 ; so<=4'b0000; r1<=4'b0000; r2<=4'b0000; r5<=4'b0001; end
        7'b1100110: begin wo<=4'b0000 ; so<=4'b0000; r1<=4'b0001; r2<=4'b0000; r5<=4'b0001; end 
        7'b1100111: begin wo<=4'b0000 ; so<=4'b0000; r1<=4'b0000; r2<=4'b0001; r5<=4'b0001; end
        7'b1101000: begin wo<=4'b0000 ; so<=4'b0000; r1<=4'b0001; r2<=4'b0001; r5<=4'b0001; end
        7'b1101001: begin wo<=4'b0000 ; so<=4'b0000; r1<=4'b0000; r2<=4'b0010; r5<=4'b0001; end  
        default  begin wo<=4'b0000 ; so<=4'b0000; r1<=4'b0000; r2<=4'b0000; r5<=4'b0000; end
endcase 
   



endmodule 
