{ Contains classes TAsyncWriter, TAsyncWriteExecutor, TFilesQueue for concurrent writing
html files using queue}
unit AsyncQueue;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils;


type

  { TAsyncWriter }
  { Writer of file with given filename and data }
  TAsyncWriter = class
  private
    { Name of file, absolute path }
    filename : String;
    { Text of html file }
    data : String;

  public
    { Creates a writer for text file aFilename with content aData }
    constructor Create(aFilename : String; aData : String );
    { Write document using TStringList }
    procedure writeDocument();
  end;


  { TAsyncWriteExecutor }
  { Writes in separate thread writer aw }
  TAsyncWriteExecutor = class(TThread)
    public
      { Contains writer }
      aw : TAsyncWriter;
      { Name of file with absolute path }
      filename : String;
      { Text of HTML or other file}
      data : String;
      { Creates thread, CreateSuspended should be true}
      constructor Create(CreateSuspended : boolean);
      { Setter for members filename, data }
      procedure setArgs(aFilename : String; aData : String);
  protected
    { Launch aw.writedocument }
    procedure Execute(); override;
  end;



   { TFilesQueue }
   { Queue which has a list of filename and data and process
   each elements using TAsyncWriteExecutor inside processEach }
   TFilesQueue = class

     public
           { Dynamic array of file names }
           filenames : Array of String;
           { Dynamic arrays of file data }
           files : Array Of String;
           { Index of last added file}
           last : integer;
           { Create queue }
           constructor Create();
           { add file data and file name to queue}
           procedure AddToJob(data : String; filename : String);
           { processing of each elements in queue }
           procedure processEach();


   end;







implementation

{ TFilesQueue }

constructor TFilesQueue.Create();
begin
  last := -1;
  SetLength(filenames, 9999);
  SetLength(files, 9999);
end;

procedure TFilesQueue.AddToJob(data: String; filename : String);
begin
   last:=last+1;
   filenames[last]:=filename;
   files[last] := data;
end;

procedure TFilesQueue.processEach();
var
   i : Integer;
   aw : Array Of TAsyncWriteExecutor;
begin
  setLength(aw, last+1);
  for i:=0 to last do begin
      aw[i] := TAsyncWriteExecutor.Create(True);
      aw[i].setArgs(filenames[i], files[i]);
  end;
  for i:=0 to last do
  begin
      aw[i].Start;

  end;
end;


constructor TAsyncWriteExecutor.Create(CreateSuspended : boolean);
begin
    inherited Create(CreateSuspended);
    FreeOnTerminate := True;

end;

procedure TAsyncWriteExecutor.setArgs(aFilename: String; aData: String);
begin
  filename := aFilename;
  data := aData;
end;


procedure TAsyncWriteExecutor.Execute;

begin
  aw := TAsyncWriter.Create(filename, data);
  aw.writedocument;
end;

constructor TAsyncWriter.Create( aFilename : String; aData : String);
begin
  filename := aFileName;
  data := aData;

end;


procedure TAsyncWriter.writedocument();
var

  buffer : TStringList;


begin
  buffer  := TStringList.Create;


    if FileExists(filename) then DeleteFile(filename);
    buffer.Text:=data;
    buffer.SaveToFile(filename);

         buffer.Free;



end;

end.
