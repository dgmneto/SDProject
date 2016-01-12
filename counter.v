module Counter(clockCounter, addressCounter);
  input wire clockCounter;
  output reg [3:0] addressCounter;

  reg finishedCounter;

  initial begin
    addressCounter = 4'b0000;
    finishedCounter = 0;
  end

  always @(negedge clockCounter) begin
    if(finishedCounter == 0) begin
      if(addressCounter != 4'b1111) begin
        addressCounter = addressCounter + 4'b0001;
      end
      else begin
        finishedCounter = 1;
      end
    end
  end
endmodule
