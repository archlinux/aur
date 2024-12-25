unit selection_history_manager;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, DBCtrls, Controls, selection_history_dialog, types_for_app,
   md5, db;

type

  {Менеджер буфера обмена}

  { TSelectionHistoryManager }

  TSelectionHistoryManager = class
    {Буфер обмена}
    SelectionHistory : sdict;
    {Конструктор}
    constructor Create();
    {Деструктор}
    destructor Destroy();
    {Вырезает выделение}
    procedure Cut(var t : TControl);
    {Вставляет выделение}
    procedure Paste(var t : TControl);

  end;

implementation

{ TSelectionManager }

constructor TSelectionHistoryManager.Create();
begin
  SelectionHistory := sdict.Create()
end;

destructor TSelectionHistoryManager.Destroy();
begin
  SelectionHistory.Free();
end;

procedure TSelectionHistoryManager.Cut(var t: TControl);
var keyBuf : String;
begin
   // Set editing state in control
   if (t as tdbMemo).DataSource.State <> dsEdit then
        (t as tdbMemo).DataSource.Edit;


         // Get the selected text from the TDBMemo
        if Length((t as TDbMemo).SelText) > 0 then
        begin
          // Add the selected text to the TStringList
          keyBuf:=MD5Print(MD5String((t as TDbMemo).SelText));  // compute key as md5
          SelectionHistory.AddOrSetData(keyBuf, (t as TDbMemo).SelText); // upsert selected
          // Cutting
          (t as TDbMemo).SelText := '';
        end;
end;

procedure TSelectionHistoryManager.Paste(var t: TControl);
var
    dialog : TfrmSelectionHistory; // dialog from selection_history_dialog
    key : String; // key for selection history map
    cnt : Integer;  // count of items in history
    index : Integer;  // current index for traverse Keys array
    rec : TBufferHistoryRecord; // store key and value
    prec : PBufferHistoryRecord; // pointer to object
    Line, CharIndex : Integer;  // current line and char in tdbmemo
begin
     // set editing mode
     if (t as tdbMemo).DataSource.State <> dsEdit then
        (t as tdbMemo).DataSource.Edit;
     dialog := TfrmSelectionHistory.Create(nil); // creates dialog

     cnt := SelectionHistory.Count; // get count of items
     for index:=0 to cnt - 1 do begin
       key := SelectionHistory.Keys[index]; // get key
       rec := TBufferHistoryRecord.Create(); // create object for storing info
       rec.key_buf:=key; // save key
       rec.value:= SelectionHistory.KeyData[key]; // save value
       prec := @rec; // give address of object
       dialog.lboSelectionHistory.AddItem(rec.value, TObject(prec)); // add item
     end;
     dialog.ShowModal; // show dialog
     if dialog.ModalResult = mrOK then
      begin


  // Get the line number from the caret position (0-based)
  Line := (t as TDBMemo).CaretPos.Y;

  // Get the character index of the start of the line
  CharIndex := (t as TDBMemo).CaretPos.X;

  // Insert text
            (t as TDBMemo).Lines[Line] :=
      Copy((t as TDBMemo).Lines[Line], 1, CharIndex) +
      dialog.InsertedText +
      Copy((t as TDBMemo).Lines[Line], CharIndex + 1,
      Length((t as TDBMemo).Lines[Line]) - CharIndex);
    { #todo : Add moving caret }
      end;
     dialog.Free;
end;

end.

