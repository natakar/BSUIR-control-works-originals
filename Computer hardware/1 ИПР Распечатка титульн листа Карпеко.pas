{��������� �� ���������� ���������� ����� 
  � ������� �������������� ������ ���������� ���������.}
program Project1;
var
  LST: file of Byte;
  i, n: integer;
//��������� ������ ������ ----------------
procedure WriteString(S: String); 
var
  I: Word;
  B: Byte;
  C: Char;
begin
  for i := 1 to Length(S) do
  begin
    B := Ord(S[i]);
    Write(LST, B);
  end;
end;
//��������� ������ ���� ------------------
procedure WriteByte(B: Byte);
begin
  Write(LST, B);
end;
//�������� ������ ������ -----------------
procedure WriteChar(C: Char);
var
  B: Byte;
begin
  B := Ord(C);
  Write(LST, B);
end;

BEGIN
  Assign(LST, 'D:\output.bin');//������ ��������� ����� output
  Rewrite(LST);  
  WriteChar(#27);WriteChar('@'); {����� ���� ������� ����������� ����������}
  
  WriteChar(#27);WriteChar(#51);WriteChar(#160);  {h1 = 2 - ������ ����} 
  WriteChar(#27);WriteChar(#108);WriteChar(#6);//������ �� ������ ����
  
  WriteChar(#27);WriteChar('M');{����� ���� �������}  
  WriteString('MINISTERSTVO OBRAZOVANYA RESPUBLIKI BELARUS');
  WriteChar(#27);WriteChar('P'); {����� ���� ��������}  
  
  WriteChar(#13);WriteChar(#10);{������� ������, ������� �������}
  WriteChar(#27);WriteChar(#108);WriteChar(#20); {������� ������� �� ������ ����}
  
  WriteChar(#27);WriteChar(#119);WriteChar(#1); {���������������� ������ ��������} 
  WriteString('BGUIR');
  WriteChar(#27);WriteChar(#119);WriteChar(#0); {���������������� ������ ���������} 
  
  WriteChar(#27);WriteChar('@'); { ����� �����}
  WriteChar(#27);WriteChar(#51);WriteChar(#108); {h2 = 1,5. ������� ��������� �/� ��������}
  WriteChar(#13);WriteChar(#10); {������� ������, ������� �������}
  //����������� ����� ������������: --------------
  WriteChar(#27);WriteChar(#38);WriteChar(#0);WriteChar('A');WriteChar('A');
  //������� ������� ����� ������������: -----------
  WriteChar(#16);WriteChar(#48);WriteChar(#32);
  WriteChar(#96);WriteChar(#64);WriteChar(#255);
  WriteChar(#64);WriteChar(#96);WriteChar(#32);
  WriteChar(#48);WriteChar(#16);
  //������ ����������������� �����: ---------
  for i := 1 to 50 do 
  begin
    WriteChar(#27);WriteChar(#37);WriteChar(#1);WriteChar('A'); 
  end;
  WriteChar(#13);WriteChar(#10); {������� ������, ������� ��������}
  WriteChar(#27);WriteChar(#108);WriteChar(#20); //�� ������ ����
  WriteChar(#27);WriteChar('X');WriteChar(#1); {������������ ������ ��������}
  WriteString('OTCHET');
  WriteChar(#27);WriteChar('X');WriteChar(#0); {������������ ������ ���������}
  
  WriteChar(#27);WriteChar(#51);WriteChar(#255); // h3 = 3. ������ ����
  WriteChar(#13);WriteChar(#10); {������� ������, ������� ��������}
  WriteChar(#27);WriteChar(#108);WriteChar(#5); //�� ������ ����
  WriteChar(#27);WriteChar('W');WriteChar(#1); // ������ �������� ������ ��������
  WriteString('PO LABORATORNOI RABOTE #6');
  WriteChar(#27);WriteChar('W');WriteChar(#0); // ������ �������� ������ ���������
  WriteChar(#13);WriteChar(#10);
  WriteChar(#27);WriteChar(#108);WriteChar(#19); //�� ������ ����
  WriteChar(#27);WriteChar(#119);WriteChar(#1); {������� ������ ��������}
  WriteString('KURS - PU EVM');
  WriteChar(#27);WriteChar(#119);WriteChar(#0);{������� ������ ���������}
  WriteChar(#13);WriteChar(#10); //{������� ������, ������� ��������}
  
  WriteChar(#27);WriteChar(#51);WriteChar(#212);// h4 = 2,5. ������ ���� 
  WriteChar(#27);WriteChar(#108);WriteChar(#5); //�� ������ ����
  
  WriteChar(#27);WriteChar(#119);WriteChar(#1); {������� ������ ��������}
  WriteString('Student');
  WriteChar(#27);WriteChar(#119);WriteChar(#0);{������� ������ ���������}
  WriteChar(#27);WriteChar(#36);WriteChar(#250);WriteChar(#0);{���������� ������� ������ ����� ��������� � ����� ������}
  
  WriteChar(#27);WriteChar('E'); {��������������� ������ ��������}
  WriteString('Proveril'); 
  WriteChar(#27);WriteChar('F'); {��������������� ������ ���������}
  //�������: -------------------------
  WriteChar(#27);WriteChar('@'); 
  WriteChar(#13);WriteChar(#10); //{������� ������, ������� ��������}
  WriteChar(#27);WriteChar(#108);WriteChar(#3); //�� ������ ����
  WriteChar(#27);WriteChar('P'); //����� "����"
  WriteString('KARPEKO N. G.'); //��� ��������
  
  WriteChar(#27);WriteChar(#36);WriteChar(#250);WriteChar(#0);{���������� ������� ������ �LEVANTSEVICH V. A.� � ����� ������}
  WriteChar(#27);WriteChar('M');{���� �������}  
  WriteString('LEVANTSEVICH V. A.');  
  WriteChar(#27);WriteChar('P'); {���� ��������}    
  
  //������������ �����: ----------------
  WriteChar(#13);WriteChar(#10); 
  WriteChar(#27);WriteChar(#51);WriteChar(#392); // h5 = 6. ������ ����
  //����������� ����� ������������: ----------
  WriteChar(#27);WriteChar('A');WriteChar(#8); {������� n/72 ���������� �/� ��������}
  WriteChar(#27);WriteChar(#36);WriteChar(#30);WriteChar(#0);{���������� ��������� ������}
  WriteChar(#27);WriteChar('K');WriteChar(#60);WriteChar(#0); {��������� �������}
  
  for n := 1 to 5 do 
  begin
    WriteChar(#64);WriteChar(#255);WriteChar(#64);WriteChar(#255);
    WriteChar(#64);WriteChar(#255);WriteChar(#64);WriteChar(#255);
    WriteChar(#64);WriteChar(#255);WriteChar(#64);
  end;
  //����� 2020: ---------------------
  WriteChar(#13);WriteChar(#10); {������� ������, ������� ��������}
  WriteChar(#27);WriteChar(#51);WriteChar(#212); // h6 = 2,5. ������ ����
  WriteChar(#27);WriteChar(#108);WriteChar(#23); //�� ������ ����
  
  WriteChar(#27);WriteChar(#119);WriteChar(#1); {���������������� ������ ��������} 
  WriteString('MINSK');
  WriteChar(#27);WriteChar(#119);WriteChar(#0); {���������������� ������ ���������} 
  
  WriteChar(#13);WriteChar(#10);
  WriteChar(#27);WriteChar(#51);WriteChar(#36);
  WriteChar(#27);WriteChar(#108);WriteChar(#21);
  
  WriteChar(#27);WriteChar('W');WriteChar(#1); //������ �������� ������ ��������
  WriteString('2020');
  WriteChar(#27);WriteChar('W');WriteChar(#0); //������ �������� ������ ���������
  Close(LST);
  Readln;  
END.
