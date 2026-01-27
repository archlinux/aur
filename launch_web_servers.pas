unit launch_web_servers;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, StdCtrls, SysUtils, UTF8Process,
   blcksock, sockets,
  Synautil, synaip, synsock, ftpsend;
type

{ TPythonServerLauncher }

TPythonServerLauncher = class(TThread)
 private
   p : TProcessUTF8;
 protected
   procedure Execute; override;
 public
   port : String;
   ipaddress : String;
   dirpath : String;

 end;


{ TPhpServerLauncher }

TPhpServerLauncher = class(TThread)
 private
   p : TProcessUTF8;
 protected
   procedure Execute; override;
 public
   port : String;
   ipaddress : String;
   dirpath : String;
 end;

{ TOwnServerLauncher }

TOwnServerLauncher = class(TThread)
 private
   p : TProcessUTF8;

    procedure ThreadDone(Sender: TObject);


 protected
   procedure Execute; override;
 public
   { Кеш - для веб сервера }
    Cache: TStringList;
   port : String;
   ipaddress : String;
   dirpath : String;
   PrefferedExtension : String;
      { Сокеты для сетевых соединений }
    ListenerSocket, ConnectionSocket: TTCPBlockSocket;
     { Обработчик подключений к локальному серверу}
      constructor Create(CreateSuspended: Boolean);
      destructor Destroy;
    procedure AttendConnection(ASocket: TTCPBlockSocket);
    procedure initCache;
    procedure StartOwnServer;
   procedure StopOwnServer;
   function OutputHTMLFile(uri: string): string;
 end;

implementation

{ TPythonServerLauncher }

procedure TPythonServerLauncher.Execute;
begin
  p := TProcessUTF8.Create(nil);
  p.executable:='konsole';
  p.parameters.Add('-e');
  p.Parameters.Add('/usr/bin/python');
  p.parameters.add('-m');
  p.Parameters.add('http.server');
  p.Parameters.Add('-b');
  p.Parameters.Add(ipaddress);
  p.Parameters.Add(port);
  p.Parameters.Add('-d');
  p.Parameters.Add(dirpath);





  p.execute;

  while not Self.Terminated do begin
        p.WaitOnExit();
        while p.Active do if Self.Terminated then
              break;
        if p.Active = False then
           break;
        end;


  //p.Free;
  //output.Free;
end;

{ TPhpServerLauncher }

procedure TPhpServerLauncher.Execute;

begin

  p := TProcessUTF8.Create(nil);
  p.executable:='konsole';
  p.parameters.Add('-e');
  p.Parameters.Add('/usr/bin/php');
  p.parameters.add('-S');;
  p.Parameters.Add(ipaddress+':'+port);
  p.Parameters.Add('-t');
  p.Parameters.Add(dirpath);





  p.execute;
  while p.Active do ;

 // p.Free;
 // output.Free;
end;

{ TOwnServerLauncher }


function TOwnServerLauncher.OutputHTMLFile(uri: string): string;

var
  path, fullq: string;
  Buf: TStringList;
  r: string;
begin
  if uri = '/' then
    uri := '/index.' + PrefferedExtension;

  path := dirpath;
  Buf := TStringList.Create;
  r := '';
  fullq := path + uri;

  try
    if Cache.Values[uri] <> '' then
      r := Cache.Values[uri]
    else if FileExists(fullq) then
    begin
      Buf.LoadFromFile(fullq);
      Cache.Values[uri] := Buf.Text;
      r := Buf.Text;
    end;
  finally
    Buf.Free;
  end;

  Result := r;
end;

procedure TOwnServerLauncher.StartOwnServer;
begin
  ListenerSocket := TTCPBlockSocket.Create;
  ConnectionSocket := TTCPBlockSocket.Create;

  try
    ListenerSocket.CreateSocket;
    ListenerSocket.setLinger(True, 10);
    ListenerSocket.bind(ipaddress, port);
    ListenerSocket.listen;

    repeat
      if ListenerSocket.canread(512) then
      begin
        ConnectionSocket.Socket := ListenerSocket.accept;
        AttendConnection(ConnectionSocket);
      end;
    until ListenerSocket.StopFlag or ConnectionSocket.StopFlag;
  finally
    ListenerSocket.CloseSocket;
    ConnectionSocket.CloseSocket;

    if Assigned(ListenerSocket) then
      ListenerSocket.Free;

    if Assigned(ConnectionSocket) then
      ConnectionSocket.Free;

    ListenerSocket := nil;
    ConnectionSocket := nil;
  end;
end;

procedure TOwnServerLauncher.ThreadDone(Sender: TObject);
begin
  StopOwnServer;

  if Assigned(ListenerSocket) then
    ListenerSocket.Free;

  if Assigned(ConnectionSocket) then
    ConnectionSocket.Free;
end;

procedure TOwnServerLauncher.Execute;
begin


  startOwnServer;

end;

constructor TOwnServerLauncher.Create(CreateSuspended: Boolean);
begin
    inherited Create(CreateSuspended);
    OnTerminate := @ThreadDone;
    initCache;
end;

destructor TOwnServerLauncher.Destroy;
begin
    Cache.Free;
  inherited Destroy;
end;


procedure TOwnServerLauncher.AttendConnection(ASocket: TTCPBlockSocket);
var
  timeout: integer;
  s, method, uri, protocol, OutputDataString, content_type: string;
  ResultCode: integer;
  test_flag: boolean;
  i: integer;
  valid_extensions: array[0..7] of string = ('.jpg', '.gif', '.png', '.htm',
    '.html', '.css', '.js', '/');
begin
  timeout := 120000;

  // Read request line
  s := ASocket.RecvString(timeout);
  method := fetch(s, ' ');
  uri := fetch(s, ' ');
  protocol := fetch(s, ' ');

  // Read request headers
  repeat
    s := ASocket.RecvString(Timeout);
  until s = '';

  // Determine content type
  content_type := 'text/html';
  if Pos('.css', uri) > 0 then content_type := 'text/css'
  else if Pos('.jpg', uri) > 0 then content_type := 'image/jpeg'
  else if Pos('.png', uri) > 0 then content_type := 'image/png'
  else if Pos('.gif', uri) > 0 then content_type := 'image/gif'
  else if Pos('.js', uri) > 0 then content_type := 'application/javascript';

  // Check if URI is valid
  test_flag := False;
  for i := Low(valid_extensions) to High(valid_extensions) do
    if Pos(valid_extensions[i], uri) > 0 then
    begin
      test_flag := True;
      Break;
    end;

  if test_flag then
  begin
    OutputDataString := OutputHTMLFile(uri) + CRLF;
    ASocket.SendString('HTTP/1.0 200' + CRLF);
    ASocket.SendString('Content-type: ' + content_type + CRLF);
    ASocket.SendString('Content-length: ' + IntToStr(Length(OutputDataString)) + CRLF);
    ASocket.SendString('Connection: close' + CRLF);
    ASocket.SendString('Date: ' + Rfc822DateTime(Now) + CRLF);
    ASocket.SendString('Server: HtmlBuilder' + CRLF);
    ASocket.SendString('' + CRLF);
    ASocket.SendString(OutputDataString);
  end
  else
    ASocket.SendString('HTTP/1.0 404' + CRLF);
end;

procedure TOwnServerLauncher.initCache;
begin
  Cache := TStringList.Create;
end;

procedure TOwnServerLauncher.StopOwnServer;
begin
ListenerSocket.AbortSocket;
 ConnectionSocket.AbortSocket;
end;

end.

