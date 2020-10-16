`include "sccu_dataflow.v"
`include "cla32.v"
`include "alu.v"
`include "regfile.v"

module sccpu_dataflow(clock, resetn, inst, memout, pc, wmem, aluout, data2mem, reg_addr, reg_out );
  input [31:0] inst, memout;  
  input clock, resetn;
  output [31:0] pc, aluout, data2mem;  
  output wmem;
  input [4:0]reg_addr;
  output [31:0] reg_out;

  wire [1:0] pcsource;  //��һ��ָ��ĵ�ַѡ���ź�  00Ϊpc+4, 01ѡת�Ƶ�ַ��10ѡ�Ĵ����ڵĵ�ַ��11ѡ��ת��ַ
  wire [3:0] aluc;  //ALU���Ʋ���  
  wire zero;  //���־λ beq,bnq
  wire wmem;  //д���ڴ�dmem��Ϊ1ʱд�룬����д����lw��swָ����
  wire wreg;  //д�Ĵ�����
  wire regrt; //Ŀ�ļĴ���ѡ��Ϊ1ʱѡrt��Ϊ0ʱѡrd
  wire m2reg; //�洢����д��Ĵ�����Ϊ1ʱѡ��洢�����ݣ�Ϊ0ʱѡ��ALU���
  wire shift; //ALU aʹ����λλ����Ϊ1ʱʹ��sa������ʹ�üĴ�������
  wire aluimm;  //ALU b����������Ϊ1ʱ��������������ʹ�üĴ�������
  wire jal;   //�ӳ�����ã�Ϊ1ʱ��ʾָ����jal,������
  wire sext;   //����������λ��չ��Ϊ1ʱ������չ����������չ
  wire enable = 1;  //ipдʹ��
  wire co, overflow, negative, carry;
  wire [31:0] pcplus4out;
  wire [31:0] pcplus8out;
  wire [31:0] wpcout;
  wire [31:0] alu1, alu2;
  wire [31:0] rfouta;
  wire [31:0] sa = {27'b0, inst[10:6]};    //��λָ���е���λλ��   ��rtָ���Ĵ����е������ƶ�saλ��ע�⣺inst��saֻ��5λ���˴�������չΪ32λ
  wire e = sext & inst[15];  //����������λ����sextΪ0��0��չ
  wire [15:0] imm = {16{e} };
  wire [31:0] immediate = {imm, inst[15:0]}; //����λ��չ���������
  wire [4:0] reg_dest;
  wire [4:0] wn;
  wire [31:0] offset = {imm[13:0], inst[15:0], 2'b00};  //beq.bnq�����ת�Ƶ�ַ
  wire [31:0] bpc;  //beq, bne�е�ת�Ƶ�ַ
  wire [31:0] jpc = {pcplus4out[31:28], inst[25:0], 2'b00};  //j�е�ת�Ƶ�ַ
  wire [31:0] data;  //�Ĵ�������Ҫд�������
  wire [31:0] nextpcout;
  wire [31:0] resultout;

  sccu_dataflow cpu_cu (inst[31:26], inst[5:0], zero, wmem, rmem, wreg, regrt, m2reg, aluc, shift, aluimm, pcsource, jal, sext, wpc);
  
  //ip�������һ��ָ���ַ
  dffe32 ip(nextpcout, clock, resetn, enable, pc);
  cla32 pcplus4(pc, 32'h4, 1'b0, pcplus4out, co); 
  cla32 pcplus8(pc, 32'h8, 1'b0, pcplus8out, co);
  mux2x5 reg_wn (inst[15:11], inst[20:16], regrt, reg_dest);
  assign wn = reg_dest | {5{jal}};  //jal: r31 <-- pc+8, if jal == 1, wn = 31 else wn = reg_dest
  mux2x32 pcorpc8(pc, pcplus8out, wpc, wpcout);  
  mux2x32 result(aluout, memout, m2reg, resultout);
  mux2x32 rf_add(resultout, pcplus8out, jal, data); 
  regfile rf(inst[25:21], inst[20:16], data, wn, wreg, clock, resetn, rfouta, data2mem, reg_addr, reg_out );
  mux2x32 alu_a(rfouta, sa, shift, alu1); 
  mux2x32 alu_b(data2mem, immediate, aluimm, alu2);
  alu aluunit(alu1, alu2, aluc, aluout, zero, negative, overflow, carry);
  cla32 beqbnepc(pc, offset, 1'b0, bpc, co);
  mux4x32 nextpc(pcplus4out, bpc, rfouta , jpc, pcsource, nextpcout);
endmodule