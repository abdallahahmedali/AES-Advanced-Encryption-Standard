module encipher_block_tb();


  parameter CLK_HALF_PERIOD = 1;
  parameter CLK_PERIOD = 2 * CLK_HALF_PERIOD;
  
  parameter AES_128_BIT_KEY = 4'h0;
  parameter AES_192_BIT_KEY = 4'h1;
  parameter AES_256_BIT_KEY = 4'h2;
  
  parameter AES_ENCIPHER = 1'b1;

  reg            tb_clk;
  reg            tb_reset_n;

  reg            tb_next;
  reg  [3: 0]    tb_keylen;
  wire           tb_ready;
  wire [3 : 0]   tb_round;
  wire [127 : 0] tb_round_key;

  wire [31 : 0]  tb_sboxw;
  wire [31 : 0]  tb_new_sboxw;

  reg [127 : 0]  tb_block;
  wire [127 : 0] tb_new_block;

  reg [127 : 0] key_mem [0 : 14];
  


//----------------------------------------------------------------
  // Assignments.
  //----------------------------------------------------------------
  assign tb_round_key = key_mem[tb_round];

  s_box sbox(
                .state(tb_sboxw),
                .new_state(tb_new_sboxw)
               );


  // The device under test.
  encipher_block dut(
                         .clk(tb_clk),
                         .reset_n(tb_reset_n),

                         .next(tb_next),

                         .keylen(tb_keylen),
                         .round_number(tb_round),
                         .round_key(tb_round_key),

                         .sboxw(tb_sboxw),
                         .new_sboxw(tb_new_sboxw),

                         .block(tb_block),
                         .new_block(tb_new_block),
                         .ready(tb_ready)
                        );

  always
    begin : clk_gen
      #CLK_HALF_PERIOD;
      tb_clk = !tb_clk;
    end // clk_gen


  initial
    begin
      
      tb_clk       = 0;
      tb_reset_n   = 1;

      tb_next      = 0;
      tb_keylen    = 0;

      tb_block     = {4{32'h00000000}};
		
		tb_reset_n = 0;
      #(2 * CLK_PERIOD);
      tb_reset_n = 1;
		// 128 key
      key_mem[00] = 128'h000102030405060708090a0b0c0d0e0f;
      key_mem[01] = 128'hd6aa74fdd2af72fadaa678f1d6ab76fe;
      key_mem[02] = 128'hb692cf0b643dbdf1be9bc5006830b3fe;
      key_mem[03] = 128'hb6ff744ed2c2c9bf6c590cbf0469bf41;
      key_mem[04] = 128'h47f7f7bc95353e03f96c32bcfd058dfd;
      key_mem[05] = 128'h3caaa3e8a99f9deb50f3af57adf622aa;
      key_mem[06] = 128'h5e390f7df7a69296a7553dc10aa31f6b;
      key_mem[07] = 128'h14f9701ae35fe28c440adf4d4ea9c026;
      key_mem[08] = 128'h47438735a41c65b9e016baf4aebf7ad2;
      key_mem[09] = 128'h549932d1f08557681093ed9cbe2c974e;
      key_mem[10] = 128'h13111d7fe3944a17f307a78b4d2b30c5;
      key_mem[11] = 128'h00000000000000000000000000000000;
      key_mem[12] = 128'h00000000000000000000000000000000;
      key_mem[13] = 128'h00000000000000000000000000000000;
      key_mem[14] = 128'h00000000000000000000000000000000;
     

      tb_block  = 128'h00112233445566778899aabbccddeeff;

      tb_keylen = 4'h0;

		  tb_next = 1;
		  #(2 * CLK_PERIOD);
		  tb_next = 0;
		  #(2 * CLK_PERIOD);

		while (!tb_ready)
        begin
          #(CLK_PERIOD);
        end

		// 192 Key
		key_mem[00] = 128'h000102030405060708090a0b0c0d0e0f;
      key_mem[01] = 128'h10111213141516175846f2f95c43f4fe;
      key_mem[02] = 128'h544afef55847f0fa4856e2e95c43f4fe;
      key_mem[03] = 128'h40f949b31cbabd4d48f043b810b7b342;
      key_mem[04] = 128'h58e151ab04a2a5557effb5416245080c;
      key_mem[05] = 128'h2ab54bb43a02f8f662e3a95d66410c08;
      key_mem[06] = 128'hf501857297448d7ebdf1c6ca87f33e3c;
      key_mem[07] = 128'he510976183519b6934157c9ea351f1e0;
      key_mem[08] = 128'h1ea0372a995309167c439e77ff12051e;
      key_mem[09] = 128'hdd7e0e887e2fff68608fc842f9dcc154;
      key_mem[10] = 128'h859f5f237a8d5a3dc0c02952beefd63a;
      key_mem[11] = 128'hde601e7827bcdf2ca223800fd8aeda32;
      key_mem[12] = 128'ha4970a331a78dc09c418c271e3a41d5d;
      key_mem[13] = 128'h00000000000000000000000000000000;
      key_mem[14] = 128'h00000000000000000000000000000000;
		
		      tb_block  = 128'h00112233445566778899aabbccddeeff;

      tb_keylen = 4'h1;

		  tb_next = 1;
		  #(2 * CLK_PERIOD);
		  tb_next = 0;
		  #(2 * CLK_PERIOD);

		while (!tb_ready)
        begin
          #(CLK_PERIOD);
        end
		
		// 256 key
      key_mem[00] = 128'h000102030405060708090a0b0c0d0e0f;
      key_mem[01] = 128'h101112131415161718191a1b1c1d1e1f;
      key_mem[02] = 128'ha573c29fa176c498a97fce93a572c09c;
      key_mem[03] = 128'h1651a8cd0244beda1a5da4c10640bade;
      key_mem[04] = 128'hae87dff00ff11b68a68ed5fb03fc1567;
      key_mem[05] = 128'h6de1f1486fa54f9275f8eb5373b8518d;
      key_mem[06] = 128'hc656827fc9a799176f294cec6cd5598b;
      key_mem[07] = 128'h3de23a75524775e727bf9eb45407cf39;
      key_mem[08] = 128'h0bdc905fc27b0948ad5245a4c1871c2f;
      key_mem[09] = 128'h45f5a66017b2d387300d4d33640a820a;
      key_mem[10] = 128'h7ccff71cbeb4fe5413e6bbf0d261a7df;
      key_mem[11] = 128'hf01afafee7a82979d7a5644ab3afe640;
      key_mem[12] = 128'h2541fe719bf500258813bbd55a721c0a;
      key_mem[13] = 128'h4e5a6699a9f24fe07e572baacdf8cdea;
      key_mem[14] = 128'h24fc79ccbf0979e9371ac23c6d68de36;
		
	   tb_block  = 128'h00112233445566778899aabbccddeeff;

      tb_keylen = 4'h2;

		  tb_next = 1;
		  #(2 * CLK_PERIOD);
		  tb_next = 0;
		  #(2 * CLK_PERIOD);

		while (!tb_ready)
        begin
          #(CLK_PERIOD);
        end
      $finish;
    end // tb_aes_encipher_block
endmodule // tb_aes_encipher_block
