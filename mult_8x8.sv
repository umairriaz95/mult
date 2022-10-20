`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Engineer: Umair Riaz
// Design Name: Pipelined 8x8 Multiplier using two 4x4 multpliers
// Module Name: prac
// Description: Pipelined 8x8 Multiplier using two 4x4 multpliers
// Additional Comments:
//
//////////////////////////////////////////////////////////////////////////////////


module mult_8x8(
	input clk, rst_n,
	input  [7:0]  in_1,
	input  [7:0]  in_2,
	output [15:0] prod
);


	logic [3:0] in_1L;
	logic [3:0] in_1H;
	logic [3:0] in_2L;
	logic [3:0] in_2H;
	logic [7:0] prod_1;
	logic [7:0] prod_2;

	logic [7:0] par_prod1L;
	logic [7:0] par_prod1H;
	logic [7:0] par_prod1L_reg;
	logic [7:0] par_prod1H_reg;
	logic [7:0] par_prod2L_reg;
	logic [7:0] par_prod2H_reg;
	logic valid;
	logic valid_next;
	logic [3:0] m1_in1, m1_in2, m2_in1, m2_in2;

	enum logic [2:0] {IDLE, s0, s1, s2} currSt, nextSt;

	// assigning nibbles
	assign in_1L = in_1[3:0];
	assign in_1H = in_1[7:4];
	assign in_2L = in_2[3:0];
	assign in_2H = in_2[7:4];

	always_comb begin: Mult
		par_prod1L = m1_in1 * m1_in2;
		par_prod1H = m2_in1 * m2_in2;
	end

	always_ff@(posedge clk, negedge rst_n) begin : prod_fsm
		if (!rst_n) begin
			currSt <= 3'd0;
			valid <= 3'd0;
			par_prod1L_reg <= 8'd0;
			par_prod1H_reg <= 8'd0;
			par_prod2L_reg <= 8'd0;
			par_prod2H_reg <= 8'd0;
		end else begin
			currSt <= nextSt;
			valid <= valid_next;
			par_prod1L_reg <= par_prod1L;
			par_prod1H_reg <= par_prod1H;
			par_prod2L_reg <= par_prod1L_reg;
			par_prod2H_reg <= par_prod1H_reg;
		end
	end

	always_comb begin : next_state_logic
		nextSt     = currSt;
		valid_next = valid;
		case (currSt)
			IDLE: begin
				m1_in1 = in_1L;
				m1_in2 = in_2L;
				m2_in1 = in_1H;
				m2_in2 = in_2L;
				nextSt = s0;
				valid_next = 1'b0;
			end

			s0: begin
				m1_in1 = in_1L;
				m1_in2 = in_2H;
				m2_in1 = in_1H;
				m2_in2 = in_2H;
				nextSt = IDLE;
				valid_next = 1'b1;
			end
			default: valid_next = 1'b0;
		endcase
	end

	assign prod = (par_prod2L_reg + (par_prod2H_reg << 3'd4) + (par_prod1L_reg << 3'd4) + (par_prod1H_reg << 4'd8));


endmodule
