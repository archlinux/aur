unit selection_history_dialog;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics,
  Dialogs, StdCtrls, ActnList, types_for_app;

type

  { TfrmSelectionHistory }

  TfrmSelectionHistory = class(TForm)
    acOk: TAction;
    acCancel: TAction;
    alActions: TActionList;
    btnCancel: TButton;
    btnOK: TButton;
    lboSelectionHistory: TListBox;
    procedure acCancelExecute(Sender: TObject);
    procedure acOkExecute(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private

  public

    selected_record : PBufferHistoryRecord;  // additional info
     InsertedText : String; // result - chosen fragment

  end;

var
  frmSelectionHistory: TfrmSelectionHistory;

implementation

{$R *.lfm}

{ TfrmSelectionHistory }

procedure TfrmSelectionHistory.acOkExecute(Sender: TObject);
begin
   // get additional info
   selected_record := PBufferHistoryRecord(  lboSelectionHistory.Items.Objects[  lboSelectionHistory.ItemIndex ] );
   // use dereference
   InsertedText := selected_record^.value ; { IntToStr(lboSelectionHistory.ItemIndex); }
   // set modal result
   ModalResult := mrOk;
end;

procedure TfrmSelectionHistory.FormCreate(Sender: TObject);
begin
  InsertedText := ''; // no insertion fragment by default
end;

procedure TfrmSelectionHistory.acCancelExecute(Sender: TObject);
begin
  InsertedText := '';
  ModalResult := mrCancel; // if cancel
end;

end.

