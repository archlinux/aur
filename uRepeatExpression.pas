unit uRepeatExpression;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils;

function ProcessRepeatExpression(const input: string): string;

implementation

function ProcessRepeatExpression(const input: string): string;
var
  startPos, endPos: Integer;
  repeatContent, varPart, casesPart, template: string;
  cases: TStringList;
  i: Integer;
  varName: string;
  outputBuilder: TStringList;
begin
  Result := input;
  outputBuilder := TStringList.Create;
  try
    outputBuilder.Text := input;

    // Find @repeat pattern
    startPos := Pos('@repeat', outputBuilder.Text);
    while startPos > 0 do
    begin
      endPos := Pos(']]', outputBuilder.Text, startPos);
      if endPos = 0 then Break;

      // Extract the entire repeat block
      repeatContent := Copy(outputBuilder.Text, startPos, endPos - startPos + 2);

      // Extract variable definition part { var = case1|case2|caseN }
      varPart := Copy(repeatContent,
                     Pos('{', repeatContent) + 1,
                     Pos('}', repeatContent) - Pos('{', repeatContent) - 1);
      varPart := Trim(varPart);

      // Get variable name and cases
      varName := Trim(Copy(varPart, 1, Pos('=', varPart) - 1));
      casesPart := Trim(Copy(varPart, Pos('=', varPart) + 1, Length(varPart)));

      // Split cases
      cases := TStringList.Create;
      try
        cases.Delimiter := '|';
        cases.StrictDelimiter := True;
        cases.DelimitedText := casesPart;

        // Extract template [[ string &var; other ]]
        template := Copy(repeatContent,
                        Pos('[[', repeatContent) + 2,
                        Pos(']]', repeatContent) - Pos('[[', repeatContent) - 2);
        template := Trim(template);

        // Process each case
        Result := '';
        for i := 0 to cases.Count - 1 do
        begin
          if i > 0 then Result := Result + ' ';
          Result := Result + StringReplace(template, '&' + varName + ';', cases[i], [rfReplaceAll]);
        end;

        // Replace the original @repeat block with processed content
        outputBuilder.Text := StringReplace(outputBuilder.Text, repeatContent, Result, []);
      finally
        cases.Free;
      end;

      // Look for next @repeat pattern
      startPos := Pos('@repeat', outputBuilder.Text);
    end;

    Result := Trim(outputBuilder.Text);
  finally
    outputBuilder.Free;
  end;
end;

end.
