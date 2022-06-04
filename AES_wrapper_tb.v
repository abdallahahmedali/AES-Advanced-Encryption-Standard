module AES_wrapper_tb();

  //----------------------------------------------------------------
  // Internal constant and parameter definitions.
  //----------------------------------------------------------------
  parameter DEBUG     = 0;
  parameter DUMP_WAIT = 0;

  parameter CLK_HALF_PERIOD = 1;
  parameter CLK_PERIOD = 2 * CLK_HALF_PERIOD;

  parameter AES_128_BIT_KEY = 4'h0;
  parameter AES_192_BIT_KEY = 4'h1;
  parameter AES_256_BIT_KEY = 4'h2;

  parameter AES_DECIPHER = 1'b0;
  parameter AES_ENCIPHER = 1'b1;


  reg            tb_clk;
  reg            tb_reset_n;
  wire           tb_ready;
  wire           tb_result_valid;
  wire           tb_result_correct;
	wire tb_key_exp_done;

  //----------------------------------------------------------------
  // Device Under Test.
  //----------------------------------------------------------------
  AES_wrapper dut(
               .clk(tb_clk),
               .reset_n(tb_reset_n),

               .ready(tb_ready),
					
					.result_valid(tb_result_valid),
					.result_correct(tb_result_correct),
					.key_exp_done(tb_key_exp_done)
					
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
      $display("*** Toggle reset.");
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

      tb_clk     = 0;
      tb_reset_n = 1;

    end
  endtask // init_sim

  task wait_ready;
    begin
      while (!tb_ready)
        begin
          #(CLK_PERIOD);
        end
    end
  endtask // wait_ready

  initial
    begin : aes_main_test
      reg [255 : 0] key;

      reg [127 : 0] text;

      reg [127 : 0] expected_enc;


		text 			 = 128'h00112233445566778899aabbccddeeff;
      expected_enc = 128'h69c4e0d86a7b0430d8cdb78070b4c55a;


		init_sim();
		reset_dut();

		 end // aes_main_test
endmodule // tb_aes_main