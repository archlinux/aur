{ Модуль для создания списка обратных ссылок на страницу }
unit internal_backlinks;

{$mode ObjFPC}{$H+}

interface

uses

Classes, SysUtils, DB, BufDataset, Forms, Controls, Graphics, Dialogs,
 DBCtrls,   SQLite3Conn, SQLDB, process, StdCtrls, ExtCtrls, ComCtrls, Menus, DBGrids,
 db_helpers, types_for_app;

{ Выполняет запросы к сайту, чтобы получить список обратных ссылок }
function  getBacklinks(var konnect : TSQLite3Connection;
  var tranzact : TSQLTransaction;
  var sQ: TSQLQuery) : TStringToArrayOfStrings;

function makeBacklinkHtml(var map_of_backlinks : TStringToArrayOfStrings; page_id : String) : String;


implementation

function getBacklinks(var konnect: TSQLite3Connection;
  var tranzact: TSQLTransaction;
  var sQ: TSQLQuery): TStringToArrayOfStrings;
var
  R : TStringToArrayOfStrings;
  InitialArr : TMyArrayOfStrings;
  I   : Integer;
  Key :  String;
  Values : TMyArrayOfStrings;
  S : TStringList;
begin
     S := TStringList.Create;
     R:=TStringToArrayOfStrings.Create;
     Sq.SQL.Text:='SELECT id FROM content';
     Sq.Active:=True;
     sQ.First;
     while not sQ.EOF do
           begin
             SetLength(InitialArr, 0);
             R.AddOrSetData( sQ.FieldByName('id').AsString, InitialArr);
             sQ.Next;
           end;

    For I := 0 to R.Count - 1 do
    begin
        Key := R.Keys[I];
        Values := R.Data[I];
        Sq.Active:=False;
        sq.SQL.Text:='SELECT id FROM content WHERE content LIKE "%'+Key+'%" ';
        sq.Active:=True;
        sQ.First;
        S.Clear;
        while not sQ.EOF do
           begin
             SetLength(Values, Length(Values) + 1);
             Values[ Length(Values) - 1 ] := sQ.FieldByName('id').AsString;

              R.AddOrSetData(Key, Values);

             S.Add(  Values[ Length(Values) - 1 ] );
             sQ.Next;
             Application.ProcessMessages;
           end;

             // S.SaveToFile(sQ.FieldByName('id').AsString+'.log');

    end;
    sq.Active:=False;
    S.Free;
    Result := R;



end;

function makeBacklinkHtml(var map_of_backlinks : TStringToArrayOfStrings;
  page_id: String): String;
var

  S : String;
  Backlinks : TMyArrayOfStrings;
  I : Integer;
begin
   if map_of_backlinks.TryGetData(page_id, Backlinks) then
    begin
      s := '<ul>';
      for i := 0 to High(Backlinks) do begin
        // used [page_id] shortcode
         s := s + '<li>' + '[' + Backlinks[i] + ']' + '</li>';
         Application.ProcessMessages;
      end;
      s := s + '</ul>';
    end
    else
        s := 'no backlinks';
   Result := s;
end;

end.

