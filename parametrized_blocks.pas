unit parametrized_blocks;

{$mode ObjFPC}{$H+}


interface
  
uses
  SysUtils, Classes, RegExpr, fgl;
type
  TStringMap = specialize TFPGMap<String, String>;

  { парсит из строки *var1 *var2 имена переменных }
  function ParseVariablesToMap(const t: String): TStringMap;

{ сканирует строку >< var1=`value` var2=`value2` >< на значения переменных }
function scanForPartialVariables(const t: String): TStringMap;

{ заполняет переменные - слева приемник, справа источник из  scanForPartialVariables}
procedure FillPartialVariables(var ScannedVariables, Variables: TStringMap);

{ для отладки распечатка словаря }
procedure printStringMap(const Variables: TStringMap);

{применение к строке заполненного словаря}
function applyPartialVariables(var scannedVariables: TStringMap; const htmlTemplate: String): String;


  {находит все параметризованные блоки}
  function getParametrizedBlocks(t: String): TStringMap;

  {применяет параметры параметризованных блоков к строке с ними}
  function makeParametrization(var html: String; var GlobalBlocks : TStringMap): String;

implementation


function ParseVariablesToMap(const t: String): TStringMap;
var
  Regex: TRegExpr;
  Key, Value: String;
  Map: TStringMap;
begin
  Map := TStringMap.Create;
  Map.Sorted := True; // Optional: keep map sorted for faster lookups
  // Map.Duplicates := dupIgnore; // Optional: handle duplicate keys

  // Initialize regex to match var_name=`var_value` patterns
  Regex := TRegExpr.Create;
  try
    // Regex pattern explanation:
    // \s* - optional whitespace
    // ([a-zA-Z_][a-zA-Z0-9_]*) - variable name (group 1)
    // =` - equals sign and backtick
    // ([^`]*) - any characters except backtick (group 2)
    // ` - closing backtick
    Regex.Expression := '\s*([a-zA-Z_][a-zA-Z0-9_]*)=`([^`]*)`';

    if Regex.Exec(t) then
    begin
      repeat
        Key := Regex.Match[1];
        Value := Regex.Match[2];
        Map['*' + Key] := Value;
      until not Regex.ExecNext;
    end;
  finally
    Regex.Free;
  end;

  Result := Map;
end;


function scanForPartialVariables(const t: String): TStringMap;
var
  Regex: TRegExpr;
  VarName: String;
  Map: TStringMap;
begin
  // Writeln('К сканированию на поиск *variable1 *variable2 = ', t);
  Map := TStringMap.Create;
  Map.Sorted := True; // Optional: keep map sorted
  // Map.Duplicates := dupIgnore; // Optional: handle duplicate keys

  // Initialize regex to match *var_name patterns
  Regex := TRegExpr.Create;
  try
    // Regex pattern explanation:
    // \* - matches the asterisk character
    // ([a-zA-Z_][a-zA-Z0-9_]*) - variable name (group 1)
    // (?!\w) - negative lookahead to ensure we don't match partial words
    Regex.Expression := '(\*([a-zA-Z0-9_]+))(\w)';

    if Regex.Exec(t) then
    begin
      repeat
        VarName := Copy(Regex.Match[0], 1, Length(Regex.Match[0]));
        // Writeln('Сканировано ключ ', VarName);
        Map[VarName] := ''; // Set empty string as value
      until not Regex.ExecNext;
    end;
  finally
    Regex.Free;
  end;

  Result := Map;
end;

procedure FillPartialVariables(var ScannedVariables, Variables: TStringMap);
var
  i: Integer;
  Key: String;
begin
  for i := 0 to Variables.Count - 1 do
  begin
       Key := Variables.Keys[i];
       ScannedVariables[Key] := Variables[Key];
  end;
end;


procedure printStringMap(const Variables: TStringMap);
var
  i: Integer;
  Key: String;
begin
  for i := 0 to Variables.Count - 1 do
  begin
       Key := Variables.Keys[i];
       // Writeln('ключ = ', Key, ' значение = ',Variables[Key]);
  end;
end;



function applyPartialVariables(var scannedVariables: TStringMap; const htmlTemplate: String): String;
var
  ResultStr: String;
  i: Integer;
  VarName, VarValue: String;
begin
  ResultStr := htmlTemplate;
  // Writeln('Исходное: ', resultstr);
  for i := 0 to scannedVariables.Count - 1 do
  begin
    VarName := scannedVariables.Keys[i];
    // Writeln('Имя переменной ', VarName);
    VarValue := scannedVariables.KeyData[VarName];
    // Writeln('Значение ', VarValue);
    // Заменяем все вхождения VarName на VarValue, без учёта регистра
    ResultStr := StringReplace(ResultStr, VarName, VarValue, [rfReplaceAll, rfIgnoreCase]);
    // Writeln('После замены ', resultstr);
  end;

  Result := ResultStr;
end;




function getParametrizedBlocks(t: String): TStringMap;
var
regex: TRegExpr;
key, value: String;
begin
Result := TStringMap.Create;

// Initialize regular expression
regex := TRegExpr.Create;
try
  // Pattern to match {stringname >< some text >< }
  regex.Expression := '\{([^\s>]+)\s*><\s*(.*?)\s*><\s*\}';
  regex.ModifierS := True; // Single line mode (dot matches newlines)

  if regex.Exec(t) then
  begin
    repeat
      // First capture group is the key (stringname)
      key := regex.Match[1];
      // Second capture group is the value (>< some text ><)
      value := regex.Match[2];

      // Add to the map
      Result[key] := value;
    until not regex.ExecNext;
  end;
finally
  regex.Free;
end;
end;

{ Выполняет подстановки, GlobalBlocks вычисляем перед использованием }
function makeParametrization(var html: String; var GlobalBlocks : TStringMap): String;
var
callsOfBlocks : TStringMap;
I : Integer;
blockname : String;
blockhtml : String;
blockparams : String;
replacement : String;
resultstr, key, params : String;
variables, scannedvariables : TStringMap;
begin
  resultstr := html;
  callsOfBlocks:=getParametrizedBlocks(html);
  // Writeln('html is ', html);
  // Writeln('globalblocks are ');
  printStringMap(GlobalBlocks);
  // Writeln('Найдено блоков:', callsOfBlocks.Count);
  printStringMap(callsOfBlocks);
  for I:=0 to callsOfBlocks.Count - 1 do begin
      blockname := callsOfBlocks.Keys[i];
      blockparams := callsOfBlocks[blockname];
      blockhtml := GlobalBlocks[blockname];
      // Writeln('Текущий блок ', blockhtml);
      variables := ParseVariablesToMap(blockparams);
      // Writeln('Переменные для замены из блока ');
      printStringMap(variables);
      scannedvariables := scanForPartialVariables(blockhtml);
      // Writeln('Переменные из вызова блока ');
      printStringMap(scannedvariables);
      FillPartialVariables(scannedvariables, variables);
      // Writeln('После присваивания ');
      printStringMap(scannedvariables);
      replacement := applyPartialVariables(scannedvariables, blockhtml);
      // Writeln('Вычислена замена ', replacement);
      resultstr:=stringreplace(resultstr, '{'+blockname+ ' >< ' + blockparams + ' >< }', replacement,    [rfReplaceAll, rfIgnoreCase]);
      // Writeln('Образец после замены: ', resultstr);
end;
  result:=resultstr;
       end;
end.

