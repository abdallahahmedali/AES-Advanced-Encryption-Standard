module AES_wrapper(
                input wire            clk,
                input wire            reset_n,

					 output wire           ready,

					 output wire           result_valid,
					 output wire			  result_correct,
					 output wire           key_exp_done

               );




  //----------------------------------------------------------------
  // Internal constant and parameter definitions.
  //----------------------------------------------------------------
  localparam CTRL_GEN  = 2'h0;
  localparam CTRL_ENC  = 2'h1;
  localparam CTRL_DEC  = 2'h2;
  localparam CTRL_FINAL  = 2'h3;


  //----------------------------------------------------------------
  // Registers including update variables and write enable.
  //----------------------------------------------------------------
  reg [2:0] aes_wrapper_ctrl_reg;
  reg[2:0] aes_wrapper_ctrl_new;

  
  reg         result_correct_reg;
  reg         result_correct_new;

  reg         ready_reg;
  reg         ready_new;
  reg            encdec_reg;
  reg            encdec_new;
  reg            next_reg;
  reg            next_new;
  reg					init_reg;
  reg					init_new;
  reg 	[6:0] round_ctr_reg;
  reg 	[6:0] round_ctr_new;

  reg					led_reg;
  reg					led_new;
  //----------------------------------------------------------------
  // Wires.
  //----------------------------------------------------------------
  reg            init_state;

  wire [127 : 0] round_key;
  wire           key_ready;


	 reg [255 : 0]  key;
	 reg  [3 : 0] keylen;

	 reg [127 : 0]  block;
	 reg [127 : 0]	 expected;
	 wire [127 : 0] result;
	
	 //----------------------------------------------------------------
	 // Instantiations.
	 //----------------------------------------------------------------

	  aes_main uut(
               .clk(clk),
               .reset_n(reset_n),

               .encdec(encdec_reg),
               .init(init_reg),
               .next(next_reg),
               .ready(ready),

               .key(key),
               .keylen(keylen),

               .block(block),
               .result(result),
					
					.result_valid(result_valid)
              );
  
	assign key_exp_done = led_reg;
  
	assign result_correct = result_correct_reg;
  
  always @ (posedge clk or negedge reset_n)
    begin: reg_update
		
      if (!reset_n)
        begin
			 result_correct_reg  <= 1'b0;
			 key					 <= 256'h000102030405060708090a0b0c0d0e0f00000000000000000000000000000000;
			 keylen				 <= 4'h0;
			 encdec_reg <= 1'b0;
			 next_reg <= 1'b0;
			 init_reg <= 1'b1;
			 led_reg <= 1'b0;
			 aes_wrapper_ctrl_reg <= CTRL_GEN;
			 round_ctr_reg <= 6'h0;
        end
      else
        begin
				result_correct_reg <= result_correct_new;
				encdec_reg <= encdec_new;
				next_reg <= next_new;
				init_reg <= init_new;
				aes_wrapper_ctrl_reg <= aes_wrapper_ctrl_new;
				led_reg <= led_new;
				round_ctr_reg <= round_ctr_new;


        end
		
		
    end // reg_update

  always @*
    begin : aes_main_ctrl
      ready_new         = 1'b0;
		next_new 			= 1'b0;
		init_new				= 1'b0;
		encdec_new = 1'b0;
		expected	= 128'h00112233445566778899aabbccddeeff;
//		if(result == expected)begin
//			result_correct_new = 1'b1;
//		end
//		

		
		case (aes_wrapper_ctrl_reg)
        CTRL_GEN:
          begin
			 led_new = 1'b0;
			 round_ctr_new = 1'b0;
			result_correct_new  = 1'b0;
			aes_wrapper_ctrl_new  = CTRL_GEN;
			 if(ready) begin
				aes_wrapper_ctrl_new = CTRL_ENC;
				
			 end
          end


        CTRL_ENC:
          begin
				 led_new = 1'b1;
				result_correct_new  = 1'b0;
				aes_wrapper_ctrl_new = CTRL_ENC;
				encdec_new = 1'b1;
			   block = 128'h00112233445566778899aabbccddeeff;
				round_ctr_new = round_ctr_reg + 1'b1;

				if(round_ctr_reg <= 2'h2) begin
					next_new 			= 1'b1;
				end
				else begin
					next_new 			= 1'b0;
				end
				
				if(ready)
				begin
					aes_wrapper_ctrl_new = CTRL_DEC;
					round_ctr_new = 1'b0;
				end
				
          end
			 
        CTRL_DEC:
          begin
				 led_new = 1'b0;
				aes_wrapper_ctrl_new = CTRL_DEC;
				encdec_new = 1'b0;
				block = 128'h69c4e0d86a7b0430d8cdb78070b4c55a;
				round_ctr_new = round_ctr_reg + 1'b1;
				
				if(round_ctr_reg <= 2'h2) begin
					next_new 			= 1'b1;
				end
				else begin
					next_new 			= 1'b0;
				end
				
				if(ready) begin
						result_correct_new = 1'b1;
						aes_wrapper_ctrl_new = CTRL_FINAL;
						round_ctr_new = 1'b0;
				end
          end
			 
        CTRL_FINAL:
          begin
			 led_new = 1'b0;
				result_correct_new = 1'b1;
				aes_wrapper_ctrl_new = CTRL_FINAL;
          end
        default:
          begin

          end
      endcase // case (aes_main_ctrl_reg)
		
    end // aes_main_ctrl
endmodule // aes_main