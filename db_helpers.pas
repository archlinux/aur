{ Contains helpers for using transactions and SQL queries}
unit db_helpers;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, DB, BufDataset, Forms, Controls, Graphics, Dialogs,
  DBCtrls,   SQLite3Conn, SQLDB, process,  ExtCtrls, ComCtrls, Menus, DBGrids ;


{ Check connection to database }
procedure checkConnect(var konnect : TSQLite3Connection; var tranzact : TSQLTransaction; msg: String);

{ Executes sQ sql query }
procedure  sql_execute(request: string; var konnect: TSQLite3Connection;
  var tranzact: TSQLTransaction; var sQ: TSQLQuery);

{ Executes sQ sql query directly }
procedure  sql_execute_direct(request: string; var konnect: TSQLite3Connection;
  var tranzact: TSQLTransaction );

{ Starts prepared transaction }
procedure  prepared_transaction_start(request : String; var sQ : TSQLQuery; tranzact : TSQLTransaction);

{ Ends prepared transaction }
procedure  prepared_transaction_end(var sQ : TSQLQuery; tranzact : TSQLTransaction);

{ Opens sql request }
procedure  open_sql(request : string; var sQ : TSQLQuery);


implementation

procedure checkConnect(var konnect : TSQLite3Connection; var tranzact : TSQLTransaction; msg: String);
begin
   if not konnect.Connected then
          begin
          // SilentMessage('нет соединения, переподключаюсь! <'+msg+'>');

           konnect.Open;
           tranzact.Active:=true;
              konnect.ExecuteDirect('End transaction');
         konnect.ExecuteDirect('pragma synchronous = 0');
         konnect.ExecuteDirect('pragma foreign_keys = off');
         konnect.ExecuteDirect('pragma journal_mode = off');
         tranzact.Active:=true;
         konnect.ExecuteDirect('Begin transaction');

          end;


end;

procedure  sql_execute(request: string; var konnect: TSQLite3Connection;
  var tranzact: TSQLTransaction; var sQ: TSQLQuery);
begin
  //if not konnect.Connected then konnect.Open;
  if not tranzact.Active then tranzact.StartTransaction;
  try
    sQ.SQL.Text:=request;
    sQ.ExecSQL;
  finally
    if tranzact.Active then tranzact.Commit; { or fTrans.CommitRetaining; }
  end;
end;

procedure  sql_execute_direct(request: string; var konnect: TSQLite3Connection;
  var tranzact: TSQLTransaction );
begin

  //if not tranzact.Active then tranzact.StartTransaction;
  try

    konnect.ExecuteDirect( request );
  finally
    //if tranzact.Active then tranzact.Commit; { or fTrans.CommitRetaining; }
  end;
end;

procedure  prepared_transaction_start(request : String; var sQ : TSQLQuery; tranzact : TSQLTransaction);
begin
sQ.ReadOnly:=False;
sQ.sql.text := request;
sQ.prepare;
end;

procedure  prepared_transaction_end(var sQ : TSQLQuery; tranzact : TSQLTransaction);
begin
   sQ.ExecSQL; // подготовим запрос
   // выполним транзакцию
  tranzact.CommitRetaining;  //or possibly CommitRetainin
end;

procedure open_sql(request: string; var sQ: TSQLQuery);
begin
  sQ.SQL.Text := request;
  sQ.Open;
end;

end.

