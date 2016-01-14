module Counter(clockCounter, addressCounter);
  input wire clockCounter;
  output reg [3:0] addressCounter;

  reg finishedCounter;
  reg firstStepCounter;

  initial begin
    addressCounter = 4'b0000;
    finishedCounter = 0;
    firstStepCounter = 1;
  end

  always @(negedge clockCounter) begin
    if(finishedCounter == 0) begin
      if(addressCounter == 4'b1111) begin
        finishedCounter <= 1;
      end
      else if(firstStepCounter == 1)begin
        firstStepCounter = 0;
      end
      else begin
        addressCounter <= (addressCounter + 4'b0001);
      end
    end
  end
endmodule
