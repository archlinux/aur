program htmlbuilder;

{$mode objfpc}{$H+}
{$linklib Qt5Pas}
uses
  {$IFDEF UNIX}{$IFDEF UseCThreads}
  cthreads, // диспетчер памяти C в некоторых системах намного быстрее для многопоточности
  {$ENDIF}{$ENDIF}
  Interfaces, // this includes the LCL widgetset
  Forms, dbflaz, datetimectrls, main, db_helpers, db_insertdemo,
  db_create_tables, replacers, editor_in_window, editor_css, editor_js,
  css_props_dlg, const_for_app, types_for_app, selectorTagsPages,
  selectors_for_menu, RenderHtml, AsyncQueue, storing_attachments, FontSettings,
  selection_history_dialog, selection_history_manager, emoji_shortcodes;

{$R *.res}

begin
  RequireDerivedFormResource := True;
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.CreateForm(TfrmEditor, frmEditor);
  Application.CreateForm(TfrmEditorCss, frmEditorCss);
  Application.CreateForm(TfrmEditorJs, frmEditorJs);
  Application.CreateForm(TfrmCssProps, frmCssProps);
  Application.CreateForm(TfrmSelectionHistory, frmSelectionHistory);
  Application.Run;
end.

