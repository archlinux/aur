{ Создает случайные данные }
unit random_data;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils;

{ Случайное слово }
function GetRandomWord: String;
{ Случайное предложение }
function GetRandomSentence: String;
{ Случайный параграф }
function GetRandomParagraph: String;
{ Случайный текст из нескольких параграфов }
function GenerateHTMLParagraphs(N: Integer): String;
{ Случайный ID}
function getRandomString(N: Integer): String;
{ Случайная категория из заданных }
function getRandomCategory(const Categories: array of String): String;



implementation

function GetRandomWord: String;
const
  Words: array[0..9] of String = (
    'Lorem', 'ipsum', 'dolor', 'sit', 'amet', 'consectetur', 'adipiscing', 'elit', 'sed', 'do'
  );
begin
  Result := Words[Random(Length(Words))];
end;


function GetRandomSentence: String;
var
  i, WordCount: Integer;
begin
  WordCount := Random(5) + 4; // Random sentence length between 4 and 8 words
  Result := '';
  for i := 1 to WordCount do
  begin
    Result := Result + GetRandomWord;
    if i < WordCount then
      Result := Result + ' '; // Add space between words
  end;
  Result := Result + '.'; // End sentence with a period
end;

function GetRandomParagraph: String;
var
  i, SentenceCount: Integer;
begin
  SentenceCount := Random(4) + 3; // Random paragraph length between 3 and 6 sentences
  Result := '';
  for i := 1 to SentenceCount do
  begin
    Result := Result + GetRandomSentence;
    if i < SentenceCount then
      Result := Result + ' '; // Add space between sentences
  end;
end;


function GenerateHTMLParagraphs(N: Integer): String;
var
  i: Integer;
begin
  Result := '';
  for i := 1 to N do
  begin
    Result := Result + '<p>' + GetRandomParagraph + '</p>';
    if i < N then
      Result := Result + LineEnding; // Add line break between paragraphs
  end;
end;

function getRandomString(N: Integer): String;
const
  AlphanumChars = 'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789';
var
  i, RandomIndex: Integer;
begin
  Result := '';
  if N <= 0 then
    Exit; // Return an empty string if N is not positive

  for i := 1 to N do
  begin
    RandomIndex := Random(Length(AlphanumChars)) + 1; // Random index between 1 and Length(AlphanumChars)
    Result := Result + AlphanumChars[RandomIndex];   // Append the randomly selected character
  end;
end;

function getRandomCategory(const Categories: array of String): String;
var
  RandomIndex: Integer;
begin
  if Length(Categories) = 0 then
  begin
    Result := ''; // Return an empty string if the array is empty
    Exit;
  end;

  RandomIndex := Random(Length(Categories)); // Generate a random index
  Result := Categories[RandomIndex];         // Return the item at the random index
end;

end.

