module Memory(addressMemory, comandMemory, dataMemory);
  input wire [3:0] addressMemory;
  output reg [3:0] comandMemory;
  output reg [3:0] dataMemory;

  reg [3:0] memMemory [0:1] [0:14];

  initial begin
    //comand////////////////// //data////////////////////
    memMemory[0][0] = 4'b0000; memMemory[1][0] = 4'b0000;
    memMemory[0][1] = 4'b0001; memMemory[1][1] = 4'b0011;
    memMemory[0][2] = 4'b0001; memMemory[1][2] = 4'b0011;
    memMemory[0][3] = 4'b0001; memMemory[1][3] = 4'b0011;
    memMemory[0][4] = 4'b0001; memMemory[1][4] = 4'b0011;
    memMemory[0][5] = 4'b0001; memMemory[1][5] = 4'b0011;
    memMemory[0][6] = 4'b0001; memMemory[1][6] = 4'b0011;
    memMemory[0][7] = 4'b0001; memMemory[1][7] = 4'b0011;
  end

  always @(*) begin
    comandMemory = memMemory[0][addressMemory];
    dataMemory = memMemory[1][addressMemory];
  end
endmodule
