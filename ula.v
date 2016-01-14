module ULA (aULA, bULA, selectULA, outputULA, statusULA);
  input wire signed [27:0] aULA;
  input wire signed [27:0] bULA;
  input wire [3:0] selectULA;
  output reg signed [27:0] outputULA;
  output reg statusULA;

  parameter
    ADD = 4'b0000,
    SUB = 4'b0001,
    COMP = 4'b0010,
    IGUAL = 4'b0011,
    MAIOR = 4'b0100,
    MENOR = 4'b0101,
    AND = 4'b0110,
    OR = 4'b0111,
    MULT = 4'b1000,
    DIV = 4'b1001;

  always @(*) begin
    case(selectULA)
      ADD: outputULA <= aULA + bULA;
      SUB: outputULA <= bULA - aULA;
      COMP: outputULA <= (~bULA) + 27'd1;
      IGUAL: statusULA <= aULA == bULA;
      MAIOR: begin
        statusULA <= aULA > bULA;
        outputULA <= statusULA ? aULA : bULA;
      end
      MENOR: begin
        statusULA <= aULA < bULA;
        outputULA <= statusULA ? aULA : bULA;
      end
      AND: outputULA <= aULA & bULA;
      OR: outputULA <= aULA | bULA;
      MULT: outputULA <= aULA * bULA;
      DIV: outputULA <= bULA / aULA;
    endcase
  end
endmodule
