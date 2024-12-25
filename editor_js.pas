{ Contains editor for javascript }
unit editor_js;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls, ExtCtrls,
  SynEdit, SynHighlighterJScript, SynCompletion, Types, LCLType, FontSettings;

type

  { TfrmEditorJs }

  { Window with javascript editor }
  TfrmEditorJs = class(TForm)
    btnClose: TButton;
    btnAddFunction: TButton;
    lbScriptName: TLabel;
    editor: TSynEdit;
    panJs: TPanel;
    SynCompletion1: TSynCompletion;
    SynJScriptSyn1: TSynJScriptSyn;

    { Handles click of btnAddFunction }
    procedure btnAddFunctionClick(Sender: TObject);

    { Handles click of btnClose }
    procedure btnCloseClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);

    { Handles click of panJs }
    procedure panJsClick(Sender: TObject);

    { Handles autocompletions for javascript }
    procedure SynCompletion1CodeCompletion(var Value: string;
      SourceValue: string; var SourceStart, SourceEnd: TPoint;
      KeyChar: TUTF8Char; Shift: TShiftState);

  private

  public

    end;







var
  frmEditorJs: TfrmEditorJs;

implementation

{$R *.lfm}

{ TfrmEditorJs }

procedure TfrmEditorJs.btnCloseClick(Sender: TObject);
begin
    modalresult:=mrok;
    close;
end;

procedure TfrmEditorJs.FormCreate(Sender: TObject);
var
   FontManager: TFontManager;
begin
     FontManager := TFontManager.Create();
     editor.Font := FontManager.Font;
     FontManager.Free;
end;

procedure TfrmEditorJs.btnAddFunctionClick(Sender: TObject);
var funcName : String;
begin
  funcName := InputBox('Новая функция', 'имя функции', 'newF');
  editor.Lines.Add(' function '+funcName+'(){');
  editor.Lines.Add('}');
end;

procedure TfrmEditorJs.panJsClick(Sender: TObject);
begin

end;

procedure TfrmEditorJs.SynCompletion1CodeCompletion(var Value: string;
  SourceValue: string; var SourceStart, SourceEnd: TPoint; KeyChar: TUTF8Char;
  Shift: TShiftState);
begin

end;



end.

