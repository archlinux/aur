{ Construct URLs by page id}
unit url_constr;

{$mode ObjFPC}{$H+}

interface

uses
       SysUtils, SQLite3Conn, SQLDB;
     { Создает адреса ссылок c учетом иерархии }
     function getTreeUrl(ContentID: String;
        fileNameExt : String;
       var   konnect: TSQLite3Connection;
       var tranzact: TSQLTransaction ) : String;

implementation



function getTreeUrl(ContentID: String;
    fileNameExt : String;
   var   konnect: TSQLite3Connection;
   var tranzact: TSQLTransaction ) : String;

var

  sqlQuery: TSQLQuery;
begin
  // Initialize the connection and transaction objects
  sqlQuery := TSQLQuery.Create(nil);

  try
    sqlQuery.Database := konnect;
    sqlQuery.Transaction := tranzact;
    sqlQuery.SQL.Text := 'SELECT section.tree || "/" || content.section || "/" || content.id  AS url ' +
                         'FROM content ' +
                         'JOIN section ' +
                         'ON content.section = section.id ' +
                         'WHERE content.id = :ID';

    sqlQuery.ParamByName('ID').AsString := ContentID;
    // Execute the query
      sqlQuery.Open;

     Result :=  sqlQuery.FieldByName('url').AsString  + fileNameExt;

  finally
      // Free the objects
    sqlQuery.Free;
  end;
end;


end.

