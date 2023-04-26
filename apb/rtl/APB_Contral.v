
module APB_Contral( 
	pclk,
	hresetn,
	
	valid,
	haddr1,
	haddr2,
	hwdata1,
	hwdata2,
	hwritereg,
	psel_reg, 
	
	Prdata,
	
	hwrite,
	haddr,
	hwdata,
	
	Pwrite,
	Penable,
	//Pselx,
	Paddr,
	Pwdata,
	hrdata,
	hreadyout,
	psel_s6,
    psel_s5,
    psel_s4,
    psel_s3,
    psel_s2, 
    psel_s1,
    psel_s0
	);

input pclk,hresetn,valid,hwrite,hwritereg;
input [31:0] hwdata,haddr,haddr1,haddr2,hwdata1,hwdata2,Prdata;
input [6:0] psel_reg;
output reg Pwrite,Penable;
output reg hreadyout;  
output reg [31:0] Paddr,Pwdata,hrdata;
output psel_s6;
output psel_s5;
output psel_s4;
output psel_s3;
output psel_s2;
output psel_s1;
output psel_s0;
//////////////////////////////////////////////////////PARAMETERS

parameter ST_IDLE=3'b000;
parameter ST_WWAIT=3'b001;
parameter ST_READ= 3'b010;
parameter ST_WRITE=3'b011;
parameter ST_WRITEP=3'b100;
parameter ST_RENABLE=3'b101;
parameter ST_WENABLE=3'b110;
parameter ST_WENABLEP=3'b111;


//////////////////////////////////////////////////// PRESENT STATE LOGIC

reg [2:0] PRESENT_STATE,NEXT_STATE;

always @(posedge pclk or negedge hresetn)
 begin:PRESENT_STATE_LOGIC
  if (~hresetn)
    PRESENT_STATE<=ST_IDLE;
  else
    PRESENT_STATE<=NEXT_STATE;
 end


/////////////////////////////////////////////////////// NEXT STATE LOGIC

always @(PRESENT_STATE,valid,hwrite,hwritereg)
 begin:NEXT_STATE_LOGIC
  case (PRESENT_STATE)
    
 	ST_IDLE:begin
		 if (~valid)
		  NEXT_STATE=ST_IDLE;
		 else if (valid && hwrite)
		  NEXT_STATE=ST_WWAIT;
		 else 
		  NEXT_STATE=ST_READ;
		end    

	ST_WWAIT:begin
		 if (~valid)
		  NEXT_STATE=ST_WRITE;
		 else
		  NEXT_STATE=ST_WRITEP;
		end

	ST_READ: begin
		   NEXT_STATE=ST_RENABLE;
		 end

	ST_WRITE:begin
		  if (~valid)
		   NEXT_STATE=ST_WENABLE;
		  else
		   NEXT_STATE=ST_WENABLEP;
		 end

	ST_WRITEP:begin
		   NEXT_STATE=ST_WENABLEP;
		  end

	ST_RENABLE:begin
		     if (~valid)
		      NEXT_STATE=ST_IDLE;
		     else if (valid && hwrite)
		      NEXT_STATE=ST_WWAIT;
		     else
		      NEXT_STATE=ST_READ;
		   end

	ST_WENABLE:begin
		     if (~valid)
		      NEXT_STATE=ST_IDLE;
		     else if (valid && hwrite)
		      NEXT_STATE=ST_WWAIT;
		     else
		      NEXT_STATE=ST_READ;
		   end

	ST_WENABLEP:begin
		      if (~valid && hwritereg)
		       NEXT_STATE=ST_WRITE;
		      else if (valid && hwritereg)
		       NEXT_STATE=ST_WRITEP;
		      else
		       NEXT_STATE=ST_READ;
		    end

	default: begin
		   NEXT_STATE=ST_IDLE;
		  end
  endcase
 end


////////////////////////////////////////////////////////OUTPUT LOGIC:COMBINATIONAL

reg Penable_temp,Hreadyout_temp,Pwrite_temp;
reg [6:0] Pselx_temp;
reg [31:0] Paddr_temp, Pwdata_temp,prdata_temp;

