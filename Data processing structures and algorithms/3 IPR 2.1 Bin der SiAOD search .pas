program tree;

uses
  crt;

type
  PNode = ^TNode;
  TNode = Record
    Key: Integer;
    LTag, RTag: Boolean;
    Left, Right: PNode;
  End;
//----------- Функция поиска элемента -----------------------
function Find(const Key: Integer; Node: PNode; var Rez: PNode): Boolean;
begin
  Result := False;
  Rez := nil;
  while (not Result) and (Node <> nil) do
  begin
    Rez := Node;
    if Node^.Key = Key  then
      Result := True
    else
    if Key < Node^.Key  then
      Node := Node^.Left
    else
      Node := Node^.Right;
  end;
end;
//-------- Процедура добавления элемента -----------------------
procedure Add(const Key: Integer; var Node: PNode);
var
  NodeTO, NewNode: PNode;
begin
  if not Find(Key, Node, NodeTO) then
  begin
    New(NewNode);
    NewNode^.Key := Key;
    NewNode^.LTag := True;
    NewNode^.RTag := True;
    NewNode^.Left := nil;
    NewNode^.Right := nil;
    if Node = nil then
      Node := NewNode
    else
    if Key < NodeTO^.Key then
      NodeTO^.Left := NewNode
    else
      NodeTO^.Right := NewNode
  end;
end;
//--- Процедура удаления элемента ----------------------
procedure Delete(var Node: PNode; Key: Integer);
var
  DelNode: PNode;
  {При первом вызове в качестве фактического параметра передается адрес
  левой после удаляемой вершины}
  procedure Ud(var R: PNode);
  begin
    if R^.Right = nil then
    begin
      DelNode^.Key := R^.Key;
      DelNode := R;
      R := DelNode^.Left;
    end
    else
      Ud(R^.Right);
  end; //Ud()---
begin //Delete() -----
  if Node = nil then            //Первый случай удаления
    Writeln('  Звено с заданным ключом в дереве отсутствует.')
  else
  if Key < Node^.Key  then
    Delete(Node^.Left, Key)
    else
  if Key > Node^.Key then
    Delete(Node^.Right, Key)
      else
  begin
    DelNode := Node;    
    if DelNode^.Right = nil  then  //второй случай удаления
      Node := DelNode^.Left
        else
    if DelNode^.Left = nil then
      Node := DelNode^.Right
    else                        //Третий случай удаления
      Ud(DelNode^.Left)//переход в левое для удаляемой вершины поддерева}
  end
end;
//----- Процедура вывода дерева на экран -----------
procedure Print_Tree(var Node: PNode; level: integer);
var
  i: integer;
begin
  if Node <> nil then
  begin
    Print_Tree(Node^.Right, level + 1);
    for i := 0 to level do
      write('   ');
    //writeln(Node^.Key, Node^.LTag, Node^.RTag);
    writeln(Node^.Key);
    Print_Tree(Node^.Left, level + 1);
  end;
end;
//--- Процедура прямого обхода дерева -------
procedure prym_print(var Node: PNode);
begin
  if Node <> nil then
  begin
    write('(', Node^.Key, ') ');
    prym_print(Node^.Left);
    write(Node^.Key, ' ');
    prym_print(Node^.Right);
    write(Node^.Key, ' ');
  end
  else
    write('0 ');
end;
//--- Процедура симметричного обхода дерева -------
procedure sim_print(var Node: PNode);
begin
  if  Node <> nil then
  begin
    write(Node^.Key, ' ');
    sim_print(Node^.Left);
    write('(', Node^.Key, ') ');
    sim_print(Node^.Right);
    write(Node^.Key, ' ');
  end
  else
    write('0 ');
end;
//--- Процедура обратного обхода дерева -------
procedure obr_print(var Node: PNode);
begin
  if  Node <> nil then
  begin
    write(Node^.Key, ' ');
    obr_print(Node^.Left);
    write(Node^.Key, ' ');
    obr_print(Node^.Right);
    write('(', Node^.Key, ') ');
  end
  else
    write('0 ');
end;

VAR
  Node: PNode;
  s: string;
  delnode, addnode: integer;
BEGIN
  repeat   
    writeln('       Выберите желаемое действие: ');
    writeln('  1 (добавить элемент), 2 (удалить элемент), 3 (выход)');
   // writeln;
    readln(s); 
    begin
      Node := nil;
      Add(8, Node); 
      Add(6, Node);
      Add(4, Node);
      Add(2, Node);
      Add(7, Node);
      Add(5, Node);
      Add(13, Node);
      Add(9, Node);
      Add(11, Node);
      Add(16, Node);      
      if s = '1' then
      begin
        write('  Введите значение добавляемой вершины:  ');
        readln(addnode);
        Add(addnode, Node);
      end;
      if s = '2' then
      begin
        write('  Введите значение удаляемой вершины:  ');
        readln(delnode);
        Delete(Node, delnode);
         writeln('  Элемент ', delnode, ' удален.');writeln;
      end;      
      writeln('  Бинарное дерево поиска:');
      Print_Tree(Node, 0); writeln;
      writeln('  Симметричный обход:');
      sim_print(Node); writeln;
      writeln('  Прямой обход:');
      prym_print(Node); writeln;
      writeln('  Обратный обход:');
      obr_print(Node); writeln;
      writeln('---------------------------------------');    
    end;
    if s = '3' then exit
  until s = '3';  
  readln;
END.
