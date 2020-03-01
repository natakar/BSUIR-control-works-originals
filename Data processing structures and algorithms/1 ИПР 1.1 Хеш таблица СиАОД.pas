program IPR1_1;
Uses crt;
const
  MAXn = 3000;  //����������� �������
  c = 2;        //c - ������������� ���

type
  arr = record
    mas: string[7];	//������� � �������
    flag: boolean; 	//��� ������� ����������
  end;

var
  table: array [0..MAXn] of arr;   //���� ������������ �������� �������

{---- ��������� ������������� ������� (���-�������) --------} 
procedure initArray;
var
  j: integer;
begin
  for j := 0 to MAXn do
  begin
    table[j].mas := ''; 		//������ ���� string, '' - ������ ������.
    table[j].flag := true;		
  end;				         	//����������� ����� ��� ������
end;

{------- ���-�������. ������ ����� ��� ��-�� � �������. ------}
function hash(str: string): integer;
begin       //��� ��������� ��-�� � ������� ����, ����� ��-� ��� �� 2 ��������}
  if length(str) = 1 then              // str - ��-�, �������� ���� ���� �����
    str := ' ' + str + ' ';
  //��������, ����� ����� 2� � ��������� ���� ��-��
  hash := ord(str[2]) + ord(str[length(str)]);  
end;

{------- ���������� �������� (����� �����, ���� ����� ������) --------}
function rhash(k: integer; str: string): integer;
//k - k-� ��-� ����������-��� ����; str - ������� ��-�
begin
  rhash := (hash(str) + c * k) mod MAXn;
end;

{---- 1)��������� ���������� ��-�� � ������� --------------------}
procedure AddHash(var n: integer; var str: string);
{str - �������� ������
n � ����-�� ���� = �-�� �����}
var
  j, i, k: integer;     //j - ������� ��-���,
begin   //���� ��������� ������� ����� ��� ��-�� � ����, �������� � ������
  i := 1;                               { ���������� ��� rhash }
  j := 0;
  writeln('����������� ������� (<=3000): ');   
  readln(n);  
  if n = 0 then
    writeln('������� ���������')
  else   // ���� �� ���������
  begin
    inc(j);          					   //������� ��� ��-��� 
     writeln('������� ����������� �������: ');  
    writeln('��-� � ', j); readln(str);     // str - �������� ������ 
    k := hash(str);       //��������� ������ ��� �������� ��-�� � ���-����
    while true do
      if k <= maxn then
      begin
        if (table[k].mas = '') or (table[k].flag = true) then    
        begin         //���� ������ ��������
          table[k].mas := str;            //��������� ��-� � ������ 
          table[k].flag := false;        //�������� ��� ������� 
          dec(n); 
          writeln('������� ��������.');
          break;         //����� ��� ���������� ��������
        end;
        //���� �� ���������� ������ ����� ��-�-����
        if ((table[k].mas <> '') and (table[k].mas = str)) or (table[k].flag = true) then   
        begin
          table[k].mas := str;          //�������� ���
          table[k].flag := false;       //�������� ������ ��� ������� 
          dec(j);       	 	     //��-� ���������, ������ ������� �� �����������
          break;                          //������� ��� ���������� ��������
        end;
        //�� ���������� ������ ��� ���� ��-�, �������� �� ��������
        if ((table[k].mas <> '') and (table[k].mas <> str)) or
             (table[k].flag = true) then
          k := rhash(i, str); {������ ����� ��-�� �� ��������� �������� }
        //��������� ������� �� ������� ���������� ����� 
      end
      else
        k := rhash(i, str);   //������ ��� �������� (������ ��������)
      inc(i); //���� �����, �������� rhash, ���� �����, ���������� �����
    end; 
  end; 

{------- 2)��������� �������� ��-�� �� ������ � ���� ------------}
procedure DeleteHash(var str: string);
var
  i, k, n: integer;
begin
  i := 1;			//���������� ��� rhash 
  writeln('������� ������� ��� ��������:');readln(str);      
  k := hash(str);       //��������� ����� ����� ��������
  while true do
  begin
    if k <= maxn then 
    begin    //���� � ���� 
      if (table[k].mas = '') or ((table[k].mas = str) and (table[k].flag = true)) then
      begin 
        writeln('������� �� ������');
        break;
      end;
              //������� 
      if (table[k].mas = str) and (table[k].flag = false) then
      begin  //�������� ������ ��� ���������, ��-� � ��� �� �������:
        //����������� � ��� ��-� ����������� ��������. ��������
        table[k].flag := true;
        writeln('������� ������');
        inc(n);
        break;
      end;
      if n = MAXn then writeln('������� �����');
    end;      
     //����� ������� ������: ������, ��-� ��� �������� � ������� �������� rhash
    k := rhash(i, str);	//���������� ��� rhash 
    inc(i); 		
  end;
end;

{----- 3)��������� ������ ��-�� �� ������ � ���� --------------}
function SearchHash(var str: string): integer;
var
  i, k: integer;
begin
  writeln('������� ������� �������:');readln(str);      
  k := hash(str);       //��������� ����� ����� ��������
  while true do
  begin
    if k <= maxn then 
    begin //���� � ���� 
      if (table[k].mas = '') or ((table[k].mas = str) and (table[k].flag = true)) then
        writeln('������� �� ������');
        break;
    end;
            //������� 
    if (table[k].mas = str) and (table[k].flag = false) then
     writeln('�������', str, '������. ��� �����: ', k);
      SearchHash := k;     
  end;          
end;

 //---- �������� ��������� ---------------------------
VAR
  n: integer;
  str: string;
  ch: char;    //��� ������ ����

BEGIN
  repeat
    clrscr;
    Write('��������� ��� ������ � ');TextColor(3);Writeln('���-��������.');
    TextColor(7);Writeln('�������� �������� ��������:');
    Writeln('1) �������� �������.');
    Writeln('2) ������� ������� �� ���-�������');                  
    Writeln('3) ����� ��������');  
    Writeln('4) �����.');
    writeln;
    ch := readkey;      //������� ������� �������
    case ch of      //�������� �������
      '1':
        begin        //1) �������� ��-�
          AddHash(n, str);
          readkey; //������� ������� �������
        end;
      '2':
        begin     //2) ������� ������� �� ���-�������
          DeleteHash(str); 
          readkey; 
        end;
      '3':
        begin     //3) ����� ��-��
          SearchHash(str); 
          readkey; 
        end;
    end;
  until ch = '4';
END.
