{ Contains class TfrmCssProps for dialog with css properties }
unit css_props_dlg;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls;

type

  { TfrmCssProps }

  { Dialog for css properties }
  TfrmCssProps = class(TForm)
    btnClose: TButton;
    lbCssProps: TLabel;
    css_props: TListBox;
  private

  public

  end;

var
  frmCssProps: TfrmCssProps;

implementation

{$R *.lfm}

end.

