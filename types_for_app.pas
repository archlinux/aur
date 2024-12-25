{ Some types for storing data}
unit types_for_app;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, DB, BufDataset, Forms, Controls, Graphics, Dialogs,
  DBCtrls, dbf, SQLite3Conn, SQLDB, process, FileUtil, SynHighlighterHTML,
  SynEdit, DBDateTimePicker, StdCtrls, ExtCtrls, ComCtrls, Menus, DBGrids,
  ActnList, Buttons, blcksock, sockets, Synautil, synaip, synsock, ftpsend,
  db_helpers,   db_create_tables, replacers, editor_in_window,
  editor_css, editor_js, DateUtils, fgl, regexpr; {Use Synaptic}

type

  { Special setting of whole application }
  TSpecial_Settings = record
            useTree : boolean;
            ext     : String[255];
            zipCommandLine : String[255];
            Locale  : integer;
            numOfRecords : integer;
            fileManager : String[255];
            pathToBuild : String[255];
            pathToGhPages : String[255];
            LocalWysiwygExpress : String[255];
            ArchiveName : String[255];
            UseModule : boolean;
            UseGlobalsFromFiles : boolean;
            ftpIp : String[32];
            ftpUserName : String[255];
            ftpPassword : String[255];
            ftpPort : String[6];
            webLocalServerIp : String[32];
            webLocalServerPort : String[6];
  end;

  { Properties of section }
  TSection_Record = record
            id, section, preset, note, full_text, tree : String
  end;

  { Properties of menus }
  Menu = record
       menu_id : String;
       menu_caption : String;
       menu_wrap_tpl : String;
       menu_item_tpl : String;
  end;

  { Properties of menu item }
  MenuItem = record
       menu_item_id : String;
       menu_item_caption : String;
       menu_item_type : String;
       menu_item_link_for : String;
       menu_item_menu_id  : String; // внешний ключ
  end;

   { Properties of preset }
  PresetRecord = record

  id, sitename, dirpath, headtpl, bodytpl, sectiontpl, itemtpl, orf, ors,
  tags_tpl, item_tag_tpl : String;
  end;

 { Properties of tag }
  Tag = record
            tag_id : String;
            tag_caption : String;
  end;

  { Properties of tag link }
 Tag_Page_Link = record
            id_tag_page : String;
            id_tag : String;
            id_page : String;
            tree    : String;
  end;

  { Hashmap dictationary for pairing String to String }
  sdict = specialize TFPGmap<string, string>;{define type under type}
  { Hashmap dictationary for pairing String to Tag_Page_Link }
  TagsPagesMap = specialize TFPGmap<string, Tag_Page_Link>;
  { Hashmap dictationary for pairing String to Tag }
  TagsMap = specialize TFPGmap<string, Tag>;

  { List for sql queries}
  sqls_list = array[byte] of TSQLquery;

  { User Record properties}
  user_records = array[0..7] of record
              name : string;
              value : string;
            end;

  { Rubrication properties}
  rubric_pages = record
            pages_total   : array[0..255] of byte; // число страниц
            section_index : array[0..255] of byte;
            sectionhtml : array[0..255] of String;
            number_of_page : array[0..255] of byte;
            rubric_counter : byte;


  end;

  { Page pair for content_id and caption}
  page_pairs = record
            content_id : string;
            caption    : string;
  end;

  { Parameters of section }
  section_params = record
            id : string;
            section : string;
            note    : string;
            full_text : string;
            content_id : string;
            caption : string;
            sectiontpl :  string;
            headtpl : string;
            itemtpl : string;
            dirpath : string;
            tree    : string;
            pages   : array[0..255] of page_pairs;
            pages_counter : byte; // счетчик страниц

  end;

  { List of section properties }
  section_list = record
            sections : array[0..255] of section_params;
            section_counter : byte; // счетчик разделов
  end;

  { Parameters of page }
  page_params = record
            id        : String;
            title     : String;
            body      : String;
            dt        : TDateTime;
            section_id : String;
            section_title : String;
            sitename : String;
            dirpath : String;
            headtpl : String;
            bodytpl : String;
            sectiontpl : String;
            tree       : String;
            dir : String;
            user_field_names : array[0..7] of String;
            user_field_values  : array[0..7] of String;
            tags : String;
  end;

  {HashMap String to Page_Params}
  PagesMap = specialize TFPGmap<string, page_params>;

  { TImageRecord for representation image }
  TImageRecord = record
            image_id : String;
            image_caption : String;
            image_data : String; // hex format

  end;


  { TAttachmentRecord for representation any document }
  TAttachmentRecord = record
            attachment_id : String;
            attachment_caption : String;
            attachment_data : String; // hex format

  end;

  { TBufferHistoryRecord for representation info from SelectionHistory}
   TBufferHistoryRecord = class(TObject)
             key_buf : String;
             value    : String;
   end;
   PBufferHistoryRecord = ^TBufferHistoryRecord;

   { TEmojiShortCode for representation pair emoji and it shortcode }
   TEmojiShortCode = record
             shortcode : String;
             utf8symbol : String;
   end;

   { TEmojiShortCodesArray for representation dynamic array of shortcodes }
   TEmojiShortCodesArray = Array Of TEmojiShortCode;

   { String function }
   TFuncStr = function(s: String): String of object;




   {Array of string functions}
   TFuncStrArray = Array of TFuncStr;




implementation

end.

