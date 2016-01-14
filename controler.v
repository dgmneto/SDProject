module Controler(comandControler, tULAControler, tXControler, tYControler, tZControler);
  input wire [3:0] comandControler;
  output reg [3:0] tULAControler;
  output reg [2:0] tXControler;
  output reg [2:0] tYControler;
  output reg [2:0] tZControler;

  parameter
    CLR   = 4'b0000,
    CLRLD = 4'b0001,
    LOADX = 4'b0010,
    ADD   = 4'b0011,
    SUB   = 4'b0100,
    MULT  = 4'b0101,
    DIV   = 4'b0110,
    MIN   = 4'b0111,
    MAX   = 4'b1000,
    DISP  = 4'b1001,
    END   = 4'b1010;

  parameter
    uADD    = 4'b0000,
    uSUB    = 4'b0001,
    uCOMP   = 4'b0010,
    uIGUAL  = 4'b0011,
    uMAIOR  = 4'b0100,
    uMENOR  = 4'b0101,
    uAND    = 4'b0110,
    uOR     = 4'b0111,
    uMULT   = 4'b1000,
    uDIV    = 4'b1001;

  parameter
		rHOLD       = 3'b000,
		rRESET      = 3'b001,
		rLOAD       = 3'b010,
		rShiftLeft  = 3'b011,
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
        tULAControler <= uMULT;
        tXControler <= rLOAD;
        tYControler <= rLOAD;
        tZControler <= rHOLD;
      end
      DIV: begin
        tULAControler <= uDIV;
        tXControler <= rLOAD;
        tYControler <= rLOAD;
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
      END: begin
        tULAControler <= uADD;
        tXControler <= rRESET;
        tYControler <= rRESET;
        tZControler <= rHOLD;
      end
    endcase
  end
endmodule
