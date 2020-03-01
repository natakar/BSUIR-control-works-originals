program IPR1_2_1;
uses
  crt;
type
  PType = ^TStek;
  TStek = record
            Elem: Char;
            next: PType;
          end;
//---- ���������� � ����� stk �������� data -------------------------
procedure AddStek(var stk: PType; data: Char);
var
  X: PType;
begin
  new(X);       		//����������� �������
  X^.Elem := data;
  X^.next := stk;     //���� ������ ���, ��� next �������� �� ��, ��� �������� ������				
  stk := X;
end;
//----- ������� �� ����� ������� ������� ---------------------------
function GetStek(var stk: PType): Char;
begin
  if stk <> nil then      //���� ���� �� ������
  begin
    GEtStek := stk^.Elem;
    stk := stk^.next;     //������� ������� �� �����
  end
  else
    GetStek := #0;      //���� ���� ������ - ���������� ������ #0
end;
//--- �������� �������� ��������� ������� � -----------------
function StekPriority(c: Char): Integer;
begin
  case c of   //��������� ��������, ������� ��� ���� � �����
    '+', '-': Result := 2;
    '*', '/': Result := 4;
    '^': Result := 5;
    'a'..'z', 'A'..'Z': Result := 8;
    '(': Result := 0;
  else
    Result := 10;     //��� ������������ ������� ���������� 10
  end;
end;
//--- �������� ������������� ��������� ������� � ----------------
function InpPriority(c: Char): Integer;
begin
  case c of  //��������� ��������, ������� ����� �������� � ����
    '+', '-': Result := 1;
    '*', '/': Result := 3;
    '^': Result := 6;
    'a'..'z', 'A'..'Z': Result := 7;
    '(': Result := 9;
    ')': Result := 0;
  else
    Result := 10;       //��� ������������ ������� ���������� 10
  end;
end;
//----- ���������� ���� ������� � �������� ������ ---------------
function CharRang(c: Char): integer;
begin
  if c in ['a'..'z', 'A'..'Z'] then
    Result := 1                      //��� �������� ���� 1
  else
    Result := -1;                    //��� ��������� -1
end;

VAR
  stk: PType;
  input, output: string;	// input � �������� ��������� ���������
  Rang, i: Integer;		// Rang - ����
  Ch: Char;
BEGIN
  stk := nil;     //���� ������
  Rang := 0;     //�������� ����
  output := '';  //�������� ��������� ������ (����������� ���������)  
  Write('  ��������� �����: ');   Readln(input); Writeln;  
  i := 1;
  while i <= Length(input) do //���� �� ������ �� ���������� ��������
    //���� ���� ��� � �������� �������� ����� ������� ���������
    if (stk = nil) or (InpPriority(Input[i]) > StekPriority(stk^.Elem)) then
    begin
      if Input[i] <> ')' then 		// ( � ���� ������ �� ���� 
        AddStek(stk, input[i]); 	//������ ������� ������ � ����
      i := i + 1;                			//��������� ������
    end
    else    //���� �� ������ ��� ��������� ������� ����� ������, ��� ��������
    begin
      Ch := GetStek(stk);       //�������� �� ����� ������� ������ �����
      if Ch <> '(' then         // ( ��������� � ��������� �� ����
      begin
        output := output + Ch;          //���������� � �������� ������
        Rang := Rang + CharRang(Ch);    //�������� ���� ���������
      end;
    end;      //��������� � ���������� ������� ������� ������   
  while not (stk = nil) do      //���������� ��, ��� �������� � �����
  begin
    Ch := GetStek(stk);           //�������� �� ����� ������� ������
    if Ch <> '(' then             // ( ��������� � ��������� �� ����
      output := output + Ch;      //���������� � �������� ������
  end;  
  Writeln('  ����������� �����: ', output); Writeln;
  Writeln('  ���� ���������: ', Rang);
  Readln;
END.
