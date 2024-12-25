{Contains class Render for build HTML file using variables}
unit RenderHtml;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, replacers, fgl, types_for_app;

type

  { Render }

  { @abstract(Template engine)
  Class for rendeing template to html using variables }
  Render = class
    { Hashmap for variables and their values }
    vars : sdict;
    { String contained HTML template }
    template : String;
    { Result of building template }
    html     : String;
    { Constructor }
    constructor Create;
    { Destructor }
    destructor Free;
    { Setter for member template }
    procedure setTemplate(aTemplate : String);
    { Setter for member vars }
    procedure setVar(varname, varvalue : String);
    { Builds member html }
    procedure buildHtml();
    { Getter of member html}
    function getHtml() : String;

  end;

implementation

{ Render }

constructor Render.Create;
begin
  vars:=sdict.Create;
end;

destructor Render.Free;
begin
  vars.Free;
end;

procedure Render.setTemplate(aTemplate: String);
begin
   template:=aTemplate;
end;

procedure Render.setVar(varname, varvalue: String);
begin
  vars.Add(varname, varvalue);
end;

procedure Render.buildHtml;
var R : String; i : Integer;
begin
  R:=template;
  for i:=0 to vars.count-1 do
   begin
     R:=applyVar(R, vars.Keys[i], vars.Data[i]);
   end;
  html:=R;
end;

function Render.getHtml: String;
begin
   buildHtml();
   result:=html;
end;

end.

