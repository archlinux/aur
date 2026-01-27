{ Модуль для автозаполнения многострочного поля базы данных }
unit dbmemo_autocomplete;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, StdCtrls, DBCtrls;

{ Связывает автозаполнение и поле ввода }
procedure bindAutocomplete(var list: TListBox;
  var dbmemo : TDbMemo;
  var currentWord : String;
  var foundWord : Boolean);

{ Обработчик выбора автодополнения }
procedure bindChange(var list: TListBox; var dbmemo: TDbMemo);

implementation

procedure bindAutocomplete(var list: TListBox;
  var dbmemo : TDbMemo;
  var currentWord : String;
  var foundWord : Boolean);
var
  CaretPos: Integer;
  TextBeforeCaret, WordToLeft: String;
  i: Integer;
begin
  // Get the current caret position
  CaretPos := dbmemo.SelStart;

  // Extract the text before the caret
  TextBeforeCaret := Copy(dbmemo.Text, 1, CaretPos);

  // Find the last word before the caret
  WordToLeft := '';
  for i := Length(TextBeforeCaret) downto 1 do
  begin
    if  (TextBeforeCaret[i] = '{') or (TextBeforeCaret[i] = '}') or
        (TextBeforeCaret[i] = '(') or (TextBeforeCaret[i] = ')') or
        (TextBeforeCaret[i] = '[') or (TextBeforeCaret[i] = ']') or
        (TextBeforeCaret[i] = '<') or (TextBeforeCaret[i] = '>') or
       (TextBeforeCaret[i] = '~') or (TextBeforeCaret[i] >= 'A') and (TextBeforeCaret[i] <= 'Z') or
       (TextBeforeCaret[i] >= 'a') and (TextBeforeCaret[i] <= 'z') or
       (TextBeforeCaret[i] >= '0') and (TextBeforeCaret[i] <= '9') then
    begin
      WordToLeft := TextBeforeCaret[i] + WordToLeft;
    end
    else
    begin
      Break; // Stop when encountering a non-word character
    end;
  end;
  // Output the word to the left of the caret
    foundWord := False;
    for i := 0 to list.Items.Count-1 do begin
      if list.Items[i].StartsWith(WordToLeft) then begin
        foundWord:=True;
        break;
      end;
    end;
    list.Visible:=foundWord and (wordToLeft <> '');

    list.Parent := dbMemo;

    list.Top := dbMemo.Height div 2 - list.Height div 2;
    list.Left := dbMemo.Width div 2 - list.Width div 2;
    currentWord := wordToLeft;
end;

procedure bindChange(var list: TListBox; var dbmemo: TDbMemo);
var
  txt: String;
  CaretPos: Integer;
  DelPos : Integer;
begin
  if list.ItemIndex = 0 then list.Visible:=false;

  // Get the selected item from the autocomplete list
  if list.ItemIndex > 0 then
  begin
    txt := list.Items[list.ItemIndex];

    // Hide the autocomplete list
    list.Hide;

    // Get the current caret position in the TDbMemo
    CaretPos := dbmemo.SelStart;

    // Insert the selected text at the caret position
    dbmemo.Text := Copy(dbmemo.Text, 1, CaretPos) + txt +
                          Copy(dbmemo.Text, CaretPos + 1, Length(dbmemo.Text));

    DelPos := CaretPos-1;
    while (DelPos>=0) do begin
      dbmemo.Lines.Text:=dbmemo.Lines.Text.Remove(DelPos, 1);
      if dbmemo.Text[DelPos] = ' ' then break;
      Dec(DelPos);
    end;
    // Update the caret position after insertion
    dbmemo.SelStart := DelPos + Length(txt);
    list.ItemIndex:=-1;
  end;
end;


end.

