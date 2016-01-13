module Controler(comandControler, tULAControler, tXControler, tYControler, tZControler);
  input wire [3:0] comandControler;
  output reg [2:0] tULAControler;
  output reg [2:0] tXControler;
  output reg [2:0] tYControler;
  output reg [2:0] tZControler;

  parameter
    CLR = 4'b0000,
    CLRLD = 4'b0001,
    LOADX = 4'b0010,
    ADD = 4'b0011,
    SUB = 4'b0100,
    MULT = 4'b0101,
    DIV = 4'b0110,
    MIN = 4'b0111,
    MAX = 4'b1000,
    DISP = 4'b1001;

  parameter
    uADD = 3'b000,
    uSUB = 3'b001,
    uCOMP = 3'b010,
    uIGUAL = 3'b011,
    uMAIOR = 3'b100,
    uMENOR = 3'b101,
    uAND = 3'b110,
    uOR = 3'b111;

  parameter
		rHOLD = 3'b000,
		rRESET = 3'b001,
		rLOAD = 3'b010,
		rShiftLeft = 3'b011,
		rShiftRight = 3'b100;

  always @(*) begin
    case(comandControler)
      CLR: begin
        tULAControler <= uADD;
        tXControler <= rRESET;
        tYControler <= rRESET;
        tZControler <= rRESET;
      end
      CLRLD: begin
        tULAControler <= uADD;
        tXControler <= rLOAD;
        tYControler <= rRESET;
        tZControler <= rRESET;
      end
      LOADX: begin
        tULAControler <= uADD;
        tXControler <= rLOAD;
        tYControler <= rHOLD;
        tZControler <= rHOLD;
      end
      ADD: begin
        tULAControler <= uADD;
        tXControler <= rLOAD;
        tYControler <= rLOAD;
        tZControler <= rHOLD;
      end
      SUB: begin
        tULAControler <= uSUB;
        tXControler <= rLOAD;
        tYControler <= rLOAD;
        tZControler <= rHOLD;
      end
      MULT: begin
        tULAControler <= uADD;
        tXControler <= rLOAD;
        tYControler <= rShiftLeft;
        tZControler <= rHOLD;
      end
      DIV: begin
        tULAControler <= uADD;
        tXControler <= rLOAD;
        tYControler <= rShiftRight;
        tZControler <= rHOLD;
      end
      MIN: begin
        tULAControler <= uMENOR;
        tXControler <= rLOAD;
        tYControler <= rLOAD;
        tZControler <= rHOLD;
      end
      MAX: begin
        tULAControler <= uMAIOR;
        tXControler <= rLOAD;
        tYControler <= rLOAD;
        tZControler <= rHOLD;
      end
      DISP: begin
        tULAControler <= uADD;
        tXControler <= rHOLD;
        tYControler <= rHOLD;
        tZControler <= rLOAD;
      end
    endcase
  end
endmodule
