program REGS;

Uses CRT;

var
  menyu, registr_e, registr_f, registr_5, zn: integer;
  
//1 -------- ��������� PRegE ---------------
procedure PRegE;
var
  key: char;
begin
  clrscr;
  port[$3d4] := $e;
  registr_e := port[$3d5]; 
  zn := registr_e;   writeln;
  writeln('  ������� Eh ');  writeln;
  writeln('  ������� �������� �������� Eh: ', registr_e);  writeln;
  writeln(' ��� ��������� �������� �������� ����������� ������� "�����" � "����"');
  writeln(' ��� ������ ������� "Enter".');
  GotoXY(31, 17); 
  write('��������: ', zn, '   ');
  repeat
    key := readkey;
    case key of
      #0:
        begin
          key := ReadKey; 
          case key of
            #72: zn := zn + 1;
            #80: zn := zn - 1;
          end;
        end;
    end;
    GotoXY(31, 17); //����?
    write('��������: ', zn, '   ');
    port[$3d4] := $e;
    port[$3d5] := zn;
  until key = #13;
  port[$3d4] := $e;
  port[$3d5] := registr_e;
  clrscr;
end;
//2. ---- ��������� PRegF --------------------
procedure PRegF;
var
  key: char;
begin
  clrscr;
  port[$3d4] := $f;
  registr_f := port[$3d5];
  zn := registr_f;  writeln;
  writeln(' ������� Fh ');  writeln;
  writeln(' ������� �������� �������� Fh: ', registr_f);  writeln;
  writeln(' ��� ��������� �������� �������� ����������� ������� "�����" � "����" ');
  writeln('  Dlya vyhoda nazhmite "Enter".');
  GotoXY(31, 17);
  write(' �������� ��������: ', zn, '   ');
  repeat
    key := readkey;
    case key of
      #0:
        begin
          key := ReadKey;
          case key of
            #72: zn := zn + 1;
            #80: zn := zn - 1;
          end;
        end;
    end;
    GotoXY(31, 17); 
    write(' �������� ��������: ', zn, '   ');
    port[$3d4] := $f;
    port[$3d5] := zn;
  until key = #13;
  port[$3d4] := $f;
  port[$3d5] := registr_f;
  clrscr;
end;
//3. -------- ��������� PReg5 ---------------
procedure PReg5;
var
  key: char;
  a, b: integer;
begin
  clrscr;
  port[$3d4] := $11;
  b := port[$3d5];
  a := b div 128;
  b := b - 128;
  port[$3d4] := $11;
  port[$3d5] := b;
  
  port[$3d4] := $5;
  registr_5 := port[$3d5];
  zn := registr_5;
  writeln;
  writeln(' ������� 5h ');
  writeln;
  writeln(' �������� �������� �������� 5h: ', registr_5);
  writeln;
  writeln(' ��� ��������� �������� �������� ����������� ������� "�����" � "����" ');
  writeln(' ��� ������ ������� "Enter".');
  GotoXY(31, 17);
  write('  �������� ��������: ', zn, '   ');
  repeat
    key := readkey;
    case key of
      #0:
        begin
          key := ReadKey;
          case key of
            #72: zn := zn + 1;
            #80: zn := zn - 1;
          end;
        end;
    end;
    GotoXY(31, 17);
    write(' �������� ��������: ', zn, '   ');
    port[$3d4] := $5;
    port[$3d5] := zn;
  until key = #13;
  port[$3d4] := $5;
  port[$3d5] := registr_5;
  clrscr;
end;
BEGIN
  clrscr;
  repeat
    writeln(' ������� ����� �������� � ������� Enter');
    writeln('  1 - ������� Eh.');
    writeln('  2 - ������� Dh.');
    writeln('  3 - ������� 5h.');
    writeln(' ��� ������ ������� 0' );
    readln(menyu);
    case menyu of
      1: PRegE;
      2: PRegF;
      3: PReg5;
    else writeln('�������� ����')
    end
  until menyu = 0;  
END.
