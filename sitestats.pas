{ Статистика продуктивности }
unit SiteStats;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, RegExpr;

type
  { Класс для статистики текста }

  { TSiteStats }

  TSiteStats = class(TObject)
    { Очищает текст от тегов }
    function StripHTML(const HTML: String): String;
    { Подсчет числа слов в строке s }
    function CountWords(s: string): Integer;
    { Подсчет числа предложений в строке s}
    function CountSentences(s: string): Integer;
    { Подсчет числа символов в строке s}
    function CountNonSpaceChars(s: string): Integer;
    { Время на дочитывание }
    function TimeToReadingInMinutes(words_total : Integer) : Integer;
    { Подстановка статистики в текст }
    function ReplaceStats(s: string): String;
  end;

implementation

{ TSiteStats }

function TSiteStats.StripHTML(const HTML: String): String;
var
  RegEx: TRegExpr;
begin
  // Initialize the result with the input HTML string
  Result := HTML;

  // Create a new instance of TRegExpr for pattern matching
  RegEx := TRegExpr.Create;
  try
    // Define the regex pattern to match HTML tags
    RegEx.Expression := '<[^>]*>';

    // Replace all matches (HTML tags) with an empty string
    if RegEx.Exec(Result) then
      Result := RegEx.Replace(Result, '');

    // Optionally remove extra spaces caused by tag removal
    RegEx.Expression := '\s{2,}';
    if RegEx.Exec(Result) then
      Result := RegEx.Replace(Result, ' ');
  finally
    // Free the TRegExpr object
    RegEx.Free;
  end;

  // Trim the result to remove leading/trailing spaces
  Result := Trim(Result);
end;

function TSiteStats.CountWords(s: string): Integer;
var
  i, wordCount: Integer;
  inWord: Boolean;
begin
  wordCount := 0;
  i := 1;
  while (i <= Length(s)) do begin
    if (s[i] = ' ') or (s[i] = ',') or (s[i] = '.') or (s[i] = '?') or (s[i] = '!')
    or (s[i] = ':') or (s[i] = '-') then
       begin
            inWord := False;
            Inc(I);
            continue;
       end else
       begin
         if not inWord then Inc(wordCount);
         inWord:=True;
       end;
    Inc(i);
  end;
  Result := wordCount;
end;

function TSiteStats.CountSentences(s: string): Integer;
var
  i: Integer;
begin
  Result := 0;

  // Удаляем пробелы в начале и конце строки
  s := Trim(s);

  // Проверяем, есть ли в строке хотя бы один символ
  if Length(s) = 0 then
    Exit(0);

  // Считаем количество предложений
  for i := 1 to Length(s) do
  begin
    if s[i] in ['.', '!', '?'] then
      Inc(Result);
  end;

  // Если строка заканчивается на знак препинания, добавляем одно предложение
  if (Length(s) > 0) and (s[Length(s)] in ['.', '!', '?']) then
    Inc(Result);
end;


function TSiteStats.CountNonSpaceChars(s: string): Integer;
var
  i: Integer;
begin
  Result := 0;

  // Удаляем пробелы в начале и конце строки
  s := Trim(s);

  // Проверяем каждый символ строки
  for i := 1 to Length(s) do
  begin
    // Увеличиваем счетчик, если символ не является пробелом или разделителем
    if not (s[i] in [' ', '.', '!', '?', ',', ';', ':', '-', #9]) then
      Inc(Result);
  end;
end;

function TSiteStats.TimeToReadingInMinutes(words_total : Integer): Integer;
const
  Words_Per_Minutes : Integer = 150;
begin
  Result := words_total div Words_Per_Minutes;
end;

function TSiteStats.ReplaceStats(s: string): String;
var
  CharactersCount : Integer;
  WordsCount : Integer;
  SentencesCount : Integer;
  TTR : Integer;
  temp : String;
begin
     temp := s;

     s := StripHTML(s);
     CharactersCount:= CountNonSpaceChars(s);
     WordsCount:=CountWords(s);
     SentencesCount:=CountSentences(s);
     TTR:=TimeToReadingInMinutes(WordsCount);
     temp := StringReplace(temp, 'TTR()', IntToStr( TTR ), [rfReplaceAll, rfIgnoreCase]);
     temp := StringReplace(temp, 'CHARS()', IntToStr( CharactersCount ), [rfReplaceAll, rfIgnoreCase]);
     temp := StringReplace(temp, 'WORDS()', IntToStr( WordsCount ), [rfReplaceAll, rfIgnoreCase]);
     Result := StringReplace(temp, 'SENTS()',  IntToStr( SentencesCount ), [rfReplaceAll, rfIgnoreCase]);
end;

end.

