unit storing_attachments;

{$mode ObjFPC}{$H+}

interface

uses
   sqldb, db, Classes;


{ Save file to sqlite database }
procedure SaveToDatabaze(attachment_data: TBlobField; filename: string);

{ Get file from sqlite database }
procedure GetFromDatabase(attachment_data: TBlobField; filename: string);

implementation




procedure SaveToDatabaze(attachment_data: TBlobField; filename: string);
var
  stream: TFileStream;
begin

  stream := TFileStream.Create(filename, fmOpenRead);
  try

    attachment_data.LoadFromStream(stream);
  finally
    stream.Free;
  end;
end;


procedure GetFromDatabase(attachment_data: TBlobField; filename: string);
var
  stream: TFileStream;
begin

  stream := TFileStream.Create(filename, fmCreate);
  try

    attachment_data.SaveToStream(stream);
  finally
    stream.Free;
  end;
end;


end.

