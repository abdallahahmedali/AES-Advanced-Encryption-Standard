//module s_box(
//                input wire [31 : 0]  state,
//                output wire [31 : 0] new_state
//               );
//
//
//  //----------------------------------------------------------------
//  // The sbox array => The look-up table
//  //----------------------------------------------------------------
//  wire [7 : 0] sbox [8'h00 : 8'hff];
//
//
//  //--------------------------------------------------------------------------------------------------//
//  // Setting every 8-bits in the new state array with the coorseponding values from the look-up table
//  //--------------------------------------------------------------------------------------------------//
//  assign new_state[31 : 24] = sbox[state[31 : 24]];
//  assign new_state[23 : 16] = sbox[state[23 : 16]];
//  assign new_state[15 : 08] = sbox[state[15 : 08]];
//  assign new_state[07 : 00] = sbox[state[07 : 00]];
//
//
//  //----------------------------------------------------------------
//  // Creating the sbox array contents.
//  //----------------------------------------------------------------
//  assign sbox[8'h00] = 8'h63;
//  assign sbox[8'h01] = 8'h7c;
//  assign sbox[8'h02] = 8'h77;
//  assign sbox[8'h03] = 8'h7b;
//  assign sbox[8'h04] = 8'hf2;
//  assign sbox[8'h05] = 8'h6b;
//  assign sbox[8'h06] = 8'h6f;
//  assign sbox[8'h07] = 8'hc5;
//  assign sbox[8'h08] = 8'h30;
//  assign sbox[8'h09] = 8'h01;
//  assign sbox[8'h0a] = 8'h67;
//  assign sbox[8'h0b] = 8'h2b;
//  assign sbox[8'h0c] = 8'hfe;
//  assign sbox[8'h0d] = 8'hd7;
//  assign sbox[8'h0e] = 8'hab;
//  assign sbox[8'h0f] = 8'h76;
//  assign sbox[8'h10] = 8'hca;
//  assign sbox[8'h11] = 8'h82;
//  assign sbox[8'h12] = 8'hc9;
//  assign sbox[8'h13] = 8'h7d;
//  assign sbox[8'h14] = 8'hfa;
//  assign sbox[8'h15] = 8'h59;
//  assign sbox[8'h16] = 8'h47;
//  assign sbox[8'h17] = 8'hf0;
//  assign sbox[8'h18] = 8'had;
//  assign sbox[8'h19] = 8'hd4;
//  assign sbox[8'h1a] = 8'ha2;
//  assign sbox[8'h1b] = 8'haf;
//  assign sbox[8'h1c] = 8'h9c;
//  assign sbox[8'h1d] = 8'ha4;
//  assign sbox[8'h1e] = 8'h72;
//  assign sbox[8'h1f] = 8'hc0;
//  assign sbox[8'h20] = 8'hb7;
//  assign sbox[8'h21] = 8'hfd;
//  assign sbox[8'h22] = 8'h93;
//  assign sbox[8'h23] = 8'h26;
//  assign sbox[8'h24] = 8'h36;
//  assign sbox[8'h25] = 8'h3f;
//  assign sbox[8'h26] = 8'hf7;
//  assign sbox[8'h27] = 8'hcc;
//  assign sbox[8'h28] = 8'h34;
//  assign sbox[8'h29] = 8'ha5;
//  assign sbox[8'h2a] = 8'he5;
//  assign sbox[8'h2b] = 8'hf1;
//  assign sbox[8'h2c] = 8'h71;
//  assign sbox[8'h2d] = 8'hd8;
//  assign sbox[8'h2e] = 8'h31;
//  assign sbox[8'h2f] = 8'h15;
//  assign sbox[8'h30] = 8'h04;
//  assign sbox[8'h31] = 8'hc7;
//  assign sbox[8'h32] = 8'h23;
//  assign sbox[8'h33] = 8'hc3;
//  assign sbox[8'h34] = 8'h18;
//  assign sbox[8'h35] = 8'h96;
//  assign sbox[8'h36] = 8'h05;
//  assign sbox[8'h37] = 8'h9a;
//  assign sbox[8'h38] = 8'h07;
//  assign sbox[8'h39] = 8'h12;
//  assign sbox[8'h3a] = 8'h80;
//  assign sbox[8'h3b] = 8'he2;
//  assign sbox[8'h3c] = 8'heb;
//  assign sbox[8'h3d] = 8'h27;
//  assign sbox[8'h3e] = 8'hb2;
//  assign sbox[8'h3f] = 8'h75;
//  assign sbox[8'h40] = 8'h09;
//  assign sbox[8'h41] = 8'h83;
//  assign sbox[8'h42] = 8'h2c;
//  assign sbox[8'h43] = 8'h1a;
//  assign sbox[8'h44] = 8'h1b;
//  assign sbox[8'h45] = 8'h6e;
//  assign sbox[8'h46] = 8'h5a;
//  assign sbox[8'h47] = 8'ha0;
//  assign sbox[8'h48] = 8'h52;
//  assign sbox[8'h49] = 8'h3b;
//  assign sbox[8'h4a] = 8'hd6;
//  assign sbox[8'h4b] = 8'hb3;
//  assign sbox[8'h4c] = 8'h29;
//  assign sbox[8'h4d] = 8'he3;
//  assign sbox[8'h4e] = 8'h2f;
//  assign sbox[8'h4f] = 8'h84;
//  assign sbox[8'h50] = 8'h53;
//  assign sbox[8'h51] = 8'hd1;
//  assign sbox[8'h52] = 8'h00;
//  assign sbox[8'h53] = 8'hed;
//  assign sbox[8'h54] = 8'h20;
//  assign sbox[8'h55] = 8'hfc;
//  assign sbox[8'h56] = 8'hb1;
//  assign sbox[8'h57] = 8'h5b;
//  assign sbox[8'h58] = 8'h6a;
//  assign sbox[8'h59] = 8'hcb;
//  assign sbox[8'h5a] = 8'hbe;
//  assign sbox[8'h5b] = 8'h39;
//  assign sbox[8'h5c] = 8'h4a;
//  assign sbox[8'h5d] = 8'h4c;
//  assign sbox[8'h5e] = 8'h58;
//  assign sbox[8'h5f] = 8'hcf;
//  assign sbox[8'h60] = 8'hd0;
//  assign sbox[8'h61] = 8'hef;
//  assign sbox[8'h62] = 8'haa;
//  assign sbox[8'h63] = 8'hfb;
//  assign sbox[8'h64] = 8'h43;
//  assign sbox[8'h65] = 8'h4d;
//  assign sbox[8'h66] = 8'h33;
//  assign sbox[8'h67] = 8'h85;
//  assign sbox[8'h68] = 8'h45;
//  assign sbox[8'h69] = 8'hf9;
//  assign sbox[8'h6a] = 8'h02;
//  assign sbox[8'h6b] = 8'h7f;
//  assign sbox[8'h6c] = 8'h50;
//  assign sbox[8'h6d] = 8'h3c;
//  assign sbox[8'h6e] = 8'h9f;
//  assign sbox[8'h6f] = 8'ha8;
//  assign sbox[8'h70] = 8'h51;
//  assign sbox[8'h71] = 8'ha3;
//  assign sbox[8'h72] = 8'h40;
//  assign sbox[8'h73] = 8'h8f;
//  assign sbox[8'h74] = 8'h92;
//  assign sbox[8'h75] = 8'h9d;
//  assign sbox[8'h76] = 8'h38;
//  assign sbox[8'h77] = 8'hf5;
//  assign sbox[8'h78] = 8'hbc;
//  assign sbox[8'h79] = 8'hb6;
//  assign sbox[8'h7a] = 8'hda;
//  assign sbox[8'h7b] = 8'h21;
//  assign sbox[8'h7c] = 8'h10;
//  assign sbox[8'h7d] = 8'hff;
//  assign sbox[8'h7e] = 8'hf3;
//  assign sbox[8'h7f] = 8'hd2;
//  assign sbox[8'h80] = 8'hcd;
//  assign sbox[8'h81] = 8'h0c;
//  assign sbox[8'h82] = 8'h13;
//  assign sbox[8'h83] = 8'hec;
//  assign sbox[8'h84] = 8'h5f;
//  assign sbox[8'h85] = 8'h97;
//  assign sbox[8'h86] = 8'h44;
//  assign sbox[8'h87] = 8'h17;
//  assign sbox[8'h88] = 8'hc4;
//  assign sbox[8'h89] = 8'ha7;
//  assign sbox[8'h8a] = 8'h7e;
//  assign sbox[8'h8b] = 8'h3d;
//  assign sbox[8'h8c] = 8'h64;
//  assign sbox[8'h8d] = 8'h5d;
//  assign sbox[8'h8e] = 8'h19;
//  assign sbox[8'h8f] = 8'h73;
//  assign sbox[8'h90] = 8'h60;
//  assign sbox[8'h91] = 8'h81;
//  assign sbox[8'h92] = 8'h4f;
//  assign sbox[8'h93] = 8'hdc;
//  assign sbox[8'h94] = 8'h22;
//  assign sbox[8'h95] = 8'h2a;
//  assign sbox[8'h96] = 8'h90;
//  assign sbox[8'h97] = 8'h88;
//  assign sbox[8'h98] = 8'h46;
//  assign sbox[8'h99] = 8'hee;
//  assign sbox[8'h9a] = 8'hb8;
//  assign sbox[8'h9b] = 8'h14;
//  assign sbox[8'h9c] = 8'hde;
//  assign sbox[8'h9d] = 8'h5e;
//  assign sbox[8'h9e] = 8'h0b;
//  assign sbox[8'h9f] = 8'hdb;
//  assign sbox[8'ha0] = 8'he0;
//  assign sbox[8'ha1] = 8'h32;
//  assign sbox[8'ha2] = 8'h3a;
//  assign sbox[8'ha3] = 8'h0a;
//  assign sbox[8'ha4] = 8'h49;
//  assign sbox[8'ha5] = 8'h06;
//  assign sbox[8'ha6] = 8'h24;
//  assign sbox[8'ha7] = 8'h5c;
//  assign sbox[8'ha8] = 8'hc2;
//  assign sbox[8'ha9] = 8'hd3;
//  assign sbox[8'haa] = 8'hac;
//  assign sbox[8'hab] = 8'h62;
//  assign sbox[8'hac] = 8'h91;
//  assign sbox[8'had] = 8'h95;
//  assign sbox[8'hae] = 8'he4;
//  assign sbox[8'haf] = 8'h79;
//  assign sbox[8'hb0] = 8'he7;
//  assign sbox[8'hb1] = 8'hc8;
//  assign sbox[8'hb2] = 8'h37;
//  assign sbox[8'hb3] = 8'h6d;
//  assign sbox[8'hb4] = 8'h8d;
//  assign sbox[8'hb5] = 8'hd5;
//  assign sbox[8'hb6] = 8'h4e;
//  assign sbox[8'hb7] = 8'ha9;
//  assign sbox[8'hb8] = 8'h6c;
//  assign sbox[8'hb9] = 8'h56;
//  assign sbox[8'hba] = 8'hf4;
//  assign sbox[8'hbb] = 8'hea;
//  assign sbox[8'hbc] = 8'h65;
//  assign sbox[8'hbd] = 8'h7a;
//  assign sbox[8'hbe] = 8'hae;
//  assign sbox[8'hbf] = 8'h08;
//  assign sbox[8'hc0] = 8'hba;
//  assign sbox[8'hc1] = 8'h78;
//  assign sbox[8'hc2] = 8'h25;
//  assign sbox[8'hc3] = 8'h2e;
//  assign sbox[8'hc4] = 8'h1c;
//  assign sbox[8'hc5] = 8'ha6;
//  assign sbox[8'hc6] = 8'hb4;
//  assign sbox[8'hc7] = 8'hc6;
//  assign sbox[8'hc8] = 8'he8;
//  assign sbox[8'hc9] = 8'hdd;
//  assign sbox[8'hca] = 8'h74;
//  assign sbox[8'hcb] = 8'h1f;
//  assign sbox[8'hcc] = 8'h4b;
//  assign sbox[8'hcd] = 8'hbd;
//  assign sbox[8'hce] = 8'h8b;
//  assign sbox[8'hcf] = 8'h8a;
//  assign sbox[8'hd0] = 8'h70;
//  assign sbox[8'hd1] = 8'h3e;
//  assign sbox[8'hd2] = 8'hb5;
//  assign sbox[8'hd3] = 8'h66;
//  assign sbox[8'hd4] = 8'h48;
//  assign sbox[8'hd5] = 8'h03;
//  assign sbox[8'hd6] = 8'hf6;
//  assign sbox[8'hd7] = 8'h0e;
//  assign sbox[8'hd8] = 8'h61;
//  assign sbox[8'hd9] = 8'h35;
//  assign sbox[8'hda] = 8'h57;
//  assign sbox[8'hdb] = 8'hb9;
//  assign sbox[8'hdc] = 8'h86;
//  assign sbox[8'hdd] = 8'hc1;
//  assign sbox[8'hde] = 8'h1d;
//  assign sbox[8'hdf] = 8'h9e;
//  assign sbox[8'he0] = 8'he1;
//  assign sbox[8'he1] = 8'hf8;
//  assign sbox[8'he2] = 8'h98;
//  assign sbox[8'he3] = 8'h11;
//  assign sbox[8'he4] = 8'h69;
//  assign sbox[8'he5] = 8'hd9;
//  assign sbox[8'he6] = 8'h8e;
//  assign sbox[8'he7] = 8'h94;
//  assign sbox[8'he8] = 8'h9b;
//  assign sbox[8'he9] = 8'h1e;
//  assign sbox[8'hea] = 8'h87;
//  assign sbox[8'heb] = 8'he9;
//  assign sbox[8'hec] = 8'hce;
//  assign sbox[8'hed] = 8'h55;
//  assign sbox[8'hee] = 8'h28;
//  assign sbox[8'hef] = 8'hdf;
//  assign sbox[8'hf0] = 8'h8c;
//  assign sbox[8'hf1] = 8'ha1;
//  assign sbox[8'hf2] = 8'h89;
//  assign sbox[8'hf3] = 8'h0d;
//  assign sbox[8'hf4] = 8'hbf;
//  assign sbox[8'hf5] = 8'he6;
//  assign sbox[8'hf6] = 8'h42;
//  assign sbox[8'hf7] = 8'h68;
//  assign sbox[8'hf8] = 8'h41;
//  assign sbox[8'hf9] = 8'h99;
//  assign sbox[8'hfa] = 8'h2d;
//  assign sbox[8'hfb] = 8'h0f;
//  assign sbox[8'hfc] = 8'hb0;
//  assign sbox[8'hfd] = 8'h54;
//  assign sbox[8'hfe] = 8'hbb;
//  assign sbox[8'hff] = 8'h16;
//
//endmodule
//
//
//






