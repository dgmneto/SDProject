module Main(clockMain, resultMain);
  input wire clockMain;
  output signed [27:0] resultMain;

  wire [3:0] memoryToControlerComand;
  wire signed [27:0] memoryToXData;
  wire [3:0] controlerToULAT;
  wire [2:0] controlerToXT;
  wire [2:0] controlerToYT;
  wire [2:0] controlerToZT;
  wire signed [27:0] xToULAValue;
  wire signed [27:0] yToULAandZValue;
  wire signed [27:0] ULAToYValue;
  wire [3:0] counterToMemoryValue;

  wire status;

  Controler controler(.comandControler(memoryToControlerComand), .tULAControler(controlerToULAT), .tXControler(controlerToXT), .tYControler(controlerToYT), .tZControler(controlerToZT));
  Counter counter(.clockCounter(clockMain), .addressCounter(counterToMemoryValue));
  Memory memory(.addressMemory(counterToMemoryValue), .clockMemory(clockMain), .comandMemory(memoryToControlerComand), .dataMemory(memoryToXData));
  Register x(.inputRegister(memoryToXData), .comandRegister(controlerToXT), .clockRegister(clockMain), .valueRegister(xToULAValue));
  Register y(.inputRegister(ULAToYValue), .comandRegister(controlerToYT), .clockRegister(clockMain), .valueRegister(yToULAandZValue));
  Register z(.inputRegister(yToULAandZValue), .comandRegister(controlerToZT), .clockRegister(clockMain), .valueRegister(resultMain));
  ULA ula(.aULA(xToULAValue), .bULA(yToULAandZValue), .selectULA(controlerToULAT), .outputULA(ULAToYValue), .statusULA(status));
endmodule

module Tester(resultTester, clockTester);
  input wire signed [27:0] resultTester;
  output reg clockTester;

  initial begin
    clockTester = 0;
    $dumpfile("main.vcd");
    $dumpvars;
    #100
    $finish;
  end

  always begin
    #2 clockTester <= ~clockTester;
  end
endmodule

module principal;
  wire clock;
  wire signed [27:0] result;

  Main main(clock, result);
  Tester tester(result, clock);
endmodule
