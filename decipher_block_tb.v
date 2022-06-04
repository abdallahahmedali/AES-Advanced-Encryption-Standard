module decipher_block_tb();

  //----------------------------------------------------------------
  // Internal constant and parameter definitions.
  //----------------------------------------------------------------
  parameter DEBUG     = 1;
  parameter DUMP_WAIT = 0;

  parameter CLK_HALF_PERIOD = 1;
  parameter CLK_PERIOD = 2 * CLK_HALF_PERIOD;

  parameter AES_128_BIT_KEY = 4'h0;
  parameter AES_192_BIT_KEY = 4'h1;
  parameter AES_256_BIT_KEY = 4'h2;

  parameter AES_DECIPHER = 1'b0;
  parameter AES_ENCIPHER = 1'b1;


  //----------------------------------------------------------------
  // Register and Wire declarations.
  //----------------------------------------------------------------
  reg [31 : 0]   cycle_ctr;
  reg [31 : 0]   error_ctr;
  reg [31 : 0]   tc_ctr;

  reg            tb_clk;
  reg            tb_reset_n;

  reg            tb_next;
  reg  [3 : 0]   tb_keylen;
  wire           tb_ready;
  wire [3 : 0]   tb_round;
  wire [127 : 0] tb_round_key;

  reg [127 : 0]  tb_block;
  wire [127 : 0] tb_new_block;

  reg [127 : 0] key_mem [0 : 14];


  //----------------------------------------------------------------
  // Assignments.
  //----------------------------------------------------------------
  assign tb_round_key = key_mem[tb_round];


  //----------------------------------------------------------------
  // Device Under Test.
  //----------------------------------------------------------------
  decipher_block dut(
                         .clk(tb_clk),
                         .reset_n(tb_reset_n),

                         .next(tb_next),

                         .keylen(tb_keylen),
                         .round(tb_round),
                         .round_key(tb_round_key),

                         .block(tb_block),
                         .new_block(tb_new_block),
								 .ready(tb_ready)
                        );


  //----------------------------------------------------------------
  // clk_gen
  //
  // Always running clock generator process.
  //----------------------------------------------------------------
  always
    begin : clk_gen
      #CLK_HALF_PERIOD;
      tb_clk = !tb_clk;
    end // clk_gen


  //----------------------------------------------------------------
  // reset_dut()
  //
  // Toggle reset to put the DUT into a well known state.
  //----------------------------------------------------------------
  task reset_dut;
    begin
      tb_reset_n = 0;
      #(2 * CLK_PERIOD);
      tb_reset_n = 1;
    end
  endtask // reset_dut


  //----------------------------------------------------------------
  // init_sim()
  //
  // Initialize all counters and testbed functionality as well
  // as setting the DUT inputs to defined values.
  //----------------------------------------------------------------
  task init_sim;
    begin
      cycle_ctr    = 0;
      tc_ctr       = 0;

      tb_clk       = 0;
      tb_reset_n   = 1;

      tb_next      = 0;
      tb_keylen    = 4'h0;

      tb_block     = {4{32'h00000000}};
    end
  endtask // init_sim


  //----------------------------------------------------------------
  // wait_ready()
  //
  // Wait for the ready flag in the dut to be set.
  //
  // Note: It is the callers responsibility to call the function
  // when the dut is actively processing and will in fact at some
  // point set the flag.
  //----------------------------------------------------------------
  task wait_ready;
    begin
      while (!tb_ready)
        begin
          #(CLK_PERIOD);
          if (DUMP_WAIT)
            begin
            end
        end
    end
  endtask // wait_ready


  //----------------------------------------------------------------
  // test_ecb_de()
  //
  // Perform ECB mode encryption test.
  //----------------------------------------------------------------
  task test_ecb_dec(
                    input  [3 : 0]  key_length,
                    input [127 : 0] block,
                    input [127 : 0] expected);
   begin
     // Init the cipher with the given key and length.
     tb_keylen = key_length;

     // Perform decipher operation on the block.
     tb_block = block;
     tb_next = 1;
     #(2 * CLK_PERIOD);
     tb_next = 0;
     #(2 * CLK_PERIOD);

     wait_ready();

     if (tb_new_block == expected)
       begin
         $display("*** TC %0d successful.", tc_ctr);
         $display("");
       end
		 else
       begin
         $display("*** ERROR: TC %0d NOT successful.", tc_ctr);
         $display("Expected: 0x%032x", expected);
         $display("Got:      0x%032x", tb_new_block);
         $display("");

         error_ctr = error_ctr + 1;
       end
     tc_ctr = tc_ctr + 1;
   end
  endtask // ecb_mode_single_block_test


  //----------------------------------------------------------------
  // tb_aes_decipher_block
  // The main test functionality.
  //
  // Test cases taken from NIST SP 800-38A:
  // http://csrc.nist.gov/publications/nistpubs/800-38a/sp800-38a.pdf
  //----------------------------------------------------------------
  initial
    begin : tb_aes_decipher_block
      reg [127 : 0] nist_plaintext0;
      reg [127 : 0] nist_plaintext1;
      reg [127 : 0] nist_plaintext2;
      reg [127 : 0] nist_plaintext3;

      reg [127 : 0] nist_ecb_128_dec_ciphertext0;
      reg [127 : 0] nist_ecb_128_dec_ciphertext1;
      reg [127 : 0] nist_ecb_128_dec_ciphertext2;
      reg [127 : 0] nist_ecb_128_dec_ciphertext3;

      reg [127 : 0] nist_ecb_256_dec_ciphertext0;
      reg [127 : 0] nist_ecb_256_dec_ciphertext1;
      reg [127 : 0] nist_ecb_256_dec_ciphertext2;
      reg [127 : 0] nist_ecb_256_dec_ciphertext3;

      //nist_plaintext0 = 128'h6bc1bee22e409f96e93d7e117393172a;
		nist_plaintext0 = 128'h00112233445566778899aabbccddeeff;
      nist_plaintext1 = 128'hae2d8a571e03ac9c9eb76fac45af8e51;
      nist_plaintext2 = 128'h30c81c46a35ce411e5fbc1191a0a52ef;
      nist_plaintext3 = 128'hf69f2445df4f9b17ad2b417be66c3710;

		nist_ecb_128_dec_ciphertext0 = 128'h69c4e0d86a7b0430d8cdb78070b4c55a;
      //nist_ecb_128_dec_ciphertext0 = 128'h3ad77bb40d7a3660a89ecaf32466ef97;
      nist_ecb_128_dec_ciphertext1 = 128'hf5d3d58503b9699de785895a96fdbaaf;
      nist_ecb_128_dec_ciphertext2 = 128'h43b1cd7f598ece23881b00e3ed030688;
      nist_ecb_128_dec_ciphertext3 = 128'h7b0c785e27e8ad3f8223207104725dd4;

      nist_ecb_256_dec_ciphertext0 = 255'hf3eed1bdb5d2a03c064b5a7e3db181f8;
      nist_ecb_256_dec_ciphertext1 = 255'h591ccb10d410ed26dc5ba74a31362870;
      nist_ecb_256_dec_ciphertext2 = 255'hb6ed21b99ca6f4f9f153e7b1beafed1d;
      nist_ecb_256_dec_ciphertext3 = 255'h23304b7a39f9f3ff067d8d8f9e24ecc7;

      init_sim();
      reset_dut();


      // NIST 128 bit ECB tests.
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

      test_ecb_dec(AES_128_BIT_KEY, nist_ecb_128_dec_ciphertext0, nist_plaintext0);
//      test_ecb_dec(AES_128_BIT_KEY, nist_ecb_128_dec_ciphertext1, nist_plaintext1);
//      test_ecb_dec(AES_128_BIT_KEY, nist_ecb_128_dec_ciphertext2, nist_plaintext2);
//      test_ecb_dec(AES_128_BIT_KEY, nist_ecb_128_dec_ciphertext3, nist_plaintext3);


//      // NIST 256 bit ECB tests.
//      key_mem[00] = 128'h603deb1015ca71be2b73aef0857d7781;
//      key_mem[01] = 128'h1f352c073b6108d72d9810a30914dff4;
//      key_mem[02] = 128'h9ba354118e6925afa51a8b5f2067fcde;
//      key_mem[03] = 128'ha8b09c1a93d194cdbe49846eb75d5b9a;
//      key_mem[04] = 128'hd59aecb85bf3c917fee94248de8ebe96;
//      key_mem[05] = 128'hb5a9328a2678a647983122292f6c79b3;
//      key_mem[06] = 128'h812c81addadf48ba24360af2fab8b464;
//      key_mem[07] = 128'h98c5bfc9bebd198e268c3ba709e04214;
//      key_mem[08] = 128'h68007bacb2df331696e939e46c518d80;
//      key_mem[09] = 128'hc814e20476a9fb8a5025c02d59c58239;
//      key_mem[10] = 128'hde1369676ccc5a71fa2563959674ee15;
//      key_mem[11] = 128'h5886ca5d2e2f31d77e0af1fa27cf73c3;
//      key_mem[12] = 128'h749c47ab18501ddae2757e4f7401905a;
//      key_mem[13] = 128'hcafaaae3e4d59b349adf6acebd10190d;
//      key_mem[14] = 128'hfe4890d1e6188d0b046df344706c631e;
//
//      test_ecb_dec(AES_256_BIT_KEY, nist_ecb_256_dec_ciphertext0, nist_plaintext0);
//      test_ecb_dec(AES_256_BIT_KEY, nist_ecb_256_dec_ciphertext1, nist_plaintext1);
//      test_ecb_dec(AES_256_BIT_KEY, nist_ecb_256_dec_ciphertext2, nist_plaintext2);
//      test_ecb_dec(AES_256_BIT_KEY, nist_ecb_256_dec_ciphertext3, nist_plaintext3);


      $display("*** AES decipher block module simulation done. ***");
      $finish;
    end // aes_core_test
endmodule // tb_aes_decipher_block