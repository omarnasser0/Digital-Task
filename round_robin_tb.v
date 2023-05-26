module fixed_priority_arbiter;
  reg clk;
  reg rst;
  reg [3:0] req;
  wire [3:0] grant;
  
  round_robin DUT(.clk(clk), .rst(rst), .req(req), .grant(grant));
  
  always #5 clk = ~clk;
  initial begin
    clk=0;
    rst=0;
    req=4'b0;
    #5 rst = 1;
    
    @(negedge clk) req= 4'b1111;
    @(negedge clk) req= 4'b1111;
    @(negedge clk) req= 4'b1111;
    @(negedge clk) req= 4'b1111;
    @(negedge clk) req= 4'b1111;
    @(negedge clk) req= 4'b0001;
    @(negedge clk) req= 4'b0001;
    @(negedge clk) req= 4'b0100;
    @(negedge clk) req= 4'b0100;
    @(negedge clk) req= 4'b1010;
    @(negedge clk) req= 4'b1010;
    @(negedge clk) req= 4'b0111;
    @(negedge clk) req= 4'b0111;
    @(negedge clk) req= 4'b1010;
    @(negedge clk) req= 4'b1010;
    @(negedge clk) req= 4'b0100;
    @(negedge clk) req= 4'b0100;
    #5 rst = 0;
    #100 $finish;
  end
  
  initial begin
    $dumpfile("dump.vcd");
    $dumpvars();
  end
  endmodule