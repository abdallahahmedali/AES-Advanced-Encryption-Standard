module key_mem_tb();


  parameter CLK_HALF_PERIOD = 1;
  parameter CLK_PERIOD = 2 * CLK_HALF_PERIOD;

  parameter AES_128_BIT_KEY = 4'h0;
  parameter AES_192_BIT_KEY = 4'h1;
  parameter AES_256_BIT_KEY = 4'h2;

  parameter AES_128_NUM_ROUNDS = 4'ha;
  parameter AES_192_NUM_ROUNDS = 4'hc;
  parameter AES_256_NUM_ROUNDS = 4'he;

  parameter AES_DECIPHER = 1'b0;
  parameter AES_ENCIPHER = 1'b1;


  reg            tb_clk;
  reg            tb_reset_n;
  reg [255 : 0]  tb_key;
  reg [3:0]      tb_keylen;
  reg            tb_init;
  reg [3 : 0]    tb_round;
  wire [127 : 0] tb_round_key;
  wire           tb_ready;

  wire [31 : 0]  tb_sboxw;
  wire [31 : 0]  tb_new_sboxw;

  key_mem dut(
                  .clk(tb_clk),
                  .reset_n(tb_reset_n),

                  .key(tb_key),
                  .keylen(tb_keylen),
                  .init(tb_init),

                  .round_number(tb_round),
                  .round_key(tb_round_key),
                  .ready(tb_ready),

                  .sboxw(tb_sboxw),
                  .new_sboxw(tb_new_sboxw)
                 );


					  s_box my_sbox(.state(tb_sboxw), .new_state(tb_new_sboxw));


  always
    begin : clk_gen
      #CLK_HALF_PERIOD;
      tb_clk = !tb_clk;
    end // clk_gen



  task wait_ready;
    begin
      while (!tb_ready)
        begin
          #(CLK_PERIOD);
        end
    end
  endtask // wait_ready


  //----------------------------------------------------------------
  // aes_key_mem_test
  // The main test functionality.
  //----------------------------------------------------------------
  initial
    begin : aes_key_mem_test
      reg [255 : 0] key128;
		reg [255 : 0] key192;
      reg [255 : 0] key256;

      reg [127 : 0] expected_00;
      reg [127 : 0] expected_01;
      reg [127 : 0] expected_02;
      reg [127 : 0] expected_03;
      reg [127 : 0] expected_04;
      reg [127 : 0] expected_05;
      reg [127 : 0] expected_06;
      reg [127 : 0] expected_07;
      reg [127 : 0] expected_08;
      reg [127 : 0] expected_09;
      reg [127 : 0] expected_10;
      reg [127 : 0] expected_11;
      reg [127 : 0] expected_12;
      reg [127 : 0] expected_13;
      reg [127 : 0] expected_14;

      tb_clk     = 0;
      tb_reset_n = 1;
      tb_key     = {8{32'h00000000}};
      tb_keylen  = 0;
      tb_init    = 0;
      tb_round   = 4'h0;

      tb_reset_n = 0;
      #(2 * CLK_PERIOD);
      tb_reset_n = 1;
		

		      // AES-128 test case 3 key and expected values.
      key128    	= 256'h2b7e151628aed2a6abf7158809cf4f3c0000000000000000000000000000000;
      expected_00 = 128'h000102030405060708090a0b0c0d0e0f;
      expected_01 = 128'hd6aa74fdd2af72fadaa678f1d6ab76fe;
      expected_02 = 128'hb692cf0b643dbdf1be9bc5006830b3fe;
      expected_03 = 128'hb6ff744ed2c2c9bf6c590cbf0469bf41;
      expected_04 = 128'h47f7f7bc95353e03f96c32bcfd058dfd;
      expected_05 = 128'h3caaa3e8a99f9deb50f3af57adf622aa;
      expected_06 = 128'h5e390f7df7a69296a7553dc10aa31f6b;
      expected_07 = 128'h14f9701ae35fe28c440adf4d4ea9c026;
      expected_08 = 128'h47438735a41c65b9e016baf4aebf7ad2;
      expected_09 = 128'h549932d1f08557681093ed9cbe2c974e;
      expected_10 = 128'h13111d7fe3944a17f307a78b4d2b30c5;
		
		tb_key = key128;
      tb_keylen = AES_128_BIT_KEY;
      tb_init = 1;
      #(2 * CLK_PERIOD);
      tb_init = 0;
      wait_ready();	 
      #(100 *CLK_PERIOD);
		
		
    // AES-256 test case 2 key and expected values.
      key192    = 256'h8e73b0f7da0e6452c810f32b809079e562f8ead2522c6b7b0000000000000000;

      expected_00 = 128'hffffffffffffffffffffffffffffffff;
      expected_01 = 128'hffffffffffffffffffffffffffffffff;
      expected_02 = 128'he8e9e9e917161616e8e9e9e917161616;
      expected_03 = 128'h0fb8b8b8f04747470fb8b8b8f0474747;
      expected_04 = 128'h4a4949655d5f5f73b5b6b69aa2a0a08c;
      expected_05 = 128'h355858dcc51f1f9bcaa7a7233ae0e064;
      expected_06 = 128'hafa80ae5f2f755964741e30ce5e14380;
      expected_07 = 128'heca0421129bf5d8ae318faa9d9f81acd;
      expected_08 = 128'he60ab7d014fde24653bc014ab65d42ca;
      expected_09 = 128'ha2ec6e658b5333ef684bc946b1b3d38b;
      expected_10 = 128'h9b6c8a188f91685edc2d69146a702bde;
      expected_11 = 128'ha0bd9f782beeac9743a565d1f216b65a;
      expected_12 = 128'hfc22349173b35ccfaf9e35dbc5ee1e05;
      expected_13 = 128'h0695ed132d7b41846ede24559cc8920f;
      expected_14 = 128'h546d424f27de1e8088402b5b4dae355e;
					
			
			
		tb_key = key192;
      tb_keylen = AES_192_BIT_KEY;
      tb_init = 1;
      #(2 * CLK_PERIOD);
      tb_init = 0;
      wait_ready();	 
      #(100 *CLK_PERIOD);		


      // AES-256 test case 1 key and expected values.
      key256    = 256'h603deb1015ca71be2b73aef0857d77811f352c073b6108d72d9810a30914dff4;
      expected_00 = 128'h00000000000000000000000000000000;
      expected_01 = 128'h00000000000000000000000000000000;
      expected_02 = 128'h62636363626363636263636362636363;
      expected_03 = 128'haafbfbfbaafbfbfbaafbfbfbaafbfbfb;
      expected_04 = 128'h6f6c6ccf0d0f0fac6f6c6ccf0d0f0fac;
      expected_05 = 128'h7d8d8d6ad77676917d8d8d6ad7767691;
      expected_06 = 128'h5354edc15e5be26d31378ea23c38810e;
      expected_07 = 128'h968a81c141fcf7503c717a3aeb070cab;
      expected_08 = 128'h9eaa8f28c0f16d45f1c6e3e7cdfe62e9;
      expected_09 = 128'h2b312bdf6acddc8f56bca6b5bdbbaa1e;
      expected_10 = 128'h6406fd52a4f79017553173f098cf1119;
      expected_11 = 128'h6dbba90b0776758451cad331ec71792f;
      expected_12 = 128'he7b0e89c4347788b16760b7b8eb91a62;
      expected_13 = 128'h74ed0ba1739b7e252251ad14ce20d43b;
      expected_14 = 128'h10f80a1753bf729c45c979e7cb706385;

			
		tb_key = key256;
      tb_keylen = AES_256_BIT_KEY;
      tb_init = 1;
      #(2 * CLK_PERIOD);
      tb_init = 0;
      wait_ready();	 
      #(100 *CLK_PERIOD);		

#(100 *CLK_PERIOD);

      $finish;
    end // aes_key_mem_test
endmodule // tb_aes_key_mem