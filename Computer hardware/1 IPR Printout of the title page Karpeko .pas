{Программа по распечатке титульного листа 
  с помощью низкоуровневых команд управления принтером.}
program Project1;
var
  LST: file of Byte;
  i, n: integer;
//процедура читать строку ----------------
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
//процедура читать байт ------------------
procedure WriteByte(B: Byte);
begin
  Write(LST, B);
end;
//прцедура читать символ -----------------
procedure WriteChar(C: Char);
var
  B: Byte;
begin
  B := Ord(C);
  Write(LST, B);
end;

BEGIN
  Assign(LST, 'D:\output.bin');//запись бинарного файла output
  Rewrite(LST);  
  WriteChar(#27);WriteChar('@'); {сброс всех режимов печатающего устройства}
  
  WriteChar(#27);WriteChar(#51);WriteChar(#160);  {h1 = 2 - отступ вниз} 
  WriteChar(#27);WriteChar(#108);WriteChar(#6);//отступ от левого края
  
  WriteChar(#27);WriteChar('M');{шрифт Элит включен}  
  WriteString('MINISTERSTVO OBRAZOVANYA RESPUBLIKI BELARUS');
  WriteChar(#27);WriteChar('P'); {шрифт Элит вЫключен}  
  
  WriteChar(#13);WriteChar(#10);{перевод строки, возврат каретки}
  WriteChar(#27);WriteChar(#108);WriteChar(#20); {команда отступа от левого поля}
  
  WriteChar(#27);WriteChar(#119);WriteChar(#1); {Пропорциональная печать включена} 
  WriteString('BGUIR');
  WriteChar(#27);WriteChar(#119);WriteChar(#0); {Пропорциональная печать вЫключена} 
  
  WriteChar(#27);WriteChar('@'); { общий сброс}
  WriteChar(#27);WriteChar(#51);WriteChar(#108); {h2 = 1,5. задание интервала м/у строками}
  WriteChar(#13);WriteChar(#10); {перевод строки, возврат каретки}
  //определение знака пользователя: --------------
  WriteChar(#27);WriteChar(#38);WriteChar(#0);WriteChar('A');WriteChar('A');
  //задание контура знака пользователя: -----------
  WriteChar(#16);WriteChar(#48);WriteChar(#32);
  WriteChar(#96);WriteChar(#64);WriteChar(#255);
  WriteChar(#64);WriteChar(#96);WriteChar(#32);
  WriteChar(#48);WriteChar(#16);
  //печать пользовательского знака: ---------
  for i := 1 to 50 do 
  begin
    WriteChar(#27);WriteChar(#37);WriteChar(#1);WriteChar('A'); 
  end;
  WriteChar(#13);WriteChar(#10); {перевод строки, возврат корретки}
  WriteChar(#27);WriteChar(#108);WriteChar(#20); //от левого края
  WriteChar(#27);WriteChar('X');WriteChar(#1); {Качественная печать включена}
  WriteString('OTCHET');
  WriteChar(#27);WriteChar('X');WriteChar(#0); {Качественная печать вЫключена}
  
  WriteChar(#27);WriteChar(#51);WriteChar(#255); // h3 = 3. отступ вниз
  WriteChar(#13);WriteChar(#10); {перевод строки, возврат корретки}
  WriteChar(#27);WriteChar(#108);WriteChar(#5); //от левого края
  WriteChar(#27);WriteChar('W');WriteChar(#1); // Печать «Двойная ширина» включена
  WriteString('PO LABORATORNOI RABOTE #6');
  WriteChar(#27);WriteChar('W');WriteChar(#0); // Печать «Двойная ширина» вЫключена
  WriteChar(#13);WriteChar(#10);
  WriteChar(#27);WriteChar(#108);WriteChar(#19); //от левого края
  WriteChar(#27);WriteChar(#119);WriteChar(#1); {Двойная высота включена}
  WriteString('KURS - PU EVM');
  WriteChar(#27);WriteChar(#119);WriteChar(#0);{Двойная высота вЫключена}
  WriteChar(#13);WriteChar(#10); //{перевод строки, возврат корретки}
  
  WriteChar(#27);WriteChar(#51);WriteChar(#212);// h4 = 2,5. отступ вниз 
  WriteChar(#27);WriteChar(#108);WriteChar(#5); //от левого края
  
  WriteChar(#27);WriteChar(#119);WriteChar(#1); {Двойная высота включена}
  WriteString('Student');
  WriteChar(#27);WriteChar(#119);WriteChar(#0);{Двойная высота вЫключена}
  WriteChar(#27);WriteChar(#36);WriteChar(#250);WriteChar(#0);{абсолютная позиция печати слова «Проверил» в текущ строке}
  
  WriteChar(#27);WriteChar('E'); {Акцентированная печать включена}
  WriteString('Proveril'); 
  WriteChar(#27);WriteChar('F'); {Акцентированная печать вЫключена}
  //фамилии: -------------------------
  WriteChar(#27);WriteChar('@'); 
  WriteChar(#13);WriteChar(#10); //{перевод строки, возврат корретки}
  WriteChar(#27);WriteChar(#108);WriteChar(#3); //от левого края
  WriteChar(#27);WriteChar('P'); //шрифт "Пайк"
  WriteString('KARPEKO N. G.'); //ФИО студента
  
  WriteChar(#27);WriteChar(#36);WriteChar(#250);WriteChar(#0);{абсолютная позиция печати «LEVANTSEVICH V. A.» в текущ строке}
  WriteChar(#27);WriteChar('M');{Элит включен}  
  WriteString('LEVANTSEVICH V. A.');  
  WriteChar(#27);WriteChar('P'); {Элит вЫключен}    
  
  //формирование знака: ----------------
  WriteChar(#13);WriteChar(#10); 
  WriteChar(#27);WriteChar(#51);WriteChar(#392); // h5 = 6. отступ вниз
  //определение знака пользователя: ----------
  WriteChar(#27);WriteChar('A');WriteChar(#8); {задание n/72 расстояния м/у строками}
  WriteChar(#27);WriteChar(#36);WriteChar(#30);WriteChar(#0);{абсолютное положение печати}
  WriteChar(#27);WriteChar('K');WriteChar(#60);WriteChar(#0); {параметры графики}
  
  for n := 1 to 5 do 
  begin
    WriteChar(#64);WriteChar(#255);WriteChar(#64);WriteChar(#255);
    WriteChar(#64);WriteChar(#255);WriteChar(#64);WriteChar(#255);
    WriteChar(#64);WriteChar(#255);WriteChar(#64);
  end;
  //Минск 2020: ---------------------
  WriteChar(#13);WriteChar(#10); {перевод строки, возврат корретки}
  WriteChar(#27);WriteChar(#51);WriteChar(#212); // h6 = 2,5. отступ вниз
  WriteChar(#27);WriteChar(#108);WriteChar(#23); //от левого края
  
  WriteChar(#27);WriteChar(#119);WriteChar(#1); {Пропорциональная печать включена} 
  WriteString('MINSK');
  WriteChar(#27);WriteChar(#119);WriteChar(#0); {Пропорциональная печать вЫключена} 
  
  WriteChar(#13);WriteChar(#10);
  WriteChar(#27);WriteChar(#51);WriteChar(#36);
  WriteChar(#27);WriteChar(#108);WriteChar(#21);
  
  WriteChar(#27);WriteChar('W');WriteChar(#1); //Печать «Двойная ширина» включена
  WriteString('2020');
  WriteChar(#27);WriteChar('W');WriteChar(#0); //Печать «Двойная ширина» выключена
  Close(LST);
  Readln;  
END.
