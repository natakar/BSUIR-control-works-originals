program Project1;
uses crt;
type
  
  TData = Integer;  //��� ����� ���� ������.
  TPNode = ^TNode; //��� ��������� �� ����.  
  TNode = record  //��� ���� ������.
            Data: TData;   //���� ���� ������.
            PLeft, PRight: TPNode; //��������� �� ����� � ������ ����.
           end;

//--- ��������� ������������ ������ ---------------------
procedure TreeFree(var aPNode: TPNode);
begin
  if aPNode = nil then  Exit;
  TreeFree(aPNode^.PLeft);  //����������� ����� ������������ ������ � ����� �����.
  TreeFree(aPNode^.PRight); //����������� ����� ������������ ������ � ������ �����.
  Dispose(aPNode);          //������������ ������, ������� �������� ����.
  aPNode := nil;            //��������� ��������� �� ������� ����.
end;
//--- ���������� ���� � ������ aData � �������� ������ -----
procedure AddNode(var aPNode: TPNode; const aData: TData);
begin
  if aPNode = nil then     //������� ����
  begin
    New(aPNode);           //�������� ������ ��� ����
    aPNode^.Data := aData; //���������� � ���� �������� �����
    aPNode^.PLeft := nil;  //��������� ��������� �� ������ �������
    aPNode^.PRight := nil; //��������� ��������� �� ������� �������
  end
  else if aData <= aPNode^.Data then //����� ����� ������� � ����� �����
    AddNode(aPNode^.PLeft, aData)
  else if aData > aPNode^.Data then //����� ����� ������� � ������ �����
    AddNode(aPNode^.PRight, aData);
end;
//--- ��������� ���������� ��������� ������ � �������� ����� (������ �����) ---
procedure TreeWriteln(const aPNode: TPNode; const aName: String);
begin
  if aPNode <> nil then
  begin
    Writeln('���������� �������� ����:  ', aName, ': ', aPNode^.Data);    
    TreeWriteln(aPNode^.PLeft, aName + '-1');  //����������� ����� ��� ����� �����
    TreeWriteln(aPNode^.PRight, aName + '-2'); //����������� ����� ��� ������ �����.
  end;
end;

//--- ��������� �������� �������: ������ ��� � ���� ��������� =, �� ���������� �������� ������ ---
procedure TreeCalc(const aPNode: TPNode; const aName: String; var aC, aCnt: Integer);
var
  CL, CR: Integer;
begin
  if aPNode = nil then //���� ���� ���
    aC := 0 //���������� �������� ����
  else                 //���� ���� ����
  begin //���������� �������� ��� �������� ���� =    
    TreeCalc(aPNode^.PLeft, aName + '-1', CL, aCnt);  //��� ����� �����
    TreeCalc(aPNode^.PRight, aName + '-2', CR, aCnt); //��� ������ �����     
    if CL <> CR then//���� ������� �����������, ��
    begin  //��������� ������� ���� � �������� � ������ �������� � ��
      Inc(aCnt);
      Writeln(aName, ' (', aPNode^.Data, '): CL = ', CL, ' <> CR = ', CR);
    end;
    //���������� ����� � ����� � ������ aPNode
    aC := 1 + CL + CR;
  end;
end;

VAR
  PTree: TPNode;
  Data: TData;
  Code, C, Cnt: Integer;
  S: String;

BEGIN
clrscr;
  PTree := nil; //��������� ������������� ������.  
  repeat
    //������ �������� ������.
    Writeln('  ���������� ����� � �������� ������ ������.');
    Writeln('   ��� ���������� �����: �������� ������ ������ � ������� Enter.');
    repeat
      Write('  ������� ����: '); Readln(S);
      if S <> '' then
      begin
        Val(S, Data, Code);
        if Code = 0 then
          AddNode(PTree, Data) //��������� ���� � ������
        else
          Writeln(' �������� ����! ������� ����� �����: ');
      end;
    until S = '';
    Write('  ���� ������ ��������.');
    
    Writeln('   ��������� ������:');
    TreeWriteln(PTree, '0');
    Writeln('  ����� �����, ��� ������� ���������� �������� � ����� ��������� �� ����� ���������� �������� � ������ ���������:');
   // C := 0;   //�������������� ���������, �. �., ������ �������� � TreeCalc() �������� ��������.
    Cnt := 0; //������������ ��������� ����� ������� TreeCalc().
    TreeCalc(PTree, '0', C, Cnt);
    Writeln('   ����� �����, ��� ������� ����������� ������ �������: ', Cnt);
    TreeFree(PTree); //������������ ������
   // Writeln('������, ���������� ��� ������ - �����������.');
    Writeln('----------------');  Writeln;
    Write('��������� - Enter, ����� - ����� ������ + Enter. ');
    Readln(S);
  until S <> '';
END.
