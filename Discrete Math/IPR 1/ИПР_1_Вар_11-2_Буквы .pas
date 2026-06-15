program IPR_1_VAR_11_ABCDF;//программа с элементами - буквы ABCDF

uses crt;  
const
  n = 5;

type
  NumbSet = array[1..n] of char; //of byte;

var
  x, y: NumbSet; //a, b: NumbSet;
  i, m, j: integer;
//---- Процед-а вывода массива (заготовка) -------
procedure PrintSubSet(j: integer);
var
  i: integer;
begin
  if j = m then  //m – вводим кол-во цифр в 1 наборе (строке)
  begin
    writeln;write('   '); //чтоб столбиками по m-цифр вывод
    for i := 1 to j do 
      write(y[i], ' ')//вывели 1 строчку из m цифр
  end
end;
//---- Процед-а формирования сочетаний ------- 
procedure SubSet(k: integer);//k – к-во цифр в 1 наборе (как m)
begin//здесь к - вместо m: к-во цифр в 1 комбинац.
  if k <= n then //если к-во цифр в 1 комбинаац <= имеющихся цифр
  begin
    Inc(j); //j:= j+1; - следующая позиция цифры в наборе
    y[j] := x[k];
    PrintSubSet(j);//вывели строчку из 3 цифр??
    SubSet(k + 1);//перешли к следующ ?? чему?
    Dec(j);
    SubSet(k + 1);
  end
end;
 //---- Основная прога ------- 
BEGIN
  clrscr;
  for i := 1 to n do 
  x[1] := 'a';//выводимый массив, его эл-ты - буквы 
  x[2] := 'b';
  x[3] := 'c';
  x[4] := 'd';
  x[5] := 'f';
  write(' Введите количество элементов: m = ');readln(m);
  j := 0;   //т к Inc(j): чтобы начинать с 1
  SubSet(1);  //начиная с какой цифры будет комбинация цифр
  readln;
END.
