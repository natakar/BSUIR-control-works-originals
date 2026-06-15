program IPR1_2_1;
uses
  crt;
type
  PType = ^TStek;
  TStek = record
            Elem: Char;
            next: PType;
          end;
//---- Добавление к стеку stk элемента data -------------------------
procedure AddStek(var stk: PType; data: Char);
var
  X: PType;
begin
  new(X);       		//Добавляемый элемент
  X^.Elem := data;
  X^.next := stk;     //Стек строим так, что next ссылался на то, что положили раньше				
  stk := X;
end;
//----- Забрать из стека верхний элемент ---------------------------
function GetStek(var stk: PType): Char;
begin
  if stk <> nil then      //если стек не пустой
  begin
    GEtStek := stk^.Elem;
    stk := stk^.next;     //Убираем элемент из стека
  end
  else
    GetStek := #0;      //если стек пустой - возвращаем символ #0
end;
//--- Получить стековый приоритет символа с -----------------
function StekPriority(c: Char): Integer;
begin
  case c of   //приоритет элемента, который уже есть в стеке
    '+', '-': Result := 2;
    '*', '/': Result := 4;
    '^': Result := 5;
    'a'..'z', 'A'..'Z': Result := 8;
    '(': Result := 0;
  else
    Result := 10;     //Для неизвестного символа возвращаем 10
  end;
end;
//--- Получить относительный приоритет символа с ----------------
function InpPriority(c: Char): Integer;
begin
  case c of  //приоритет элемента, который хотим положить в стек
    '+', '-': Result := 1;
    '*', '/': Result := 3;
    '^': Result := 6;
    'a'..'z', 'A'..'Z': Result := 7;
    '(': Result := 9;
    ')': Result := 0;
  else
    Result := 10;       //Для неизвестного символа возвращаем 10
  end;
end;
//----- Возвращает ранг символа в польской записи ---------------
function CharRang(c: Char): integer;
begin
  if c in ['a'..'z', 'A'..'Z'] then
    Result := 1                      //Для операнда ранг 1
  else
    Result := -1;                    //Для оператора -1
end;

VAR
  stk: PType;
  input, output: string;	// input – вводимое инфиксное выражение
  Rang, i: Integer;		// Rang - ранг
  Ch: Char;
BEGIN
  stk := nil;     //Стек пустой
  Rang := 0;     //Обнуляем ранг
  output := '';  //Обнуляем выводимую строку (постфиксное выражение)  
  Write('  Инфиксная форма: ');   Readln(input); Writeln;  
  i := 1;
  while i <= Length(input) do //пока не дойдем до последнего элемента
    //Стек пуст или у верхнего элемента стека меньший приоритет
    if (stk = nil) or (InpPriority(Input[i]) > StekPriority(stk^.Elem)) then
    begin
      if Input[i] <> ')' then 		// ( в стек класть не надо 
        AddStek(stk, input[i]); 	//кладем входной символ в стек
      i := i + 1;                			//следующий символ
    end
    else    //Стек не пустой или приоритет символа стека больше, чем входного
    begin
      Ch := GetStek(stk);       //Забираем из стека верхний символ стека
      if Ch <> '(' then         // ( Добавлять в результат не надо
      begin
        output := output + Ch;          //Дописываем к выходной строке
        Rang := Rang + CharRang(Ch);    //Изменяем ранг выражения
      end;
    end;      //переходим к следующему символу входной строки   
  while not (stk = nil) do      //дописываем то, что осталось в стеке
  begin
    Ch := GetStek(stk);           //Забираем из стека верхний символ
    if Ch <> '(' then             // ( Добавлять в результат не надо
      output := output + Ch;      //Дописываем к выходной строке
  end;  
  Writeln('  Постфиксная форма: ', output); Writeln;
  Writeln('  Ранг выражения: ', Rang);
  Readln;
END.
