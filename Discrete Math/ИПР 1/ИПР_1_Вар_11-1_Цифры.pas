program IPR_1_VAR_11_Numbers;//��������� � ���������� - �����

uses crt;  
const
  n = 5;

type
  NumbSet = array[1..n] of byte;

var
  x, y: NumbSet; //a, b: NumbSet;
  i, m, j: integer;
//---- ������-� ������ ������� (���������) -------
procedure PrintSubSet(j: integer);
var
  i: integer;
begin
  if j = m then  //m � ������ ���-�� ���� � 1 ������ (������)
  begin
    writeln;write('   '); //���� ���������� �� m-���� �����
    for i := 1 to j do 
      write(y[i], ' ')//������ 1 ������� �� m ����
  end
end;
//---- ������-� ������������ ��������� ------- 
procedure SubSet(k: integer);//k � �-�� ���� � 1 ������ (��� m)
begin//����� � - ������ m: �-�� ���� � 1 ��������.
  if k <= n then //���� �-�� ���� � 1 ��������� <= ��������� ����
  begin
    Inc(j); //j:= j+1; - ��������� ������� ����� � ������
    y[j] := x[k];
    PrintSubSet(j);//������ ������� �� 3 ����??
    SubSet(k + 1);//������� � ������� ?? ����?
    Dec(j);
    SubSet(k + 1);
  end
end;
 //---- �������� ����� ------- 
BEGIN
  clrscr;
  for i := 1 to n do 
    x[i] := i;  //��������� ������, ��� ��-�� - ����� � 1 �� 5
  write(' ������� ���������� ���������: m = '); readln(m);
  j := 0;   //� � Inc(j): ����� �������� � 1
  SubSet(1);  //������� � ����� ����� ����� ���������� ����
  readln;
END.
