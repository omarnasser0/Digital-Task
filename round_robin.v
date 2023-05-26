module round_robin(clk,rst,req,grant);

   output [3:0] grant;
   reg   grant;
   input  clk;
   input  rst;
   input [3:0]  req;

   reg [2:0]  state;
   reg [2:0]  next_state;
   parameter [2:0] s_ideal=3'b000;
   parameter [2:0] s0=3'b001;
   parameter [2:0] s1=3'b010;
   parameter [2:0] s2=3'b011;
   parameter [2:0] s3=3'b100;

  always @(posedge clk or negedge rst)
     begin
       if(!rst)
   state<=s_ideal;
 else
   state<=next_state;
     end


  always @(*)
     begin
 case (state)
   s_ideal:
     begin 
     if(req[0])
       begin
         next_state=s0;
       end
     else if(req[1])
       begin
         next_state=s1;
       end
     else if(req[2])
       begin
         next_state=s2;
       end
     else if(req[3])
       begin
         next_state=s3;
       end
     else
       begin
         next_state=s_ideal;
       end
   end
   
   s0:
    begin
     if (req[1])
       begin
         next_state=s1;
      end
     else if (req[2])
      begin
         next_state=s2;
      end
    else if (req[3])
      begin
         next_state=s3;
      end
      else if(req[0])
      begin
         next_state=s0;
      end
      else
        begin
    next_state=s_ideal;
        end 
   end 

   s1:
        begin
    if (req[2])
      begin
         next_state=s2;
      end
    else if (req[3])
      begin
         next_state=s3;
      end
    else if (req[0])
      begin
         next_state=s0;
      end
    else if (req[1])
      begin
         next_state=s1;
      end
    else
      begin
         next_state=s_ideal;
      end
     end 
   
     s2:
     begin
     if (req[3])
      begin
         next_state=s3;
      end
    else if (req[0])
      begin
         next_state=s0;
      end
    else if (req[1])
      begin
         next_state=s1;
      end
          else if (req[2])
      begin
         next_state=s2;
      end
    else
      begin
         next_state=s_ideal;
      end
        end 
   
     s3:
        begin
    if (req[0])
      begin
         next_state=s0;
      end
    else if (req[1])
      begin
         next_state=s1;
      end
    else if (req[2])
      begin
         next_state=s2;
      end
          else if (req[3])
      begin
         next_state=s3;
      end
    else
      begin
         next_state=s_ideal;
      end
        end
      
   
   default:
     begin
        if (req[0])
   begin
      next_state=s0;
   end
        else if (req[1])
   begin
      next_state=s1;
   end
        else if (req[2])
   begin
      next_state=s2;
   end
        else if (req[3])
   begin
      next_state=s3;
   end
        else
   begin
      next_state=s_ideal;
   end
     end 
 endcase 
     end    


  always @(*)
  begin
     case (state)
       s0:begin grant=4'b0001; end
       s1:begin grant=4'b0010; end
       s2:begin grant=4'b0100; end
       s3:begin grant=4'b1000; end
       default:begin grant=4'b0000; end
     endcase
  end
 endmodule