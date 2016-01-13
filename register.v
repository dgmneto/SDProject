module Register(inputRegister, comandRegister, clockRegister, valueRegister);
	input wire [3:0] inputRegister;
	input wire [2:0] comandRegister;
	input wire clockRegister;
	output reg [3:0] valueRegister;

	parameter
		HOLD = 3'b000,
		RESET = 3'b001,
		LOAD = 3'b010,
		ShiftLeft = 3'b011,
		ShiftRight = 3'b100;

	always  @ (negedge clockRegister) begin
		case(comandRegister)
			HOLD: valueRegister = valueRegister;
			RESET: valueRegister = 4'b0000;
			LOAD: valueRegister = inputRegister;
			ShiftLeft: valueRegister = valueRegister << 1;
			ShiftRight: valueRegister = valueRegister >> 1;
		endcase
	end
endmodule
