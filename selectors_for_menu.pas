{ SQL requests for getting tree path to pages or sections for menus hierarchy }
unit selectors_for_menu;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, DB, BufDataset, Forms, Controls, Graphics, Dialogs,
  DBCtrls,   SQLite3Conn, SQLDB, process, StdCtrls, ExtCtrls, ComCtrls, Menus, DBGrids,
  db_helpers, types_for_app, replacers;

{  Returns tree path to page by page_id }
function getTreeByPageId(page_id : String;
         var konn : TSqlite3Connection; var tranz : TSqlTransaction) : String;

{  Returns tree path to section by section_id }
function getTreeBySectionId(section_id : String;
         var konn : TSqlite3Connection; var tranz : TSqlTransaction) : String;


implementation

function getTreeByPageId(page_id: String; var konn: TSqlite3Connection;
  var tranz: TSqlTransaction): String;
var
   sq : TSqlQuery;
   R : String;
begin
     R:='';
     sq:=TSqlQuery.Create(NIL);
     sq.Transaction:=tranz;
     sq.SQLConnection:=konn;

     sq.SQL.Text:='select section.tree from section '+
     ' left join content on content.section=section.id where '+
     ' content.id = "{page_id}" LIMIT 1';

     sq.SQL.Text:=applyVar(sq.SQL.Text, 'page_id', page_id);

     sq.ExecSQL;
     sq.Active:=true;
     sq.First;
     if not sq.Eof then
        R:=sq.FieldByName('tree').AsString;

     sq.Free;

     Result:= R;

end;

function getTreeBySectionId(section_id: String; var konn: TSqlite3Connection;
  var tranz: TSqlTransaction): String;
var
   sq : TSqlQuery;
   R : String;
begin
     R:='';
     sq:=TSqlQuery.Create(NIL);
     sq.Transaction:=tranz;
     sq.SQLConnection:=konn;

     sq.SQL.Text:='select section.tree from section '+
     ' where '+
     ' section.id = "{section_id}" LIMIT 1';

     sq.SQL.Text:=applyVar(sq.SQL.Text, 'section_id', section_id);

     sq.ExecSQL;
     sq.Active:=true;
     sq.First;
     if not sq.Eof then
        R:=sq.FieldByName('tree').AsString;

     sq.Free;

     Result:=R;

end;

end.

