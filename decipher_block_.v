module decipher_block(
                          input wire            clk,
                          input wire            reset_n,

                          input wire            next,

                          input wire  [3 : 0]  keylen,
                          output wire [3 : 0]   round_number,
                          input wire [127 : 0]  round_key,

                          input wire [127 : 0]  block,
                          output wire [127 : 0] new_block,
                          output wire           ready
                         );



  localparam AES_128_BIT_KEY = 4'h0;
  localparam AES_192_BIT_KEY = 4'h1;
  localparam AES_256_BIT_KEY = 4'h2;

  localparam AES128_ROUNDS = 4'ha;
  localparam AES192_ROUNDS = 4'hc;
  localparam AES256_ROUNDS = 4'he;

  localparam NO_UPDATE    = 3'h0;
  localparam INIT_UPDATE  = 3'h1;
  localparam SBOX_UPDATE  = 3'h2;
  localparam MAIN_UPDATE  = 3'h3;
  localparam FINAL_UPDATE = 3'h4;

  localparam CTRL_IDLE  = 2'h0;
  localparam CTRL_INIT  = 2'h1;
  localparam CTRL_SBOX  = 2'h2;
  localparam CTRL_MAIN  = 2'h3;

  reg [1 : 0]   sword_ctr_reg;
  reg [1 : 0]   sword_ctr_new;
  reg           sword_ctr_we;
  reg           sword_ctr_inc;
  reg           sword_ctr_rst;

  reg [3 : 0]   round_ctr_reg;
  reg [3 : 0]   round_ctr_new;
  reg           round_ctr_we;
  reg           round_ctr_set;
  reg           round_ctr_dec;

  reg [127 : 0] block_new;
  reg [31 : 0]  block_w0_reg;
  reg [31 : 0]  block_w1_reg;
  reg [31 : 0]  block_w2_reg;
  reg [31 : 0]  block_w3_reg;
  reg           block_w0_we;
  reg           block_w1_we;
  reg           block_w2_we;
  reg           block_w3_we;

  reg           ready_reg;
  reg           ready_new;
  reg           ready_we;

  reg [1 : 0]   dec_ctrl_reg;
  reg [1 : 0]   dec_ctrl_new;
  reg           dec_ctrl_we;


  reg [31 : 0]  tmp_sboxw;
  wire [31 : 0] new_sboxw;
  reg [2 : 0]   update_type;



  inv_sbox inv_sbox_inst(.state(tmp_sboxw), .new_state(new_sboxw));



  assign round_number	= round_ctr_reg;
  assign new_block 		= {block_w0_reg, block_w1_reg, block_w2_reg, block_w3_reg};
  assign ready     		= ready_reg;


  //----------------------------------------------------------------
  // reg_update
  //----------------------------------------------------------------
  always @ (posedge clk or negedge reset_n)
    begin: reg_update
      if (!reset_n)
        begin
          block_w0_reg  <= 32'h0;
          block_w1_reg  <= 32'h0;
          block_w2_reg  <= 32'h0;
          block_w3_reg  <= 32'h0;
          sword_ctr_reg <= 2'h0;
          round_ctr_reg <= 4'h0;
          ready_reg     <= 1'b0;
          dec_ctrl_reg  <= CTRL_IDLE;
        end
      else
        begin
          if (block_w0_we)
            block_w0_reg <= block_new[127 : 096];

          if (block_w1_we)
            block_w1_reg <= block_new[095 : 064];

          if (block_w2_we)
            block_w2_reg <= block_new[063 : 032];

          if (block_w3_we)
            block_w3_reg <= block_new[031 : 000];

          if (sword_ctr_we)
            sword_ctr_reg <= sword_ctr_new;

          if (round_ctr_we)
            round_ctr_reg <= round_ctr_new;

          if (ready_we)
            ready_reg <= ready_new;

          if (dec_ctrl_we)
            dec_ctrl_reg <= dec_ctrl_new;
        end
    end // reg_update
	 
//----------------------------------------------------------------
// Functions
//----------------------------------------------------------------
	 
 function [127 : 0] inv_shiftrows(input [127 : 0] data);

	 reg [31 : 0] w0, w1, w2, w3;
	 reg [31 : 0] shifted_word_0, shifted_word_1, shifted_word_2, shifted_word_3;
	 
	 begin
		w0 = data[127 : 096];
		w1 = data[095 : 064];
		w2 = data[063 : 032];
		w3 = data[031 : 000];

		shifted_word_0 = {w0[31 : 24], w3[23 : 16], w2[15 : 08], w1[07 : 00]};
		shifted_word_1 = {w1[31 : 24], w0[23 : 16], w3[15 : 08], w2[07 : 00]};
		shifted_word_2 = {w2[31 : 24], w1[23 : 16], w0[15 : 08], w3[07 : 00]};
		shifted_word_3 = {w3[31 : 24], w2[23 : 16], w1[15 : 08], w0[07 : 00]};

		inv_shiftrows = {shifted_word_0, shifted_word_1, shifted_word_2, shifted_word_3};
		
	 end