module key_mem(
				 input wire            clk,
				 input wire            reset_n,

				 input wire [255 : 0]  key,
				 input wire [3:0]      keylen,
				 input wire            init,

				 input wire    [3 : 0] round_number, // from 0:10 => 128 || from 0 : 14 => 256
				 output wire [127 : 0] round_key,
				 output wire           ready,


				 output wire [31 : 0]  sboxw,
				 input wire  [31 : 0]  new_sboxw
				);
					

	//----------------------------------------------------------------
		// Parameters.
		//----------------------------------------------------------------
		localparam AES_128_BIT_KEY = 4'h0;
		localparam AES_192_BIT_KEY = 4'h1;
		localparam AES_256_BIT_KEY = 4'h2;

		localparam AES_128_NUM_ROUNDS = 4'ha;
		localparam AES_192_NUM_ROUNDS = 4'hc;	
		localparam AES_256_NUM_ROUNDS = 4'he;

		localparam CTRL_IDLE     = 3'h0;
		localparam CTRL_INIT     = 3'h1;
		localparam CTRL_GENERATE = 3'h2;
		localparam CTRL_DONE     = 3'h3;
  
		//----------------------------------------------------------------
		// Registers.
		//----------------------------------------------------------------
		reg [127 : 0] key_mem [0 : 14];
		reg [127 : 0] key_mem_new;

		// 256-Bit Key
		reg [127 : 0] prev_key0_reg;
		reg [127 : 0] prev_key0_new;
		
		// 128-Bit Key
		reg [127 : 0] prev_key1_reg;
		reg [127 : 0] prev_key1_new;

		reg [3 : 0] round_ctr_reg;
		reg [3 : 0] round_ctr_new;
		reg         round_ctr_rst;
		reg         round_ctr_inc;

		reg [2 : 0] key_mem_ctrl_reg;
		reg [2 : 0] key_mem_ctrl_new;

		reg         ready_reg;
		reg         ready_new;

		reg [7 : 0] rcon_reg;
		reg [7 : 0] rcon_new;
		reg         rcon_set;
		reg         rcon_next;
  
	//----------------------------------------------------------------
	// Wires.
	//----------------------------------------------------------------
	reg [31 : 0]  tmp_sboxw;
	reg           round_key_update;
	reg [127 : 0] tmp_round_key;
	reg [191 : 0] tmp_round_key_192;
	//----------------------------------------------------------------
	// Concurrent assignments for ports.
	//----------------------------------------------------------------
	assign round_key = tmp_round_key; // tmp_round key is the round key o/p of the module	end
	assign ready     = ready_reg;
	assign sboxw     = tmp_sboxw; // tmp_sboxw is the output of the module
	
	//----------------------------------------------------------------
	// reg_update
	//
	// Update functionality for all registers in the core.
	// All registers are positive edge triggered with asynchronous
	// active low reset. All registers have write enable.
	//----------------------------------------------------------------
	always @ (posedge clk or negedge reset_n)
	begin: reg_update
	integer i;

	if (!reset_n)
	  begin
		 for (i = 0 ; i <= AES_256_NUM_ROUNDS ; i = i + 1)
			key_mem [i] <= 128'h0; // initialization of the 14 keys
			
		 ready_reg        <= 1'b0;
		 rcon_reg         <= 8'h0;
		 round_ctr_reg    <= 4'h0;
		 prev_key0_reg    <= 128'h0;
		 prev_key1_reg    <= 128'h0;
		 key_mem_ctrl_reg <= CTRL_IDLE;
	  end
	else
	  begin
			ready_reg <= ready_new;

			rcon_reg <= rcon_new;

			round_ctr_reg <= round_ctr_new;

			key_mem[round_ctr_reg] <= key_mem_new;

			
			prev_key0_reg <= prev_key0_new;

			prev_key1_reg <= prev_key1_new;
			
			key_mem_ctrl_reg <= key_mem_ctrl_new;
	  end
	end // reg_update
	
	//----------------------------------------------------------------
	// key_mem_read
	//
	// Combinational read port for the key memory.
	//----------------------------------------------------------------
	always @*
	begin : key_mem_read
			tmp_round_key = key_mem[round_number];
	end // key_mem_read

	//----------------------------------------------------------------
	// round_key_gen
	//
	// The round key generator logic for AES-128 and AES-256.
	//----------------------------------------------------------------
	always @*
	begin: round_key_gen
	reg [31 : 0] w0, w1, w2, w3, w4, w5, w6, w7;
	reg [31 : 0] new_key_word_0, new_key_word_1, new_key_word_2, new_key_word_3;
	reg [31 : 0] rconw, sub_rotated_w, subbed_w, sub_xor_rconw,func_out_w;

	// Default assignments.
	key_mem_new   		= 128'h0;
	prev_key0_new 		= 128'h0;
	prev_key1_new 		= 128'h0;
	
	new_key_word_0 = 32'h0;
	new_key_word_1 = 32'h0;
	new_key_word_2 = 32'h0;
	new_key_word_3 = 32'h0;
	
	rcon_set   = 1'b1;
	rcon_next  = 1'b0;
	
	// Extract words and calculate intermediate values.
	// Perform rotation of sbox word etc.
		w0 = prev_key0_reg[127 : 096];
		w1 = prev_key0_reg[095 : 064];
		w2 = prev_key0_reg[063 : 032];
		w3 = prev_key0_reg[031 : 000];

		w4 = prev_key1_reg[127 : 096];
		w5 = prev_key1_reg[095 : 064];
		w6 = prev_key1_reg[063 : 032];
		w7 = prev_key1_reg[031 : 000];


	rconw = {rcon_reg, 24'h0};
	if(keylen == AES_192_BIT_KEY)begin 
		if(round_ctr_reg == 4'h1) begin
			tmp_sboxw = w5;
		end
		else if (round_ctr_reg == 4'h4 || round_ctr_reg == 4'h7 || round_ctr_reg == 4'ha) begin
			tmp_sboxw = w3 ^ w7 ^ w2;
		end
		else begin 	
			tmp_sboxw = w7;
		end

	end
	else begin
		tmp_sboxw = w7;
	end

	sub_rotated_w = {new_sboxw[23 : 00], new_sboxw[31 : 24]};
	func_out_w = sub_rotated_w ^ rconw;
	subbed_w = new_sboxw;
	
// Generate the specific round keys.
if (round_key_update)
begin
rcon_set   = 1'b0;
case (keylen)
AES_128_BIT_KEY:
begin
 if (round_ctr_reg == 0)
	begin
	  key_mem_new   = key[255 : 128];
	  prev_key1_new = key[255 : 128];
	  rcon_next     = 1'b1;
	end
 else
	begin
		new_key_word_0 = w4 ^ func_out_w;
		new_key_word_1 = w5 ^ w4 ^ func_out_w;
		new_key_word_2 = w6 ^ w5 ^ w4 ^ func_out_w;
		new_key_word_3 = w7 ^ w6 ^ w5 ^ w4 ^ func_out_w;

		key_mem_new   = {new_key_word_0, new_key_word_1, new_key_word_2, new_key_word_3};
		prev_key1_new = {new_key_word_0, new_key_word_1, new_key_word_2, new_key_word_3};
		rcon_next     = 1'b1;

	end
end

AES_192_BIT_KEY:
begin
 if (round_ctr_reg == 0)
	begin
		key_mem_new   = key[255 : 128];
		prev_key0_new = key[255 : 128];
		prev_key1_new = {key[127 : 64],64'h0};
		rcon_next     = 1'b1;
	end
	 else if (round_ctr_reg == 1)
		begin
			new_key_word_0 = w0 ^ func_out_w;
			new_key_word_1 = w1 ^ w0 ^ func_out_w;
			key_mem_new   = {key[127 : 64],new_key_word_0,new_key_word_1};
			prev_key1_new = {key[127 : 64],new_key_word_0,new_key_word_1};
			prev_key0_new = key[255 : 128];

		end
 else
	begin
			if ((round_ctr_reg + 1) % 3 == 1'b0)
			begin
				new_key_word_0 = w7 ^ w2;
				new_key_word_1 = w3 ^ w7 ^ w2;
				new_key_word_2 = w4 ^ w3 ^ w7 ^ w2;
				new_key_word_3 = w5 ^ w4 ^ w3 ^ w7 ^ w2;
			end
			else if ((round_ctr_reg) % 3 == 1'b0)
			begin
				new_key_word_0 = w2 ^ func_out_w;
				new_key_word_1 = w3 ^ w2 ^ func_out_w;
				new_key_word_2 = w4 ^ w3 ^ w2 ^ func_out_w;
				new_key_word_3 = w5 ^ w4 ^ w3 ^ w2 ^ func_out_w;
				rcon_next     		= 1'b1;
			end
			else if ((round_ctr_reg - 1) % 3 == 1'b0)
			begin
				new_key_word_0 = w7 ^ w2;
				new_key_word_1 = w3 ^ w7 ^ w2;
				new_key_word_2 = w4 ^ func_out_w;
				new_key_word_3 = w5 ^ w4 ^ func_out_w;
			end

			key_mem_new   		= {new_key_word_0, new_key_word_1, new_key_word_2, new_key_word_3};
			prev_key1_new 		= {new_key_word_0, new_key_word_1, new_key_word_2, new_key_word_3};
			prev_key0_new 		= prev_key1_reg;			
	end
end

AES_256_BIT_KEY:
begin
 if (round_ctr_reg == 0)
	begin
	  key_mem_new   = key[255 : 128];
	  prev_key0_new = key[255 : 128];
	  rcon_next     = 1'b0;
	end
 else if (round_ctr_reg == 1)
	begin
	  key_mem_new   = key[127 : 0];
	  prev_key1_new = key[127 : 0];
	  prev_key0_new = key[255 : 128];
	  rcon_next     = 1'b1;
	end
 else
	begin
	  if (round_ctr_reg[0] == 0)
		 begin
			new_key_word_0 = w0 ^ func_out_w;
			new_key_word_1 = w1 ^ w0 ^ func_out_w;
			new_key_word_2 = w2 ^ w1 ^ w0 ^ func_out_w;
			new_key_word_3 = w3 ^ w2 ^ w1 ^ w0 ^ func_out_w;

		 end
	  else
		 begin
			new_key_word_0 = w0 ^ subbed_w;
			new_key_word_1 = w1 ^ w0 ^ subbed_w;
			new_key_word_2 = w2 ^ w1 ^ w0 ^ subbed_w;
			new_key_word_3 = w3 ^ w2 ^ w1 ^ w0 ^ subbed_w;
		 end
		if(round_ctr_reg == 4'h3) begin  rcon_next = 1'b0; end
		else if(round_ctr_reg == 4'h4) begin  rcon_next = 1'b0; end
		else if(round_ctr_reg == 4'h5) begin  rcon_next = 1'b1; end
		else if(round_ctr_reg == 4'h6) begin  rcon_next = 1'b0; end
		else if(round_ctr_reg == 4'h7) begin  rcon_next = 1'b0; end
		else if(round_ctr_reg == 4'h8) begin  rcon_next = 1'b0; end
		else if(round_ctr_reg == 4'h9) begin  rcon_next = 1'b1; end
		else if(round_ctr_reg == 4'ha) begin  rcon_next = 1'b0; end
		else if(round_ctr_reg == 4'hb) begin  rcon_next = 1'b0; end
		else if(round_ctr_reg == 4'hc) begin  rcon_next = 1'b0; end
		else if(round_ctr_reg == 4'hd) begin  rcon_next = 1'b1; end
		else if(round_ctr_reg == 4'he) begin  rcon_next = 1'b1; end
	  // Store the generated round keys.
	  key_mem_new   = {new_key_word_0, new_key_word_1, new_key_word_2, new_key_word_3};
	  prev_key1_new = {new_key_word_0, new_key_word_1, new_key_word_2, new_key_word_3};
	  prev_key0_new = prev_key1_reg;
	end
end

default:
begin
end
endcase // case (keylen)
end
end // round_key_gen
  //----------------------------------------------------------------
  // rcon_logic
  //
  // Caclulates the rcon value for the different key expansion
  // iterations.
  //----------------------------------------------------------------
  always @*
    begin : rcon_logic
      reg [7 : 0] tmp_rcon;
      //rcon_new = 8'h00;

      tmp_rcon = {rcon_reg[6 : 0], 1'b0} ^ (8'h1b & {8{rcon_reg[7]}}); // first round => 0001 1010 ^ 0001 1011 = 01
		if (rcon_next)
        begin
          rcon_new = tmp_rcon[7 : 0];
        end
      else if (rcon_set)
        begin
          rcon_new = 8'h8d;
        end

      
    end


  //----------------------------------------------------------------
  // round_ctr
  //
  // The round counter logic with increase and reset.
  //----------------------------------------------------------------
  always @*
    begin : round_ctr
      //round_ctr_new = 4'h0;

      if (round_ctr_rst)
        begin
          round_ctr_new = 4'h0;
        end

      else if (round_ctr_inc)
        begin
          round_ctr_new = round_ctr_reg + 1'b1;
        end
    end
  //----------------------------------------------------------------
  // key_mem_ctrl
  //
  //
  // The FSM that controls the round key generation.
  //----------------------------------------------------------------
  always @*
    begin: key_mem_ctrl
      reg [3 : 0] num_rounds;

      // Default assignments.
      ready_new        = 1'b0;
      round_key_update = 1'b0;
      round_ctr_rst    = 1'b0;
      round_ctr_inc    = 1'b0;

      if (keylen == AES_128_BIT_KEY)
        num_rounds = AES_128_NUM_ROUNDS;
      else if (keylen == AES_192_BIT_KEY)
			num_rounds = AES_192_NUM_ROUNDS;
		else
        num_rounds = AES_256_NUM_ROUNDS;

      case(key_mem_ctrl_reg)
        CTRL_IDLE:
          begin
            if (init)
              begin
                ready_new = 1'b0;
                key_mem_ctrl_new = CTRL_INIT;
              end
          end

        CTRL_INIT:
          begin
            round_ctr_rst    = 1'b1;
            key_mem_ctrl_new = CTRL_GENERATE;
          end

        CTRL_GENERATE:
          begin
            round_ctr_inc    = 1'b1;
            round_key_update = 1'b1;
            if (round_ctr_reg == num_rounds)
              begin
                key_mem_ctrl_new = CTRL_DONE;
              end
          end

        CTRL_DONE:
          begin
            ready_new        = 1'b1;
            key_mem_ctrl_new = CTRL_IDLE;
          end

        default:
          begin
				key_mem_ctrl_new = CTRL_IDLE;
          end
      endcase // case (key_mem_ctrl_reg)

    end // key_mem_ctrl
endmodule // aes_key_mem