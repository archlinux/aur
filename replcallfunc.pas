unit ReplCallFunc;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils;

type
  TReplFuncCaller = class(TObject)
  function ReplaceDateFuncCall(s: String): String;
  function ReplaceTimeFuncCall(s: String): String;
end;

implementation

function TReplFuncCaller.ReplaceDateFuncCall(s: String): String;
var
  CurrentDate: String;
begin
  // Get the current date in the format 'DD.MM.YYYY'
  CurrentDate := FormatDateTime('dd.mm.yyyy', Now);

  // Replace all occurrences of 'GETDATE()' with the current date
  Result := StringReplace(s, 'GETDATE()', CurrentDate, [rfReplaceAll, rfIgnoreCase]);
end;

function TReplFuncCaller.ReplaceTimeFuncCall(s: String): String;
var
  CurrentTime: String;
begin
  // Get the current time in the format 'hh:mm:ss'
  CurrentTime := FormatDateTime('hh:nn:ss', Now);

  // Replace all occurrences of 'GETTIME()' with the current time
  Result := StringReplace(s, 'GETTIME()', CurrentTime, [rfReplaceAll, rfIgnoreCase]);
end;

end.

