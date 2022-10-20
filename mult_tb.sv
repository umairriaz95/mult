`timescale 1ns / 1ps

module tb();
reg clk, rst_n;
reg [7:0] in_1;
reg [7:0] in_2;
wire [7:0] prod;
// ------

always #10 clk = ~clk;

mult_8x8 u0 ( .clk(clk), .rst_n(rst_n), .in_1(in_1), .in_2(in_2), .prod(prod));
initial begin
  clk <= 1'b0;
  rst_n <= 1'b0;
  in_1 <= 8'd0;
  in_2 <= 8'd0;
  repeat (2) @ (posedge clk);
  rst_n <= 1'b1;
  in_1 <= 8'd5;
  in_2 <= 8'd4;
  repeat (2) @ (posedge clk);
  in_1 <= 8'd3;
  in_2 <= 8'd6;
  repeat (2) @ (posedge clk);
  in_1 <= 8'd24;
  in_2 <= 8'd56;
  repeat (2) @ (posedge clk);
  in_1 <= 8'd100;
  in_2 <= 8'd200;

  // Wait for sometime before quitti
  #100 $finish;
end

endmodule
