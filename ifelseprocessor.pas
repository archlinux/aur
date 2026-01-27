unit ifelseprocessor;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, RegExpr;

function ProcessIfElse(const Text: string): string;

implementation

function ProcessIfElse(const Text: string): string;
var
  re: TRegExpr;
begin
  re := TRegExpr.Create('@ifelse\[([^\]]+)\](==|!=)\[([^\]]+)\]\{([^\}]*)\}\{([^\}]*)\};');
  try
    Result := Text;
    if re.Exec(Text) then
    begin
      repeat
        // Extract matched groups
        if (re.Match[2] = '==') and (re.Match[1] = re.Match[3]) then
          // Condition true - use left output
          Result := StringReplace(Result, re.Match[0], re.Match[4], [])
        else if (re.Match[2] = '!=') and (re.Match[1] <> re.Match[3]) then
          // Condition true - use left output
          Result := StringReplace(Result, re.Match[0], re.Match[4], [])
        else
          // Condition false - use right output
          Result := StringReplace(Result, re.Match[0], re.Match[5], []);
      until not re.ExecNext;
    end;
  finally
    re.Free;
  end;
end;

end.