always @(*)
 begin:OUTPUT_COMBINATIONAL_LOGIC
   case(PRESENT_STATE)
    
	ST_IDLE: begin
			  if (valid && ~hwrite) 
			   begin:IDLE_TO_READ
			        Paddr_temp=haddr;
				Pwrite_temp=hwrite;
				Pselx_temp=psel_reg;
				Penable_temp=0;
				Hreadyout_temp=0;
				prdata_temp=0;
			   end
			  
			  else if (valid && hwrite)
			   begin:IDLE_TO_WWAIT
			        Pselx_temp=0;
				Penable_temp=0;
				Hreadyout_temp=1;			   
			   end
			   
			  else
                            begin:IDLE_TO_IDLE
			        Pselx_temp=0;
				Penable_temp=0;
				Hreadyout_temp=1;	
			   end
		     end    

	ST_WWAIT:begin
	          if (~valid) 
			   begin:WAIT_TO_WRITE
			    Paddr_temp=haddr1;
				Pwrite_temp=1;
				Pselx_temp=psel_reg;
				Penable_temp=0;
				Pwdata_temp=hwdata;
				Hreadyout_temp=0;
			   end
			  
			  else 
			   begin:WAIT_TO_WRITEP
			    Paddr_temp=haddr1;
				Pwrite_temp=1;
				Pselx_temp=psel_reg;
				Pwdata_temp=hwdata;
				Penable_temp=0;
				Hreadyout_temp=0;		   
			   end
			   
		     end  

	ST_READ: begin:READ_TO_RENABLE
			  Penable_temp=1;
			  Hreadyout_temp=1;
			  prdata_temp=Prdata;
		     end

	ST_WRITE:begin
              if (~valid) 
			   begin:WRITE_TO_WENABLE
				Penable_temp=1;
				Hreadyout_temp=1;
			   end
			  
			  else 
			   begin:WRITE_TO_WENABLEP ///DOUBT
				Penable_temp=1;
				Hreadyout_temp=1;		   
			   end
		     end

	ST_WRITEP:begin:WRITEP_TO_WENABLEP
               Penable_temp=1;
			   Hreadyout_temp=1;
		      end

	ST_RENABLE:begin
	            if (valid && ~hwrite) 
				 begin:RENABLE_TO_READ
					Paddr_temp=haddr;
					Pwrite_temp=hwrite;
					Pselx_temp=psel_reg;
					Penable_temp=0;
					Hreadyout_temp=0;
					prdata_temp=0;
				 end
			  
			  else if (valid && hwrite)
			    begin:RENABLE_TO_WWAIT
			     Pselx_temp=0;
				 Penable_temp=0;
				 Hreadyout_temp=1;	
				 prdata_temp=0;
			    end
			   
			  else
                begin:RENABLE_TO_IDLE
			     Pselx_temp=0;
				 Penable_temp=0;
				 Hreadyout_temp=1;	
				 prdata_temp=0;
			    end

		       end

	ST_WENABLEP:begin
                 if (~valid && hwritereg) 
			      begin:WENABLEP_TO_WRITEP
			       Paddr_temp=haddr2;
				   Pwrite_temp=hwrite;
				   Pselx_temp=psel_reg;
				   Penable_temp=0;
				   Pwdata_temp=hwdata;
				   Hreadyout_temp=0;
				  end

			  
			    else 
			     begin:WENABLEP_TO_WRITE_OR_READ /////DOUBT
			      Paddr_temp=haddr2;
				  Pwrite_temp=hwrite;
				  Pselx_temp=psel_reg;
				  Pwdata_temp=hwdata;
				  Penable_temp=0;
				  Hreadyout_temp=0;		   
			     end
		        end

	ST_WENABLE :begin
	             if (~valid && hwritereg) 
			      begin:WENABLE_TO_IDLE
				   Pselx_temp=0;
				   Penable_temp=0;
				   Hreadyout_temp=0;
				  end

			  
			    else 
			     begin:WENABLE_TO_WAIT_OR_READ /////DOUBT
				  Pselx_temp=0;
				  Penable_temp=0;
				  Hreadyout_temp=0;		   
			     end

		        end

 endcase
end


////////////////////////////////////////////////////////OUTPUT LOGIC:SEQUENTIAL

always @(posedge pclk or negedge hresetn)
 begin
  
  if (~hresetn)
   begin
    Paddr<=0;
	Pwrite<=0;
	//Pselx<=0;
	Pwdata<=0;
	Penable<=0;
	hreadyout<=0;
	hrdata<=0;
   end
  
  else
   begin
    Paddr<=Paddr_temp;
	Pwrite<=Pwrite_temp;
	//Pselx<=Pselx_temp;
	Pwdata<=Pwdata_temp;
	Penable<=Penable_temp;
	hreadyout<=Hreadyout_temp;
	hrdata<=prdata_temp;
   end
 end
assign psel_s0=(Pselx_temp==7'b0000001)?1:0;
assign psel_s1=(Pselx_temp==7'b0000010)?1:0;
assign psel_s2=(Pselx_temp==7'b0000100)?1:0;
assign psel_s3=(Pselx_temp==7'b0001000)?1:0;
assign psel_s4=(Pselx_temp==7'b0010000)?1:0;
assign psel_s5=(Pselx_temp==7'b0100000)?1:0;
assign psel_s6=(Pselx_temp==7'b1000000)?1:0;

endmodule
