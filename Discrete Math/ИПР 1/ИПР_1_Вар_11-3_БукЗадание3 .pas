program IPR_1_VAR_11_Exerc_3;//��������� � ���������� - ����� ������� 3

uses crt;  
const
  n = 8;//����� n ������ ��������������� ����� ����

type
  NumbSet = array[1..n] of char; //of byte;

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
  x[1]:= 'a';//��������� ������, ��� ��-�� - ����� 
  x[2]:= 'b';
  x[3]:= 'b';
  x[4]:= 'b';
  x[5]:= 'b';
  x[6]:= 'c';
  x[7]:= 'd';
  x[8]:= 'd';
  write(' ������� ���������� ���������: m = ');readln(m);
  j := 0;   //� � Inc(j): ����� �������� � 1
  SubSet(1);  //������� � ����� ����� ����� ���������� ����
  readln;
END.
