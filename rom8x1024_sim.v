/*******************/
/* rom8x1024_sim.v */
/*******************/

//                  +----+
//  rom_addr[11:0]->|    |->rom_data[31:0]
//                  +----+

//
// ROMの記述（論理シミュレーション用）
//

module rom8x1024_sim (rom_addr, rom_data);

  input   [11:0]  rom_addr;  // 12-bit アドレス入力ポート
  output  [31:0]  rom_data;  // 32-bit データ出力ポート

  reg     [31:0]  data;

  // Wire
  wire     [9:0]  word_addr; // 10-bit address, word

  assign word_addr = rom_addr[9:2];
   
  always @(word_addr) begin
    case (word_addr)
      10'h000: data = 32'h23646566; // 00400000: ADDI, REG[4]<=REG[27]+25958;
      10'h001: data = 32'h696e6520; // 00400004: other type! opcode=26(10)
      10'h002: data = 32'h45585449; // 00400008: other type! opcode=17(10)
      10'h003: data = 32'h4f5f5052; // 0040000c: other type! opcode=19(10)
      10'h004: data = 32'h494e545f; // 00400010: other type! opcode=18(10)
      10'h005: data = 32'h5354524f; // 00400014: other type! opcode=20(10)
      10'h006: data = 32'h4b452028; // 00400018: other type! opcode=18(10)
      10'h007: data = 32'h2a28766f; // 0040001c: SLTI
      10'h008: data = 32'h6c617469; // 00400020: other type! opcode=27(10)
      10'h009: data = 32'h6c652075; // 00400024: other type! opcode=27(10)
      10'h00a: data = 32'h6e736967; // 00400028: other type! opcode=27(10)
      10'h00b: data = 32'h6e656420; // 0040002c: other type! opcode=27(10)
      10'h00c: data = 32'h696e7420; // 00400030: other type! opcode=26(10)
      10'h00d: data = 32'h2a292030; // 00400034: SLTI
      10'h00e: data = 32'h78303330; // 00400038: other type! opcode=30(10)
      10'h00f: data = 32'h30290a23; // 0040003c: ANDI, REG[9]<=REG[1]&0x00000a23;
      10'h010: data = 32'h64656669; // 00400040: other type! opcode=25(10)
      10'h011: data = 32'h6e652045; // 00400044: other type! opcode=27(10)
      10'h012: data = 32'h5854494f; // 00400048: other type! opcode=22(10)
      10'h013: data = 32'h5f505249; // 0040004c: other type! opcode=23(10)
      10'h014: data = 32'h4e545f41; // 00400050: other type! opcode=19(10)
      10'h015: data = 32'h53434949; // 00400054: other type! opcode=20(10)
      10'h016: data = 32'h2020282a; // 00400058: ADDI, REG[0]<=REG[1]+10282;
      10'h017: data = 32'h28766f6c; // 0040005c: SLTI
      10'h018: data = 32'h6174696c; // 00400060: LLO, REG[20].[15:0]<=26988; #NOT YET IMPREMENTED
      10'h019: data = 32'h6520756e; // 00400064: other type! opcode=25(10)
      10'h01a: data = 32'h7369676e; // 00400068: other type! opcode=28(10)
      10'h01b: data = 32'h65642069; // 0040006c: other type! opcode=25(10)
      10'h01c: data = 32'h6e74202a; // 00400070: other type! opcode=27(10)
      10'h01d: data = 32'h29203078; // 00400074: SLTI
      10'h01e: data = 32'h30333034; // 00400078: ANDI, REG[19]<=REG[1]&0x00003034;
      10'h01f: data = 32'h290a6d61; // 0040007c: SLTI
      10'h020: data = 32'h696e2829; // 00400080: other type! opcode=26(10)
      10'h021: data = 32'h0a7b0a20; // 00400084: J, PC<=0x027b0a20*4(=0x09ec2880);
      10'h022: data = 32'h20756e73; // 00400088: ADDI, REG[21]<=REG[3]+28275;
      10'h023: data = 32'h69676e65; // 0040008c: other type! opcode=26(10)
      10'h024: data = 32'h6420696e; // 00400090: other type! opcode=25(10)
      10'h025: data = 32'h74206b3b; // 00400094: other type! opcode=29(10)
      10'h026: data = 32'h0a202066; // 00400098: J, PC<=0x02202066*4(=0x08808198);
      10'h027: data = 32'h6f722028; // 0040009c: other type! opcode=27(10)
      10'h028: data = 32'h6b203d20; // 004000a0: other type! opcode=26(10)
      10'h029: data = 32'h303b206b; // 004000a4: ANDI, REG[27]<=REG[1]&0x0000206b;
      10'h02a: data = 32'h203c3d20; // 004000a8: ADDI, REG[28]<=REG[1]+15648;
      10'h02b: data = 32'h36303b20; // 004000ac: ORI, REG[16]<=REG[17]|0x00003b20;
      10'h02c: data = 32'h6b2b2b29; // 004000b0: other type! opcode=26(10)
      10'h02d: data = 32'h207b0a20; // 004000b4: ADDI, REG[27]<=REG[3]+2592;
      10'h02e: data = 32'h20202045; // 004000b8: ADDI, REG[0]<=REG[1]+8261;
      10'h02f: data = 32'h5854494f; // 004000bc: other type! opcode=22(10)
      10'h030: data = 32'h5f505249; // 004000c0: other type! opcode=23(10)
      10'h031: data = 32'h4e545f53; // 004000c4: other type! opcode=19(10)
      10'h032: data = 32'h54524f4b; // 004000c8: other type! opcode=21(10)
      10'h033: data = 32'h45203d20; // 004000cc: other type! opcode=17(10)
      10'h034: data = 32'h28756e73; // 004000d0: SLTI
      10'h035: data = 32'h69676e65; // 004000d4: other type! opcode=26(10)
      10'h036: data = 32'h6420696e; // 004000d8: other type! opcode=25(10)
      10'h037: data = 32'h74293078; // 004000dc: other type! opcode=29(10)
      10'h038: data = 32'h30303030; // 004000e0: ANDI, REG[16]<=REG[1]&0x00003030;
      10'h039: data = 32'h30303030; // 004000e4: ANDI, REG[16]<=REG[1]&0x00003030;
      10'h03a: data = 32'h3b0a2020; // 004000e8: XORI
      10'h03b: data = 32'h20204558; // 004000ec: ADDI, REG[0]<=REG[1]+17752;
      10'h03c: data = 32'h54494f5f; // 004000f0: other type! opcode=21(10)
      10'h03d: data = 32'h5052494e; // 004000f4: other type! opcode=20(10)
      10'h03e: data = 32'h545f4153; // 004000f8: other type! opcode=21(10)
      10'h03f: data = 32'h43494920; // 004000fc: other type! opcode=16(10)
      10'h040: data = 32'h3d206b3b; // 00400100: LUI
      10'h041: data = 32'h0a202020; // 00400104: J, PC<=0x02202020*4(=0x08808080);
      10'h042: data = 32'h20455854; // 00400108: ADDI, REG[5]<=REG[2]+22612;
      10'h043: data = 32'h494f5f50; // 0040010c: other type! opcode=18(10)
      10'h044: data = 32'h52494e54; // 00400110: other type! opcode=20(10)
      10'h045: data = 32'h5f535452; // 00400114: other type! opcode=23(10)
      10'h046: data = 32'h4f4b4520; // 00400118: other type! opcode=19(10)
      10'h047: data = 32'h3d202875; // 0040011c: LUI
      10'h048: data = 32'h6e736967; // 00400120: other type! opcode=27(10)
      10'h049: data = 32'h6e656420; // 00400124: other type! opcode=27(10)
      10'h04a: data = 32'h696e7429; // 00400128: other type! opcode=26(10)
      10'h04b: data = 32'h30783030; // 0040012c: ANDI, REG[24]<=REG[3]&0x00003030;
      10'h04c: data = 32'h30303030; // 00400130: ANDI, REG[16]<=REG[1]&0x00003030;
      10'h04d: data = 32'h30313b0a; // 00400134: ANDI, REG[17]<=REG[1]&0x00003b0a;
      10'h04e: data = 32'h20207d0a; // 00400138: ADDI, REG[0]<=REG[1]+32010;
    endcase
  end

  assign rom_data = data;
endmodule
