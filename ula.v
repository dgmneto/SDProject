module ULA (aULA, bULA, selectULA, output0ULA, statusULA);
  input wire [3:0] aULA;
  input wire [3:0] bULA;
  input wire [2:0] selectULA;
  output reg [3:0] output0ULA;
  output reg statusULA;

  parameter
    ADD = 3'b000,
    SUB = 3'b001,
    COMP = 3'b010,
    IGUAL = 3'b011,
    MAIOR = 3'b100,
    MENOR = 3'b101,
    AND = 3'b110,
    OR = 3'b111;

  always @(*)
  begin
    case(selectULA)
      ADD: output0ULA = aULA + bULA;
      SUB: output0ULA = aULA - bULA;
      COMP: output0ULA = (~bULA) + 4'b0001;
      IGUAL: statusULA = aULA == bULA;
      MAIOR: begin
        statusULA = aULA > bULA;
        output0ULA = statusULA ? aULA : bULA;
      end
      MENOR: begin
        statusULA = aULA < bULA;
        output0ULA = statusULA ? aULA : bULA;
      end
      AND: output0ULA = aULA & bULA;
      OR: output0ULA = aULA | bULA;
    endcase
  end
endmodule
