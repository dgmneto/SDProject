module Memory(addressMemory, clockMemory, comandMemory, dataMemory);
  input wire [3:0] addressMemory;
  input wire clockMemory;
  output reg [3:0] comandMemory;
  output reg signed [27:0] dataMemory;

  reg [3:0] comandsMemory [0:14];
  reg signed [27:0] datasMemory [0:14];
  reg [3:0] memSizeMemory;

  initial begin
    memSizeMemory = 5;
    //comand////////////////// //data////////////////////
    comandsMemory[0] = 4'b0001; datasMemory[0] = 27'd350;
    comandsMemory[1] = 4'b0011; datasMemory[1] = -27'd915;
    comandsMemory[2] = 4'b0011; datasMemory[2] = 27'd2;
    comandsMemory[3] = 4'b0110; datasMemory[3] = 27'd0;
    comandsMemory[4] = 4'b1001; datasMemory[4] = 27'd0;
  end

  always @(posedge clockMemory) begin
    if (addressMemory < memSizeMemory) begin
      comandMemory <= comandsMemory[addressMemory];
      dataMemory <= datasMemory[addressMemory];
    end
    else begin
      comandMemory <= 4'b1010;
      dataMemory <= 27'd0;
    end
  end
endmodule
