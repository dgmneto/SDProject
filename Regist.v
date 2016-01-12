module REGIST(valor,entrada,funcao,clock);
	input wire [3:0] entrada;
	input wire [2:0] funcao;
	input wire clock;
	output reg [3:0] valor;

	parameter
		HOLD= 3'b000,
		RESET= 3'b001,
		LOAD= 3'b010,
		ShiftLeft= 3'b011,
		ShiftRight= 3'b100;

	always  @ (posedge clock)
	begin
		case(funcao)
			HOLD:valor=valor;
			RESET:valor=4'b0000;
			LOAD:valor=entrada;
			ShiftLeft:valor=valor<<1;
			ShiftRight:valor=valor>>1;
		endcase
	end
endmodule
