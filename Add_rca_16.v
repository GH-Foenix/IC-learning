module test_Add_rca_16();
  wire c_out,sum;
  reg  [15:0]a,b;
  reg  c_in;
  always a=16'hab;
  always b=16'hbd;
  Add_rca_16 M1(c_out,sum,a,b,c_in);
  initial begin
    #100 $finish;
  end
  initial begin
     
   end
  endmodule

module Add_rca_16 (output c_out,output [15:0]sum,input [15:0]a,b,input c_in);
wire c_in4,c_in8,c_in12;

Add_rca_4 M1 (c_in4,sum[3:0],a[3:0],b[3:0],c_in);
Add_rca_4 M2 (c_in8,sum[7:4],a[7:4],b[7:4],c_in4);
Add_rca_4 M3 (c_in12,sum[11:8],a[11:8],b[11:8],c_in8);
Add_rca_4 M4 (c_outsum,sum[15:12],a[15:12],b[15:12],c_in12);
endmodule

module Add_rca_4 (output c_out,output [3:0]sum,input [3:0]a,b,input c_in);
wire c_in2,c_in3,c_in4;
Add_full M1 (c_in2,sum[0],a[0],b[0],c_in);
Add_full M2 (c_in3,sum[1],a[1],b[1],c_in2);
Add_full M3 (c_in4,sum[2],a[2],b[2],c_in3);
Add_full M4 (c_out,sum[3],a[3],b[3],c_in4);
endmodule

module Add_full (output c_out,sum,input a,b,c_in);
wire w1,w2,w3;
Add_half M1 (w2,w1,a,b);
Add_half M2 (w3,sum,c_in,w1);
or M3 (c_out,w2,w3);
endmodule

module Add_half (output c_out,sum,input a,b);
xor M1 (sum,a,b);
and M2 (c_out,a,b);
endmodule
