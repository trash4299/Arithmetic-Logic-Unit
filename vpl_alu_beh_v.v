module vpl_alu_beh_v (operand_a,operand_b,func_sel,alu_result,alu_cout);
	input [3:0] operand_a,operand_b,func_sel;
	output reg [3:0] alu_result;
	output reg alu_cout;
	reg [4:0] sum,incr,diff,decr,shr;
	
	always @ (func_sel,operand_a,operand_b,sum,incr,diff,decr,shr)
	
	begin
	
		sum = {1'b0,operand_a} + {1'b0,operand_b} + func_sel[0];
		diff = {1'b0,operand_a} + {1'b0,!operand_b} + func_sel[0];
		incr = {1'b0,operand_a} + func_sel[0];
		decr = {1'b0,operand_a} + 5'b01111;
		shr = {operand_a[0],operand_a[3],operand_a[3],operand_a[2],operand_a[1]};
		
		if (func_sel == 4'b0000) alu_result = operand_a;
		else if (func_sel == 4'b0001) alu_result = incr[3:0];
		else if (func_sel == 4'b0010) alu_result = sum[3:0];
		else if (func_sel == 4'b0011) alu_result = sum[3:0];
		else if (func_sel == 4'b0100) alu_result = diff[3:0];
		else if (func_sel == 4'b0101) alu_result = diff[3:0];
		else if (func_sel == 4'b0110) alu_result = decr[3:0];
		else if (func_sel == 4'b0111) alu_result = operand_a;
		else if (func_sel == 4'b1000) alu_result = !operand_a;
		else if (func_sel == 4'b1001) alu_result = !operand_a;
		else if (func_sel == 4'b1010) alu_result = operand_a && operand_b;
		else if (func_sel == 4'b1011) alu_result = operand_a && operand_b;
		else if (func_sel == 4'b1100) alu_result = operand_a || operand_b;
		else if (func_sel == 4'b1110) alu_result = shr[3:0];
		else if (func_sel == 4'b1111) alu_result = shr[3:0];
		else alu_result = operand_a;
		
		if (func_sel == 4'b0001) alu_cout = incr[4];
		else if (func_sel == 4'b0010) alu_cout = sum[4];
		else if (func_sel == 4'b0011) alu_cout = sum[4];
		else if (func_sel == 4'b0100) alu_cout = diff[4];
		else if (func_sel == 4'b0101) alu_cout = diff[4];
		else if (func_sel == 4'b0110) alu_cout = decr[4];
		else if (func_sel == 4'b1110) alu_cout = shr[4];
		else if (func_sel == 4'b1111) alu_cout = shr[4];
		else alu_cout = 1'b0;
		
	end

endmodule 