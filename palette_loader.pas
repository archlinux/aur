{ Load palette file made in ArtNazarov/colorpalette }
unit palette_loader;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, IniFiles, FileUtil, types_for_app;

procedure loadAllPalsFromDir(dir: String; var pal: sdict);

implementation

procedure loadAllPalsFromDir(dir: String; var pal: sdict);
var
  files: TStringList;
  ini: TIniFile;
  sections: TStringList;
  i, j: Integer;
  sectionName: String;
  colorAlias, colorValue: String;
begin
  // Find all .pal files recursively
  files := TStringList.Create;
  try
    FindAllFiles(files, dir, '*.pal', True); // True for recursive search

    for i := 0 to files.Count - 1 do
    begin
      ini := TIniFile.Create(files[i]);
      sections := TStringList.Create;
      try
        // Read all sections in the ini file
        ini.ReadSections(sections);

        for j := 0 to sections.Count - 1 do
        begin
          sectionName := sections[j];
          
          // Skip the 'Grid' section which contains metadata
          if sectionName = 'Grid' then
            Continue;

          // Read color alias (Col2) and color value (Col1)
          colorAlias := ini.ReadString(sectionName, 'Col2', '');
          colorValue := ini.ReadString(sectionName, 'Col1', '');

          // If we have both alias and value, add to dictionary
          if (colorAlias <> '') and (colorValue <> '') then
          begin
            // Add or overwrite existing key
            if pal.IndexOf(colorAlias) >= 0 then
              pal.KeyData[colorAlias] := colorValue
            else
              pal.Add(colorAlias, colorValue);
          end;
        end;
      finally
        sections.Free;
        ini.Free;
      end;
    end;
  finally
    files.Free;
  end;
end;

end.
