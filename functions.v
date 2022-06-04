//function [127 : 0] shiftrows(input [127 : 0] data);
//
//    reg [31 : 0] w0, w1, w2, w3;
//    reg [31 : 0] shifted_word_0, shifted_word_1, shifted_word_2, shifted_word_3;
//	 
//    begin
//	 
//      w0 = data[127 : 096];
//      w1 = data[095 : 064];
//      w2 = data[063 : 032];
//      w3 = data[031 : 000];
//
//      shifted_word_0 = {w0[31 : 24], w1[23 : 16], w2[15 : 08], w3[07 : 00]}; // 0 bytes are shifted
//      shifted_word_1 = {w1[31 : 24], w2[23 : 16], w3[15 : 08], w0[07 : 00]}; // 1 byte is shifted left
//      shifted_word_2 = {w2[31 : 24], w3[23 : 16], w0[15 : 08], w1[07 : 00]}; // 2 bytes are shifted left
//      shifted_word_3 = {w3[31 : 24], w0[23 : 16], w1[15 : 08], w2[07 : 00]}; // 3 bytes are shifted left
//
//      return {shifted_word_0, shifted_word_1, shifted_word_2, shifted_word_3};
//		
//    end
//	
//endfunction
//
//function [127 : 0] inv_shiftrows(input [127 : 0] data);
//
//	 reg [31 : 0] w0, w1, w2, w3;
//	 reg [31 : 0] shifted_word_0, shifted_word_1, shifted_word_2, shifted_word_3;
//	 
//	 begin
//		w0 = data[127 : 096];
//		w1 = data[095 : 064];
//		w2 = data[063 : 032];
//		w3 = data[031 : 000];
//
//		shifted_word_0 = {w0[31 : 24], w3[23 : 16], w2[15 : 08], w1[07 : 00]};
//		shifted_word_1 = {w1[31 : 24], w0[23 : 16], w3[15 : 08], w2[07 : 00]};
//		shifted_word_2 = {w2[31 : 24], w1[23 : 16], w0[15 : 08], w3[07 : 00]};
//		shifted_word_3 = {w3[31 : 24], w2[23 : 16], w1[15 : 08], w0[07 : 00]};
//
//		return {shifted_word_0, shifted_word_1, shifted_word_2, shifted_word_3};
//		
//	 end
//endfunction
//
//// multiplication in galois field
//
//function [7:0] mult_2(input [7:0] x);
//	
//	begin 
//			/* multiplication by 2 is shifting on bit to the left, and if the original 8 bits had a 1 @ msb, xor the result with 0001 1011*/
//			if(x[7] == 1) return ((x << 1) ^ 8'h1b);
//			else return x << 1; 
//	end 	
//
//endfunction
//
//function [7:0] mult_3(input [7:0] x);
//
//	begin 
//			/* multiplication by 3 ,= 01 ^ 10 = (num * 01) xor (num * 10) = (num) xor (num muliplication by 2) */
//			return mult_2(x) ^ x;
//	end 
//	
//endfunction
//
//  function [7 : 0] mult_4(input [7 : 0] x);
//    begin
//			return mult_2(mult_2(x));
//    end
//  endfunction
//  
//
//  function [7 : 0] mult_8(input [7 : 0] x);
//    begin
//      return mult_2(mult_4(x));
//    end
//  endfunction
//  
//
//  function [7 : 0] mult_9(input [7 : 0] x);
//    begin
//      return mult_8(x) ^ x;
//    end
//  endfunction
//
//  function [7 : 0] mult_b(input [7 : 0] x);
//    begin
//      return mult_8(x) ^ mult_2(x) ^ x;
//    end
//  endfunction
//
//  function [7 : 0] mult_d(input [7 : 0] x);
//    begin
//      return mult_8(x) ^ mult_4(x) ^ x;
//    end
//  endfunction
//
//  function [7 : 0] mult_e(input [7 : 0] x);
//    begin
//      return mult_8(x) ^ mult_4(x) ^ mult_2(x);
//    end
//  endfunction
// 
//	 
//	 
//function [31 : 0] mixw(input [31 : 0] word);
// reg [7 : 0] byte_0, byte_1, byte_2, byte_3;
// reg [7 : 0] mixed_byte_0, mixed_byte_1, mixed_byte_2, mixed_byte_3;
// begin
//	byte_0 = word[31 : 24];
//	byte_1 = word[23 : 16];
//	byte_2 = word[15 : 08];
//	byte_3 = word[07 : 00];
//
//	mixed_byte_0 = mult_2(byte_0) ^ mult_3(byte_1) ^ byte_2         ^ byte_3;
//	mixed_byte_1 = byte_0         ^ mult_2(byte_1) ^ mult_3(byte_2) ^ byte_3;
//	mixed_byte_2 = byte_0         ^ byte_1         ^ mult_2(byte_2) ^ mult_3(byte_3);
//	mixed_byte_3 = mult_3(byte_0) ^ byte_1         ^ byte_2         ^ mult_2(byte_3);
//
//	return {mixed_byte_0, mixed_byte_1, mixed_byte_2, mixed_byte_3};
// end
//endfunction
//
//function [127 : 0] mixcolumns(input [127 : 0] data);
//
//	// matrix x state array
//	// matrix :: [02 03 01 01]
//	// 			 [01 02 03 01]
//	// 			 [01 01 02 03]
//	// 			 [03 01 01 02]
//	 
// reg [31 : 0] w0, w1, w2, w3;
// reg [31 : 0] new_w0, new_w1, new_w2, new_w3;
// begin
//	w0 = data[127 : 096];
//	w1 = data[095 : 064];
//	w2 = data[063 : 032];
//	w3 = data[031 : 000];
//
//	new_w0 = mixw(w0);
//	new_w1 = mixw(w1);
//	new_w2 = mixw(w2);
//	new_w3 = mixw(w3);
//
//	return {new_w0, new_w1, new_w2, new_w3};
// end
// 
//endfunction
//
//
//function [31 : 0] inv_mixw(input [31 : 0] w);
// reg [7 : 0] b0, b1, b2, b3;
// reg [7 : 0] mb0, mb1, mb2, mb3;
// begin
//	byte_0 = word[31 : 24];
//	byte_1 = word[23 : 16];
//	byte_2 = word[15 : 08];
//	byte_3 = word[07 : 00];
//
//	mixed_byte_0 = mult_e(byte_0) ^ mult_b(byte_1) ^ mult_d(byte_2) ^ mult_9(byte_3);
//	mixed_byte_1 = mult_9(byte_0) ^ mult_e(byte_1) ^ mult_b(byte_2) ^ mult_d(byte_3);
//	mixed_byte_2 = mult_d(byte_0) ^ mult_9(byte_1) ^ mult_e(byte_2) ^ mult_b(byte_3);
//	mixed_byte_3 = mult_b(byte_0) ^ mult_d(byte_1) ^ mult_9(byte_2) ^ mult_e(byte_3);
//
//	return {mixed_byte_0, mixed_byte_1, mixed_byte_2, mixed_byte_3};
// end
//endfunction
//
//
//function [127 : 0] inv_mixcolumns(input [127 : 0] data);
// reg [31 : 0] w0, w1, w2, w3;
// reg [31 : 0] new_w0, new_w1, new_w2, new_w3;
// begin
//	w0 = data[127 : 096];
//	w1 = data[095 : 064];
//	w2 = data[063 : 032];
//	w3 = data[031 : 000];
//
//	new_w0 = inv_mixw(w0);
//	new_w1 = inv_mixw(w1);
//	new_w2 = inv_mixw(w2);
//	new_w3 = inv_mixw(w3);
//
//	return {new_w0, new_w1, new_w2, new_w3};
// end
//endfunction 
//  
//function [127 : 0] addroundkey(input [127 : 0] data, input [127 : 0] rkey); // the inverse of the add round key function is itself as it's just an xor operation
// begin
//	return data ^ rkey;
// end
// 
//endfunction