endfunction

function [7:0] mult_2(input [7:0] x);
	
	begin 
			/* multiplication by 2 is shifting on bit to the left, and if the original 8 bits had a 1 @ msb, xor the result with 0001 1011*/
			if(x[7] == 1) mult_2 = ((x << 1) ^ 8'h1b);
			else mult_2 = x << 1; 
	end 	

endfunction

function [7:0] mult_3(input [7:0] x);

	begin 
			/* multiplication by 3 ,= 01 ^ 10 = (num * 01) xor (num * 10) = (num) xor (num muliplication by 2) */
			mult_3 = mult_2(x) ^ x;
	end 
	
endfunction

  function [7 : 0] mult_4(input [7 : 0] x);
    begin
			mult_4 = mult_2(mult_2(x));
    end
  endfunction
  

  function [7 : 0] mult_8(input [7 : 0] x);
    begin
      mult_8 = mult_2(mult_4(x));
    end
  endfunction

function [7 : 0] mult_9(input [7 : 0] x);
 begin
	mult_9 = mult_8(x) ^ x;
 end
endfunction

function [7 : 0] mult_b(input [7 : 0] x);
 begin
	mult_b = mult_8(x) ^ mult_2(x) ^ x;
 end
endfunction

function [7 : 0] mult_d(input [7 : 0] x);
 begin
	mult_d = mult_8(x) ^ mult_4(x) ^ x;
 end
endfunction

function [7 : 0] mult_e(input [7 : 0] x);
 begin
	mult_e = mult_8(x) ^ mult_4(x) ^ mult_2(x);
 end
endfunction

function [127 : 0] inv_mixcolumns(input [127 : 0] data);
 reg [31 : 0] w0, w1, w2, w3;
 reg [31 : 0] new_w0, new_w1, new_w2, new_w3;
 begin
	w0 = data[127 : 096];
	w1 = data[095 : 064];
	w2 = data[063 : 032];
	w3 = data[031 : 000];

	new_w0 = inv_mixw(w0);
	new_w1 = inv_mixw(w1);
	new_w2 = inv_mixw(w2);
	new_w3 = inv_mixw(w3);

	inv_mixcolumns = {new_w0, new_w1, new_w2, new_w3};
 end
endfunction

function [31 : 0] inv_mixw(input [31 : 0] word);
 reg [7 : 0] byte_0, byte_1, byte_2, byte_3;
 reg [7 : 0] mixed_byte_0, mixed_byte_1, mixed_byte_2, mixed_byte_3;
 begin
	byte_0 = word[31 : 24];
	byte_1 = word[23 : 16];
	byte_2 = word[15 : 08];
	byte_3 = word[07 : 00];

	mixed_byte_0 = mult_e(byte_0) ^ mult_b(byte_1) ^ mult_d(byte_2) ^ mult_9(byte_3);
	mixed_byte_1 = mult_9(byte_0) ^ mult_e(byte_1) ^ mult_b(byte_2) ^ mult_d(byte_3);
	mixed_byte_2 = mult_d(byte_0) ^ mult_9(byte_1) ^ mult_e(byte_2) ^ mult_b(byte_3);
	mixed_byte_3 = mult_b(byte_0) ^ mult_d(byte_1) ^ mult_9(byte_2) ^ mult_e(byte_3);

	inv_mixw = {mixed_byte_0, mixed_byte_1, mixed_byte_2, mixed_byte_3};
 end
endfunction


function [127 : 0] addroundkey(input [127 : 0] data, input [127 : 0] rkey); // the inverse of the add round key function is itself as it's just an xor operation
 begin
	addroundkey = data ^ rkey;
 end
 
endfunction


  //----------------------------------------------------------------
  // round_logic
  //----------------------------------------------------------------
  always @*
    begin : round_logic
      reg [127 : 0] old_block, inv_shiftrows_block, inv_mixcolumns_block;
      reg [127 : 0] addkey_block;

      inv_shiftrows_block  = 128'h0;
      inv_mixcolumns_block = 128'h0;
      addkey_block         = 128'h0;
      block_new            = 128'h0;
      tmp_sboxw            = 32'h0;
      block_w0_we          = 1'b0;
      block_w1_we          = 1'b0;
      block_w2_we          = 1'b0;
      block_w3_we          = 1'b0;

      old_block            = {block_w0_reg, block_w1_reg, block_w2_reg, block_w3_reg};

      // Update based on update type.
      case (update_type)
        // InitRound
        INIT_UPDATE:
          begin
            old_block           = block;
            addkey_block        = addroundkey(old_block, round_key);
            inv_shiftrows_block = inv_shiftrows(addkey_block);
            block_new           = inv_shiftrows_block;
            block_w0_we         = 1'b1;
            block_w1_we         = 1'b1;
            block_w2_we         = 1'b1;
            block_w3_we         = 1'b1;
          end

        SBOX_UPDATE:
          begin
            block_new = {new_sboxw, new_sboxw, new_sboxw, new_sboxw};

            case (sword_ctr_reg)
              2'h0:
                begin
                  tmp_sboxw   = block_w0_reg;
                  block_w0_we = 1'b1;
                end

              2'h1:
                begin
                  tmp_sboxw   = block_w1_reg;
                  block_w1_we = 1'b1;
                end

              2'h2:
                begin
                  tmp_sboxw   = block_w2_reg;
                  block_w2_we = 1'b1;
                end

              2'h3:
                begin
                  tmp_sboxw   = block_w3_reg;
                  block_w3_we = 1'b1;
                end
            endcase // case (sbox_mux_ctrl_reg)
          end

        MAIN_UPDATE:
          begin
            addkey_block         = addroundkey(old_block, round_key);
            inv_mixcolumns_block = inv_mixcolumns(addkey_block);
            inv_shiftrows_block  = inv_shiftrows(inv_mixcolumns_block);
            block_new            = inv_shiftrows_block;
            block_w0_we          = 1'b1;
            block_w1_we          = 1'b1;
            block_w2_we          = 1'b1;
            block_w3_we          = 1'b1;
          end

        FINAL_UPDATE:
          begin
            block_new    = addroundkey(old_block, round_key);
            block_w0_we  = 1'b1;
            block_w1_we  = 1'b1;
            block_w2_we  = 1'b1;
            block_w3_we  = 1'b1;
          end

        default:
          begin
          end
      endcase // case (update_type)
    end // round_logic


  //----------------------------------------------------------------
  // sword_ctr
  //----------------------------------------------------------------
  always @*
    begin : sword_ctr
      sword_ctr_new = 2'h0;
      sword_ctr_we  = 1'b0;

      if (sword_ctr_rst)
        begin
          sword_ctr_new = 2'h0;
          sword_ctr_we  = 1'b1;
        end
      else if (sword_ctr_inc)
        begin
          sword_ctr_new = sword_ctr_reg + 1'b1;
          sword_ctr_we  = 1'b1;
        end
    end // sword_ctr


  //----------------------------------------------------------------
  // round_ctr
  //----------------------------------------------------------------
  always @*
    begin : round_ctr
      round_ctr_new = 4'h0;
      round_ctr_we  = 1'b0;

      if (round_ctr_set)
        begin
          if (keylen == AES_256_BIT_KEY)
            begin
              round_ctr_new = AES256_ROUNDS;
            end
			else if (keylen == AES_192_BIT_KEY)
			begin
			
              round_ctr_new = AES192_ROUNDS;
			end
          else
            begin
              round_ctr_new = AES128_ROUNDS;
            end
          round_ctr_we  = 1'b1;
        end
      else if (round_ctr_dec)
        begin
          round_ctr_new = round_ctr_reg - 1'b1;
          round_ctr_we  = 1'b1;
        end
    end // round_ctr


  //----------------------------------------------------------------
  // decipher_ctrl
  //----------------------------------------------------------------
  always @*
    begin: decipher_ctrl
      sword_ctr_inc = 1'b0;
      sword_ctr_rst = 1'b0;
      round_ctr_dec = 1'b0;
      round_ctr_set = 1'b0;
      ready_new     = 1'b0;
      update_type   = NO_UPDATE;
      dec_ctrl_new  = CTRL_IDLE;
      dec_ctrl_we   = 1'b0;

      case(dec_ctrl_reg)
        CTRL_IDLE:
          begin
            if (next)
              begin
                round_ctr_set = 1'b1;
                ready_new     = 1'b0;
                ready_we      = 1'b1;
                dec_ctrl_new  = CTRL_INIT;
                dec_ctrl_we   = 1'b1;
              end
          end

        CTRL_INIT:
          begin
            sword_ctr_rst = 1'b1;
            update_type   = INIT_UPDATE;
            dec_ctrl_new  = CTRL_SBOX;
            dec_ctrl_we   = 1'b1;
          end

        CTRL_SBOX:
          begin
            sword_ctr_inc = 1'b1;
            update_type   = SBOX_UPDATE;
            if (sword_ctr_reg == 2'h3)
              begin
                round_ctr_dec = 1'b1;
                dec_ctrl_new  = CTRL_MAIN;
                dec_ctrl_we   = 1'b1;
              end
          end

        CTRL_MAIN:
          begin
            sword_ctr_rst = 1'b1;
            if (round_ctr_reg > 0)
              begin
                update_type   = MAIN_UPDATE;
                dec_ctrl_new  = CTRL_SBOX;
                dec_ctrl_we   = 1'b1;
              end
            else
              begin
                update_type  = FINAL_UPDATE;
                ready_new    = 1'b1;
                ready_we     = 1'b1;
                dec_ctrl_new = CTRL_IDLE;
                dec_ctrl_we  = 1'b1;
              end
          end

        default:
          begin
            // Empty. Just here to make the synthesis tool happy.
          end
      endcase // case (dec_ctrl_reg)
    end // decipher_ctrl

endmodule // aes_decipher_block