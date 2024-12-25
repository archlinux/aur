{ Module contains composition of string functions }
unit func_str_composition;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, types_for_app;

function ApplyStringFunctions(input: String; funcs: TFuncStrArray): String;
procedure ComposeStrFunc(var funcs: TFuncStrArray;   f : TFuncStr);

implementation

function ApplyStringFunctions(input: String; funcs: TFuncStrArray): String;
   var
     i: Integer;
     res: String;
     fs : TFuncStr;
   begin
     res := input;
     for i := High(funcs) downto Low(funcs) do
     begin
       fs := funcs[i];
       res := fs(res);
     end;
     Result := res;
   end;

procedure ComposeStrFunc(var funcs: TFuncStrArray;   f: TFuncStr);
begin
  SetLength( funcs, Length(funcs) + 1);
  funcs[ High(funcs) ] := f;
end;

end.

