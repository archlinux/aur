unit emoji_shortcodes;
(* Module for generation emojis *)
{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, fpjson, jsonparser, types_for_app;

{ Gets all available shortcodes }
function getEmojiShortCodes() : TEmojiShortCodesArray;
{ Applying emojis to html text }
function withEmojies(text : String; var emojiArray : TEmojiShortCodesArray ) : String;

implementation

{ Функция для получения всех коротких кодов эмодзи }
function getEmojiShortCodes(): TEmojiShortCodesArray;
var
  arr: TEmojiShortCodesArray;
  jsonData: TStringList;
  jsonObject: TJSONData;
  emojiArray: TJSONArray;
  i: Integer;
begin
  jsonData := TStringList.Create;
  try
    jsonData.LoadFromFile('emojis.json'); // Загружаем JSON файл
    jsonObject := GetJSON(jsonData.Text);
    emojiArray := jsonObject.FindPath('emojis') as TJSONArray;

    SetLength(arr, emojiArray.Count); // Задаем размер массива согласно количеству эмодзи

    // Заполняем массив короткими кодами и соответствующими эмодзи
    for i := 0 to emojiArray.Count - 1 do
    begin
      arr[i].shortcode := emojiArray[i].FindPath('shortname').Value; // Получаем короткий код
      arr[i].utf8symbol := emojiArray[i].FindPath('emoji').Value; // Получаем символ эмодзи
    end;

    Result := arr; // Возвращаем массив коротких кодов
  finally
    jsonData.Free;
  end;
end;

{ Функция для применения эмодзи к тексту }
function withEmojies(text: String; var emojiArray : TEmojiShortCodesArray ): String;
var
  i: Integer;
begin
  emojiArray := getEmojiShortCodes(); // Получаем массив коротких кодов

  // Проходим по каждому короткому коду и заменяем его на соответствующий эмодзи
  for i := Low(emojiArray) to High(emojiArray) do
  begin
    text := StringReplace(text, emojiArray[i].shortcode, emojiArray[i].utf8symbol, [rfReplaceAll]);
  end;

  Result := text; // Возвращаем измененный текст
end;

end.

