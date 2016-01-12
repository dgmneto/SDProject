module Counter(clockCounter, valueCounter);
  input wire clockCounter;
  output reg [3:0] valueCounter;

  reg finishedCounter;

  initial begin
    valueCounter = 4'b0000;
    finishedCounter = 0;
  end

  always @(negedge clockCounter) begin
    if(finishedCounter == 0) begin
      if(valueCounter != 4'b1111) begin
        valueCounter = valueCounter + 4'b0001;
      end
      else begin
        finishedCounter = 1;
      end
    end
  end
endmodule
