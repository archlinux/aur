unit FontSettings;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, IniFiles, Graphics;

const FONTS_INI: string = 'fonts.ini';



type

  { TFontManager }

  TFontManager = class(TObject)

        public

          Font : TFont;

          {return with actual or default values}
          constructor Create();
          { Destructor declaration }
          destructor Destroy; override;
          {sets default values}
          procedure initValues();
          {save to ini file}
          procedure SaveFontSettings();
          {load from init file}
          procedure LoadFontSettings();
          {change font}
          procedure useFont( SelectedFont : TFont);


        private

          FileName : string;


  end;





implementation


constructor TFontManager.Create();
begin
  inherited Create();
  Font := TFont.Create;
  initValues();
  LoadFontSettings();
end;

destructor TFontManager.Destroy;
begin
  Font.Free();
  inherited Destroy;
end;

procedure TFontManager.initValues();
begin
     FileName := FONTS_INI;
     if not FileExists(FileName) then
        begin
           Font.Name := 'monospace';
           Font.Size := 14;
           Font.Color := clBlack; // Default color can be adjusted
           Font.Style := []; // Regular style
           SaveFontSettings();
        end;
end;

procedure TFontManager.SaveFontSettings();
var
  Ini: TIniFile;
begin
  Ini := TIniFile.Create(FileName);
  try
    Ini.WriteString('FontSettings', 'Name', Font.Name);
    Ini.WriteInteger('FontSettings', 'Size', Font.Size);
    Ini.WriteInteger('FontSettings', 'Color', Font.Color);
     // Ini.WriteInteger('FontSettings', 'Style', Byte(Font.Style));
  finally
    Ini.Free;
  end;

end;

procedure TFontManager.LoadFontSettings;
var
  Ini: TIniFile;
begin
  Ini := TIniFile.Create(FileName);
  try
    Font.Name := Ini.ReadString('FontSettings', 'Name', Font.Name);
    Font.Size := Ini.ReadInteger('FontSettings', 'Size', Font.Size);
    Font.Color := Ini.ReadInteger('FontSettings', 'Color', Font.Color);
    // Font.Style := TFontStyles(Byte(Ini.ReadInteger('FontSettings', 'Style', Byte(Font.Style))));
  finally
    Ini.Free;
  end;

end;

procedure TFontManager.useFont(SelectedFont: TFont);
begin
  Font.Assign(selectedFont);
  SaveFontSettings();
end;




end.
