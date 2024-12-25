{ Contains constants for application }
unit const_for_app;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils;

const


   num_tables : byte = 5;
   { need for debug purposes. in production should be True}
   SilentMode : boolean = True;
   { need for debug purposes. in production should be False}
   logger_info : boolean = False;
   { default name of sqlite database}
   sqlite_filename : String = 'sqlite.db';
   { message if database created successfully }
   msgBaseSuccess : String = 'База данных успешно создана.';
   { message if database cant be created }
   msgErrorCreating : String = 'Невозможно создать новую базу данных';
   { message if cant check existing database }
   msgCantCheckDbFile : String = 'Невозможно проверить, существует ли файл базы данных';
   { delimeter of file paths}
    DELIM : Char = '/';
   { Tag starts and ends with DLM_MODULE for module processing }
    DLM_MODULE = '%';
   { Tag starts and ends with DLM_OWN_TAG for own tags processing }
    DLM_OWN_TAG = '~';

implementation

end.

