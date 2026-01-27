{ Кеш для строковых функций}
unit StringCache;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, fgl;

type
  TStringCache = class
  private
    memoizedCache: specialize TFPGMap<String, String>;
  public
    constructor Create;
    destructor Destroy; override;
    
    function isKeyExists(const key: String): Boolean;
    function getValueByKey(const key: String): String;
    procedure storeKeyValue(const key: String; const value: String);
    procedure clearPairs;
    function Count: Integer;  // Added method to get cache size
  end;

implementation

constructor TStringCache.Create;
begin
  inherited Create;
  memoizedCache := specialize TFPGMap<String, String>.Create;
  memoizedCache.Sorted := True;  // Enable binary search for better performance
end;

destructor TStringCache.Destroy;
begin
  memoizedCache.Free;
  inherited Destroy;
end;

function TStringCache.isKeyExists(const key: String): Boolean;
begin
  Result := memoizedCache.IndexOf(key) >= 0;
end;

function TStringCache.getValueByKey(const key: String): String;
var
  index: Integer;
begin
  index := memoizedCache.IndexOf(key);
  if index >= 0 then
    Result := memoizedCache.Data[index]
  else
    Result := '';
end;

procedure TStringCache.storeKeyValue(const key: String; const value: String);
var
  index: Integer;
begin
  index := memoizedCache.IndexOf(key);
  if index >= 0 then
    memoizedCache.Data[index] := value
  else
    memoizedCache.Add(key, value);
end;

procedure TStringCache.clearPairs;
begin
  memoizedCache.Clear;
end;

function TStringCache.Count: Integer;
begin
  Result := memoizedCache.Count;
end;

end.
