module s_box(
                input wire [31 : 0]  state,
                output wire [31 : 0] new_state
               );

  wire [7 : 0] sbox [8'h00 : 8'hff];

  assign new_state[31 : 24] = sbox[state[31 : 24]];
  assign new_state[23 : 16] = sbox[state[23 : 16]];
  assign new_state[15 : 08] = sbox[state[15 : 08]];
  assign new_state[07 : 00] = sbox[state[07 : 00]];

  assign sbox[8'h00] = 8'h63;
  assign sbox[8'h01] = 8'h7c;
  assign sbox[8'h02] = 8'h77;
  assign sbox[8'h03] = 8'h7b;
  assign sbox[8'h04] = 8'hf2;
  assign sbox[8'h05] = 8'h6b;
  assign sbox[8'h06] = 8'h6f;
  assign sbox[8'h07] = 8'hc5;
  assign sbox[8'h08] = 8'h30;
  assign sbox[8'h09] = 8'h01;
  assign sbox[8'h0a] = 8'h67;
  assign sbox[8'h0b] = 8'h2b;
  assign sbox[8'h0c] = 8'hfe;
  assign sbox[8'h0d] = 8'hd7;
  assign sbox[8'h0e] = 8'hab;
  assign sbox[8'h0f] = 8'h76;
  assign sbox[8'h10] = 8'hca;
  assign sbox[8'h11] = 8'h82;
  assign sbox[8'h12] = 8'hc9;
  assign sbox[8'h13] = 8'h7d;
  assign sbox[8'h14] = 8'hfa;
  assign sbox[8'h15] = 8'h59;
  assign sbox[8'h16] = 8'h47;
  assign sbox[8'h17] = 8'hf0;
  assign sbox[8'h18] = 8'had;
  assign sbox[8'h19] = 8'hd4;
  assign sbox[8'h1a] = 8'ha2;
  assign sbox[8'h1b] = 8'haf;
  assign sbox[8'h1c] = 8'h9c;
  assign sbox[8'h1d] = 8'ha4;
  assign sbox[8'h1e] = 8'h72;
  assign sbox[8'h1f] = 8'hc0;
  assign sbox[8'h20] = 8'hb7;
  assign sbox[8'h21] = 8'hfd;
  assign sbox[8'h22] = 8'h93;
  assign sbox[8'h23] = 8'h26;
  assign sbox[8'h24] = 8'h36;
  assign sbox[8'h25] = 8'h3f;
  assign sbox[8'h26] = 8'hf7;
  assign sbox[8'h27] = 8'hcc;
  assign sbox[8'h28] = 8'h34;
  assign sbox[8'h29] = 8'ha5;
  assign sbox[8'h2a] = 8'he5;
  assign sbox[8'h2b] = 8'hf1;
  assign sbox[8'h2c] = 8'h71;
  assign sbox[8'h2d] = 8'hd8;
  assign sbox[8'h2e] = 8'h31;
  assign sbox[8'h2f] = 8'h15;
  assign sbox[8'h30] = 8'h04;
  assign sbox[8'h31] = 8'hc7;
  assign sbox[8'h32] = 8'h23;
  assign sbox[8'h33] = 8'hc3;
  assign sbox[8'h34] = 8'h18;
  assign sbox[8'h35] = 8'h96;
  assign sbox[8'h36] = 8'h05;
  assign sbox[8'h37] = 8'h9a;
  assign sbox[8'h38] = 8'h07;
  assign sbox[8'h39] = 8'h12;
  assign sbox[8'h3a] = 8'h80;
  assign sbox[8'h3b] = 8'he2;
  assign sbox[8'h3c] = 8'heb;
  assign sbox[8'h3d] = 8'h27;
  assign sbox[8'h3e] = 8'hb2;
  assign sbox[8'h3f] = 8'h75;
  assign sbox[8'h40] = 8'h09;
  assign sbox[8'h41] = 8'h83;
  assign sbox[8'h42] = 8'h2c;
  assign sbox[8'h43] = 8'h1a;
  assign sbox[8'h44] = 8'h1b;
  assign sbox[8'h45] = 8'h6e;
  assign sbox[8'h46] = 8'h5a;
  assign sbox[8'h47] = 8'ha0;
  assign sbox[8'h48] = 8'h52;
  assign sbox[8'h49] = 8'h3b;
  assign sbox[8'h4a] = 8'hd6;
  assign sbox[8'h4b] = 8'hb3;
  assign sbox[8'h4c] = 8'h29;
  assign sbox[8'h4d] = 8'he3;
  assign sbox[8'h4e] = 8'h2f;
  assign sbox[8'h4f] = 8'h84;
  assign sbox[8'h50] = 8'h53;
  assign sbox[8'h51] = 8'hd1;
  assign sbox[8'h52] = 8'h00;
  assign sbox[8'h53] = 8'hed;
  assign sbox[8'h54] = 8'h20;
  assign sbox[8'h55] = 8'hfc;
  assign sbox[8'h56] = 8'hb1;
  assign sbox[8'h57] = 8'h5b;
  assign sbox[8'h58] = 8'h6a;
  assign sbox[8'h59] = 8'hcb;
  assign sbox[8'h5a] = 8'hbe;
  assign sbox[8'h5b] = 8'h39;
  assign sbox[8'h5c] = 8'h4a;
  assign sbox[8'h5d] = 8'h4c;
  assign sbox[8'h5e] = 8'h58;
  assign sbox[8'h5f] = 8'hcf;
  assign sbox[8'h60] = 8'hd0;
  assign sbox[8'h61] = 8'hef;
  assign sbox[8'h62] = 8'haa;
  assign sbox[8'h63] = 8'hfb;
  assign sbox[8'h64] = 8'h43;
  assign sbox[8'h65] = 8'h4d;
  assign sbox[8'h66] = 8'h33;
  assign sbox[8'h67] = 8'h85;
  assign sbox[8'h68] = 8'h45;
  assign sbox[8'h69] = 8'hf9;
  assign sbox[8'h6a] = 8'h02;
  assign sbox[8'h6b] = 8'h7f;
  assign sbox[8'h6c] = 8'h50;
  assign sbox[8'h6d] = 8'h3c;
  assign sbox[8'h6e] = 8'h9f;
  assign sbox[8'h6f] = 8'ha8;
  assign sbox[8'h70] = 8'h51;
  assign sbox[8'h71] = 8'ha3;
  assign sbox[8'h72] = 8'h40;
  assign sbox[8'h73] = 8'h8f;
  assign sbox[8'h74] = 8'h92;
  assign sbox[8'h75] = 8'h9d;
  assign sbox[8'h76] = 8'h38;
  assign sbox[8'h77] = 8'hf5;
  assign sbox[8'h78] = 8'hbc;
  assign sbox[8'h79] = 8'hb6;
  assign sbox[8'h7a] = 8'hda;
  assign sbox[8'h7b] = 8'h21;
  assign sbox[8'h7c] = 8'h10;
  assign sbox[8'h7d] = 8'hff;
  assign sbox[8'h7e] = 8'hf3;
  assign sbox[8'h7f] = 8'hd2;
  assign sbox[8'h80] = 8'hcd;
  assign sbox[8'h81] = 8'h0c;
  assign sbox[8'h82] = 8'h13;
  assign sbox[8'h83] = 8'hec;
  assign sbox[8'h84] = 8'h5f;
  assign sbox[8'h85] = 8'h97;
  assign sbox[8'h86] = 8'h44;
  assign sbox[8'h87] = 8'h17;
  assign sbox[8'h88] = 8'hc4;
  assign sbox[8'h89] = 8'ha7;
  assign sbox[8'h8a] = 8'h7e;
  assign sbox[8'h8b] = 8'h3d;
  assign sbox[8'h8c] = 8'h64;
  assign sbox[8'h8d] = 8'h5d;
  assign sbox[8'h8e] = 8'h19;
  assign sbox[8'h8f] = 8'h73;
  assign sbox[8'h90] = 8'h60;
  assign sbox[8'h91] = 8'h81;
  assign sbox[8'h92] = 8'h4f;
  assign sbox[8'h93] = 8'hdc;
  assign sbox[8'h94] = 8'h22;
  assign sbox[8'h95] = 8'h2a;
  assign sbox[8'h96] = 8'h90;
  assign sbox[8'h97] = 8'h88;
  assign sbox[8'h98] = 8'h46;
  assign sbox[8'h99] = 8'hee;
  assign sbox[8'h9a] = 8'hb8;
  assign sbox[8'h9b] = 8'h14;
  assign sbox[8'h9c] = 8'hde;
  assign sbox[8'h9d] = 8'h5e;
  assign sbox[8'h9e] = 8'h0b;
  assign sbox[8'h9f] = 8'hdb;
  assign sbox[8'ha0] = 8'he0;
  assign sbox[8'ha1] = 8'h32;
  assign sbox[8'ha2] = 8'h3a;
  assign sbox[8'ha3] = 8'h0a;
  assign sbox[8'ha4] = 8'h49;
  assign sbox[8'ha5] = 8'h06;
  assign sbox[8'ha6] = 8'h24;
  assign sbox[8'ha7] = 8'h5c;
  assign sbox[8'ha8] = 8'hc2;
  assign sbox[8'ha9] = 8'hd3;
  assign sbox[8'haa] = 8'hac;
  assign sbox[8'hab] = 8'h62;
  assign sbox[8'hac] = 8'h91;
  assign sbox[8'had] = 8'h95;
  assign sbox[8'hae] = 8'he4;
  assign sbox[8'haf] = 8'h79;
  assign sbox[8'hb0] = 8'he7;
  assign sbox[8'hb1] = 8'hc8;
  assign sbox[8'hb2] = 8'h37;
  assign sbox[8'hb3] = 8'h6d;
  assign sbox[8'hb4] = 8'h8d;
  assign sbox[8'hb5] = 8'hd5;
  assign sbox[8'hb6] = 8'h4e;
  assign sbox[8'hb7] = 8'ha9;
  assign sbox[8'hb8] = 8'h6c;
  assign sbox[8'hb9] = 8'h56;
  assign sbox[8'hba] = 8'hf4;
  assign sbox[8'hbb] = 8'hea;
  assign sbox[8'hbc] = 8'h65;
  assign sbox[8'hbd] = 8'h7a;
  assign sbox[8'hbe] = 8'hae;
  assign sbox[8'hbf] = 8'h08;
  assign sbox[8'hc0] = 8'hba;
  assign sbox[8'hc1] = 8'h78;
  assign sbox[8'hc2] = 8'h25;
  assign sbox[8'hc3] = 8'h2e;
  assign sbox[8'hc4] = 8'h1c;
  assign sbox[8'hc5] = 8'ha6;
  assign sbox[8'hc6] = 8'hb4;
  assign sbox[8'hc7] = 8'hc6;
  assign sbox[8'hc8] = 8'he8;
  assign sbox[8'hc9] = 8'hdd;
  assign sbox[8'hca] = 8'h74;
  assign sbox[8'hcb] = 8'h1f;
  assign sbox[8'hcc] = 8'h4b;
  assign sbox[8'hcd] = 8'hbd;
  assign sbox[8'hce] = 8'h8b;
  assign sbox[8'hcf] = 8'h8a;
  assign sbox[8'hd0] = 8'h70;
  assign sbox[8'hd1] = 8'h3e;
  assign sbox[8'hd2] = 8'hb5;
  assign sbox[8'hd3] = 8'h66;
  assign sbox[8'hd4] = 8'h48;
  assign sbox[8'hd5] = 8'h03;
  assign sbox[8'hd6] = 8'hf6;
  assign sbox[8'hd7] = 8'h0e;
  assign sbox[8'hd8] = 8'h61;
  assign sbox[8'hd9] = 8'h35;
  assign sbox[8'hda] = 8'h57;
  assign sbox[8'hdb] = 8'hb9;
  assign sbox[8'hdc] = 8'h86;
  assign sbox[8'hdd] = 8'hc1;
  assign sbox[8'hde] = 8'h1d;
  assign sbox[8'hdf] = 8'h9e;
  assign sbox[8'he0] = 8'he1;
  assign sbox[8'he1] = 8'hf8;
  assign sbox[8'he2] = 8'h98;
  assign sbox[8'he3] = 8'h11;
  assign sbox[8'he4] = 8'h69;
  assign sbox[8'he5] = 8'hd9;
  assign sbox[8'he6] = 8'h8e;
  assign sbox[8'he7] = 8'h94;
  assign sbox[8'he8] = 8'h9b;
  assign sbox[8'he9] = 8'h1e;
  assign sbox[8'hea] = 8'h87;
  assign sbox[8'heb] = 8'he9;
  assign sbox[8'hec] = 8'hce;
  assign sbox[8'hed] = 8'h55;
  assign sbox[8'hee] = 8'h28;
  assign sbox[8'hef] = 8'hdf;
  assign sbox[8'hf0] = 8'h8c;
  assign sbox[8'hf1] = 8'ha1;
  assign sbox[8'hf2] = 8'h89;
  assign sbox[8'hf3] = 8'h0d;
  assign sbox[8'hf4] = 8'hbf;
  assign sbox[8'hf5] = 8'he6;
  assign sbox[8'hf6] = 8'h42;
  assign sbox[8'hf7] = 8'h68;
  assign sbox[8'hf8] = 8'h41;
  assign sbox[8'hf9] = 8'h99;
  assign sbox[8'hfa] = 8'h2d;
  assign sbox[8'hfb] = 8'h0f;
  assign sbox[8'hfc] = 8'hb0;
  assign sbox[8'hfd] = 8'h54;
  assign sbox[8'hfe] = 8'hbb;
  assign sbox[8'hff] = 8'h16;

endmodule


module encipher_block(
                          input wire            clk,
                          input wire            reset_n,

                          input wire            next,

                          input wire   [3 : 0]   keylen,
                          output wire [3 : 0]   round_number,
                          input wire [127 : 0]  round_key,

                          output wire [31 : 0]  sboxw,
                          input wire  [31 : 0]  new_sboxw,

                          input wire [127 : 0]  block,
                          output wire [127 : 0] new_block,
								  
								  output wire 				ready
                         );
// Bit Keys
  localparam AES_128_BIT_KEY = 4'h0;
  localparam AES_192_BIT_KEY = 4'h1;
  localparam AES_256_BIT_KEY = 4'h2;
// # Rounds for each key size
  localparam AES_128_NUM_ROUNDS = 4'ha;
  localparam AES_192_NUM_ROUNDS = 4'hc;
  localparam AES_256_NUM_ROUNDS = 4'he;
// Round Logic
  localparam INIT_UPDATE  = 3'h1;
  localparam SBOX_UPDATE  = 3'h2;
  localparam MAIN_UPDATE  = 3'h3;
  localparam FINAL_UPDATE = 3'h4;
// Encryption logic
  localparam CTRL_IDLE  = 2'h0;
  localparam CTRL_INIT  = 2'h1;
  localparam CTRL_SBOX  = 2'h2;
  localparam CTRL_MAIN  = 2'h3;

	// SubBytes registers and counters
  reg [1 : 0]   sword_ctr_reg;
  reg [1 : 0]   sword_ctr_new;
  reg           sword_ctr_inc;
  reg           sword_ctr_rst;
	// Round registers and counters
  reg [3 : 0]   round_ctr_reg;
  reg [3 : 0]   round_ctr_new;
  reg           round_ctr_rst;
  reg           round_ctr_inc;
	// Blocks
  reg [127 : 0] block_new;
  reg [31 : 0]  block_w0_reg;
  reg [31 : 0]  block_w1_reg;
  reg [31 : 0]  block_w2_reg;
  reg [31 : 0]  block_w3_reg;
	// Ready Output
  reg           ready_reg;
  reg           ready_new;
	// Encryption Control registers
  reg [1 : 0]   enc_ctrl_reg;
  reg [1 : 0]   enc_ctrl_new;

	// Round (or Phases) control registers
  reg [2 : 0]  update_type;
  reg [31 : 0] muxed_sboxw;

  // Assignments for outputs
  assign round_number     = round_ctr_reg;
  assign sboxw     = muxed_sboxw;
  assign new_block = {block_w0_reg, block_w1_reg, block_w2_reg, block_w3_reg};
  assign ready     = ready_reg;
  
  
// Functions
// -> Shifting rows
function [127 : 0] shiftrows(input [127 : 0] data);

    reg [31 : 0] w0, w1, w2, w3;
    reg [31 : 0] shifted_word_0, shifted_word_1, shifted_word_2, shifted_word_3;
	 reg [127: 0] shifted_block;
	 
    begin
	 
      w0 = data[127 : 096];
      w1 = data[095 : 064];
      w2 = data[063 : 032];
      w3 = data[031 : 000];

      shifted_word_0 = {w0[31 : 24], w1[23 : 16], w2[15 : 08], w3[07 : 00]}; // 0 bytes are shifted
      shifted_word_1 = {w1[31 : 24], w2[23 : 16], w3[15 : 08], w0[07 : 00]}; // 1 byte is shifted left
      shifted_word_2 = {w2[31 : 24], w3[23 : 16], w0[15 : 08], w1[07 : 00]}; // 2 bytes are shifted left
      shifted_word_3 = {w3[31 : 24], w0[23 : 16], w1[15 : 08], w2[07 : 00]}; // 3 bytes are shifted left
		
		shiftrows = {shifted_word_0, shifted_word_1, shifted_word_2, shifted_word_3};
		
    end
endfunction
// Multiplying by 2
function [7:0] mult_2(input [7:0] x);
	
	begin 
			/* multiplication by 2 is shifting on bit to the left, and if the original 8 bits had a 1 @ msb, xor the result with 0001 1011*/
			if(x[7] == 1) mult_2 =  ((x << 1) ^ 8'h1b);
			else mult_2 = (x << 1); 
	end 	

endfunction
// Multiplying by 3 using multiply of 2
function [7:0] mult_3(input [7:0] x);

	begin 
			/* multiplication by 3 ,= 01 ^ 10 = (num * 01) xor (num * 10) = (num) xor (num muliplication by 2) */
			mult_3 = (mult_2(x) ^ x);
	end 
	
endfunction

// Mixing words (Smaller sub-function for Mixed Columns)
function [31 : 0] mixw(input [31 : 0] word);
 reg [7 : 0] byte_0, byte_1, byte_2, byte_3;
 reg [7 : 0] mixed_byte_0, mixed_byte_1, mixed_byte_2, mixed_byte_3;
 begin
	byte_0 = word[31 : 24];
	byte_1 = word[23 : 16];
	byte_2 = word[15 : 08];
	byte_3 = word[07 : 00];

	mixed_byte_0 = mult_2(byte_0) ^ mult_3(byte_1) ^ byte_2         ^ byte_3;
	mixed_byte_1 = byte_0         ^ mult_2(byte_1) ^ mult_3(byte_2) ^ byte_3;
	mixed_byte_2 = byte_0         ^ byte_1         ^ mult_2(byte_2) ^ mult_3(byte_3);
	mixed_byte_3 = mult_3(byte_0) ^ byte_1         ^ byte_2         ^ mult_2(byte_3);

	mixw = ({mixed_byte_0, mixed_byte_1, mixed_byte_2, mixed_byte_3});
 end
endfunction

// -> Mix Columns function
function [127 : 0] mixcolumns(input [127 : 0] data);

	// matrix x state array
	// matrix :: [02 03 01 01]
	// 			 [01 02 03 01]
	// 			 [01 01 02 03]
	// 			 [03 01 01 02]
	 
 reg [31 : 0] w0, w1, w2, w3;
 reg [31 : 0] new_w0, new_w1, new_w2, new_w3;
 begin
	w0 = data[127 : 096];
	w1 = data[095 : 064];
	w2 = data[063 : 032];
	w3 = data[031 : 000];

	new_w0 = mixw(w0);
	new_w1 = mixw(w1);
	new_w2 = mixw(w2);
	new_w3 = mixw(w3);

	mixcolumns = ({new_w0, new_w1, new_w2, new_w3});
 end
 
endfunction

// -> Add Round Key
function [127 : 0] addroundkey(input [127 : 0] data, input [127 : 0] rkey); // the inverse of the add round key function is itself as it's just an xor operation
 begin
	addroundkey = (data ^ rkey);
 end
 
endfunction


// Updating registers
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
          ready_reg     <= 1'b1;
          enc_ctrl_reg  <= CTRL_IDLE;
        end
      else
        begin
            block_w0_reg <= block_new[127 : 096];

            block_w1_reg <= block_new[095 : 064];

            block_w2_reg <= block_new[063 : 032];

            block_w3_reg <= block_new[031 : 000];

            sword_ctr_reg <= sword_ctr_new;

            round_ctr_reg <= round_ctr_new;

            ready_reg <= ready_new;

            enc_ctrl_reg <= enc_ctrl_new;
        end
    end // reg_update


  //----------------------------------------------------------------
  // round_logic
  //----------------------------------------------------------------
  always @*
    begin : round_logic
      reg [127 : 0] old_block, shiftrows_block, mixcolumns_block;
      reg [127 : 0] addkey_init_block, addkey_main_block, addkey_final_block;

      block_new   = 128'h0;
      muxed_sboxw = 32'h0;

      old_block          = {block_w0_reg, block_w1_reg, block_w2_reg, block_w3_reg};
      shiftrows_block    = shiftrows(old_block);
      mixcolumns_block   = mixcolumns(shiftrows_block);
      addkey_init_block  = addroundkey(block, round_key);
      addkey_main_block  = addroundkey(mixcolumns_block, round_key);
      addkey_final_block = addroundkey(shiftrows_block, round_key);

      case (update_type)
        INIT_UPDATE:
          begin
            block_new    = addkey_init_block;
          end

        SBOX_UPDATE:
          begin

            case (sword_ctr_reg)
              2'h0:
                begin
						block_new = {new_sboxw, new_block[095:000]};
                  muxed_sboxw = block_w0_reg;
                end

              2'h1:
                begin
						block_new = {new_block[127:096],new_sboxw, new_block[063:000]};
                  muxed_sboxw = block_w1_reg;
                end

              2'h2:
                begin
						block_new = {new_block[127:064],new_sboxw, new_block[031:000]};
                  muxed_sboxw = block_w2_reg;
						
                end

              2'h3:
                begin
						block_new = {new_block[127:032],new_sboxw};
                  muxed_sboxw = block_w3_reg;
						
                end
            endcase // case (sbox_mux_ctrl_reg)
          end

        MAIN_UPDATE:
          begin
            block_new    = addkey_main_block;
				
          end

        FINAL_UPDATE:
          begin
            block_new    = addkey_final_block;
				
          end

        default:
          begin
          end
      endcase // case (update_type)
    end // round_logic


  //----------------------------------------------------------------
  // sword_ctr (counter for subBytes)
  //----------------------------------------------------------------
  always @*
    begin : sword_ctr
      //sword_ctr_new = 2'h0;
		

      if (sword_ctr_rst)
        begin
          sword_ctr_new = 2'h0;
			 
        end
      else if (sword_ctr_inc)
        begin
          sword_ctr_new = sword_ctr_reg + 1'b1;
			 
        end
    end // sword_ctr


  // Round counter
  always @*
    begin : round_ctr
		
      //round_ctr_new = 4'h0;
      
		if (round_ctr_rst)
        begin
          round_ctr_new = 4'h0;
			 
        end
		  else
		  begin
				round_ctr_new = round_ctr_reg + round_ctr_inc;
		  end
    end // round_ctr


  // encryption controller
  always @*
    begin: encipher_ctrl
      reg [3 : 0] num_rounds;

      // Default assignments.
      sword_ctr_inc = 1'b0;
      sword_ctr_rst = 1'b0;
      round_ctr_inc = 1'b0;
      round_ctr_rst = 1'b0;
      ready_new     = 1'b0;


      if (keylen == AES_256_BIT_KEY)
        begin
          num_rounds = AES_256_NUM_ROUNDS;
        end
		else if(keylen == AES_192_BIT_KEY)
		begin
          num_rounds = AES_192_NUM_ROUNDS;
		end
      else
        begin
          num_rounds = AES_128_NUM_ROUNDS;
        end

      case(enc_ctrl_reg)
        CTRL_IDLE:
          begin
				enc_ctrl_new  = CTRL_IDLE;
				round_ctr_rst = 1'b1;
            if (next)
              begin
                ready_new     = 1'b0;
					 
                enc_ctrl_new  = CTRL_INIT;
					 
              end
          end

        CTRL_INIT:
          begin
				round_ctr_inc = 1'b1;
            sword_ctr_rst = 1'b1;
            update_type   = INIT_UPDATE;
            enc_ctrl_new  = CTRL_SBOX;
				
          end

        CTRL_SBOX:
          begin
				enc_ctrl_new  = CTRL_SBOX;
            sword_ctr_inc = 1'b1;
            update_type   = SBOX_UPDATE;
            if (sword_ctr_reg == 2'h3)
              begin
                enc_ctrl_new  = CTRL_MAIN;
              end
          end

        CTRL_MAIN:
          begin
				enc_ctrl_new  = CTRL_MAIN;
            sword_ctr_rst = 1'b1;
				round_ctr_inc = 1'b1;
            if (round_ctr_reg < num_rounds)
              begin
                update_type   = MAIN_UPDATE;
                enc_ctrl_new  = CTRL_SBOX;
					 
              end
            else
              begin
                update_type  = FINAL_UPDATE;
                ready_new    = 1'b1;
					 
                enc_ctrl_new = CTRL_IDLE;
					 
              end
          end

        default:
          begin
            // Code
          end
      endcase // case (enc_ctrl_reg)
    end // encipher_ctrl

endmodule // aes_encipher_block