{ Contains procedures for initialization new database }
unit db_create_tables;

{$mode ObjFPC}{$H+}

interface
uses

Classes, SysUtils, DB, BufDataset, Forms, Controls, Graphics, Dialogs,
 DBCtrls,   SQLite3Conn, SQLDB, process, StdCtrls, ExtCtrls, ComCtrls, Menus, DBGrids,
 db_helpers;

{ Create table section }
procedure  createSectionsSQL(var konnect : TSQLite3Connection; var tranzact : TSQLTransaction);
{ Create table menu }
procedure createMenusSQL(var konnect : TSQLite3Connection; var tranzact : TSQLTransaction);
{ Create table menu_item }
procedure createItemsForMenuSQL(var konnect : TSQLite3Connection; var tranzact : TSQLTransaction);
{ Create table block }
procedure  createBlocksSQL(var konnect : TSQLite3Connection; var tranzact : TSQLTransaction);
{ Create table preset }
procedure  createPresetsSQL(var konnect : TSQLite3Connection; var tranzact : TSQLTransaction);  // начальная настройка пресетов
{ Create table content }
procedure  createPagesSQL(var konnect : TSQLite3Connection; var tranzact : TSQLTransaction);
{ Create table css }
procedure createCssSQL(var konnect : TSQLite3Connection; var tranzact : TSQLTransaction);
{ Create table js }
procedure createJsSQL(var konnect : TSQLite3Connection; var tranzact : TSQLTransaction);
{ Create table tags }
procedure createTagsSQL(var konnect : TSQLite3Connection; var tranzact : TSQLTransaction);
{ Create table tags_pages }
procedure createTagsPagesSQL(var konnect : TSQLite3Connection; var tranzact : TSQLTransaction);

{ Create table images }
procedure createImagesSQL(var konnect : TSQLite3Connection; var tranzact : TSQLTransaction);

{ Create table attachments }
procedure createAttachmentsSQL(var konnect : TSQLite3Connection; var tranzact : TSQLTransaction);


implementation

procedure  createSectionsSQL(var konnect : TSQLite3Connection; var tranzact : TSQLTransaction);


begin
       checkConnect(konnect, tranzact, 'нет соединения <createSectionsSQL>!');

        // Здесь мы настраиваем таблицу с именем "section" в новой базе данных.
        sql_execute_direct(
                     'CREATE TABLE "section"('+
                    ' "id" Char(60) NOT NULL PRIMARY KEY,'+
                    ' "section" Char(60),'+
                    ' "tree" Char(250),'+
                    ' "preset" Char(60),'+
                    ' "note" TEXT, '+
                    ' "full_text" TEXT, '+
                    ' FOREIGN KEY(preset) REFERENCES preset(id) ON UPDATE CASCADE'+
                    ')', konnect, tranzact);

        // Создание индекса на основе идентификатора в таблице "section"

        sql_execute_direct(   'CREATE UNIQUE INDEX "section_id_idx" ON "section"( "id" );', konnect, tranzact);
        sql_execute_direct(   'CREATE INDEX "section_section_idx" ON "section"( "section" );', konnect, tranzact);
        sql_execute_direct(   'CREATE INDEX "section_preset_idx" ON "section"( "preset" );', konnect, tranzact);

        tranzact.Commit;

        //SilentMessage('начальная настройка секций, транзакция...');
 end;

procedure createMenusSQL(var konnect: TSQLite3Connection;
  var tranzact: TSQLTransaction);
begin
   checkConnect(konnect, tranzact,'нет соединения <createBlocksSQL>!');

        sql_execute_direct('CREATE TABLE "menu"('+
                    ' "menu_id" Char(60) NOT NULL PRIMARY KEY,'+
                    ' "menu_caption" Char(60),'+
                    ' "menu_wrap_tpl" TEXT,'+
                    ' "menu_item_tpl" TEXT)', konnect, tranzact);


       sql_execute_direct('CREATE UNIQUE INDEX "menu_id_idx" ON "menu"( "menu_id" );', konnect, tranzact);

        tranzact.Commit;
end;

procedure createItemsForMenuSQL(var konnect: TSQLite3Connection;
  var tranzact: TSQLTransaction);
begin
     checkConnect(konnect, tranzact,'нет соединения <createBlocksSQL>!');

        sql_execute_direct('CREATE TABLE "menu_item"('+
                    ' "menu_item_id" Char(60) NOT NULL PRIMARY KEY,'+
                    ' "menu_item_caption" Char(60),'+
                    ' "menu_item_type" Char(3),'+
                    ' "menu_item_link_for" Char(60),' +
                    ' "menu_item_menu_id" Char(60))', konnect, tranzact);


       sql_execute_direct('CREATE UNIQUE INDEX "menu_item_id_idx" ON "menu_item"( "menu_item_id" );', konnect, tranzact);

        tranzact.Commit;
end;

procedure  createBlocksSQL(var konnect : TSQLite3Connection; var tranzact : TSQLTransaction);
begin
  checkConnect(konnect, tranzact,'нет соединения <createBlocksSQL>!');
          // Здесь мы настраиваем таблицу с именем "block" в новой базе данных.
        sql_execute_direct('CREATE TABLE "block"('+
                    ' "id" Char(60) NOT NULL PRIMARY KEY,'+
                    ' "markup" TEXT,'+
                    ' "remark" TEXT)', konnect, tranzact);

        // Создание индекса на основе идентификатора в таблице "block"
       sql_execute_direct('CREATE UNIQUE INDEX "block_id_idx" ON "block"( "id" );', konnect, tranzact);

        tranzact.Commit;
        //SilentMessage('начальная настройка блоков, транзакция...');
end;

procedure  createPresetsSQL(var konnect : TSQLite3Connection; var tranzact : TSQLTransaction);  // начальная настройка пресетов
begin

        checkConnect(konnect, tranzact,'нет соединения <createPresetsSQL>!');

        // Здесь мы настраиваем таблицу с именем "presets" в новой базе данных.
       sql_execute_direct('CREATE TABLE "preset"('+
                    ' "id" Char(60) NOT NULL PRIMARY KEY,'+
                    ' "sitename" Char(60),'+  // Название сайта
                    ' "orf" Char(60),'+      // По какому полю сортировка
                    ' "ors" Char(4),'+      // Порядок сортировки
                    ' "dirpath" Char(60),'+      // Путь к папке в результатами
                    ' "headtpl" TEXT,'+         // Заголовочная часть шаблона
                    ' "bodytpl" TEXT,'+     // Основная часть шаблона
                    ' "sectiontpl" TEXT,'+  // Раздела обрамление
                    ' "itemtpl" TEXT,'+      // Оформление списка
                    ' "tags_tpl" TEXT,'+  // Оформление тега
                    ' "item_tag_tpl" TEXT,'+      // Оформление элемента в списке тегов

                    ' "ufn1" Char(60),'+     // Название доп. поля 1, 2...
                    ' "ufn2" Char(60),'+
                    ' "ufn3" Char(60),'+
                    ' "ufn4" Char(60),'+
                    ' "ufn5" Char(60),'+
                    ' "ufn6" Char(60),'+
                    ' "ufn7" Char(60),'+
                    ' "websiteUrl" Char(60))' , konnect, tranzact);

        // Создание индекса на основе идентификатора в таблице "block"
        sql_execute_direct('CREATE UNIQUE INDEX "preset_id_idx" ON "preset"( "id" );', konnect, tranzact);

        tranzact.Commit;
        //SilentMessage('начальная настройка пресетов, транзакция...');
end;

procedure  createPagesSQL(var konnect : TSQLite3Connection; var tranzact : TSQLTransaction);
begin
     sql_execute_direct( 'PRAGMA foreign_keys = ON;', konnect, tranzact);
       // Здесь мы настраиваем таблицу с именем "content" в новой базе данных.
     sql_execute_direct('CREATE TABLE "content"('+
                    ' "id" Char(128) NOT NULL PRIMARY KEY,'+
                    ' "caption" Char(128),'+
                    ' "content" TEXT,'+
                    ' "section" Chat(128),'+
                    ' "dt" DATETIME, '+
                    ' "uf1" Char(60),'+
                    ' "uf2" Char(60),'+
                    ' "uf3" Char(60),'+
                    ' "uf4" Char(60),'+
                    ' "uf5" Char(60),'+
                    ' "uf6" Char(60),'+
                    ' "uf7" Char(60),' +
                    ' CONSTRAINT fk_section FOREIGN KEY(section) REFERENCES section(id) ON DELETE CASCADE ON UPDATE CASCADE '+
                    ');', konnect, tranzact);

        // Создание индекса на основе идентификатора в таблице "DATA"
       sql_execute_direct('CREATE UNIQUE INDEX "content_id_idx" ON "content"( "id" );',konnect, tranzact);
       sql_execute_direct('CREATE INDEX "content_section_idx" ON "content"( "section" );',konnect, tranzact);


       // SilentMessage('начальная настройка страниц, транзакция...');



 end;

procedure createCssSQL(var konnect: TSQLite3Connection;
  var tranzact: TSQLTransaction);
begin
   sql_execute_direct( 'PRAGMA foreign_keys = ON;', konnect, tranzact);
       // Здесь мы настраиваем таблицу с именем "content" в новой базе данных.
     sql_execute_direct('CREATE TABLE "css"('+
                    ' "css_id" Char(128) NOT NULL PRIMARY KEY,'+
                    ' "css_path" Char(255),'+
                    ' "css_style" TEXT '+
                    ');', konnect, tranzact);

        // Создание индекса на основе идентификатора в таблице "DATA"
       sql_execute_direct('CREATE UNIQUE INDEX "css_id_idx" ON "css"( "css_id" );',konnect, tranzact);




end;

procedure createJsSQL(var konnect: TSQLite3Connection;
  var tranzact: TSQLTransaction);
begin
   sql_execute_direct( 'PRAGMA foreign_keys = ON;', konnect, tranzact);
       // Здесь мы настраиваем таблицу с именем "content" в новой базе данных.
     sql_execute_direct('CREATE TABLE "js"('+
                    ' "js_id" Char(128) NOT NULL PRIMARY KEY,'+
                    ' "js_path" Char(255),'+
                    ' "js_file" TEXT '+
                    ');', konnect, tranzact);

        // Создание индекса на основе идентификатора в таблице "DATA"
       sql_execute_direct('CREATE UNIQUE INDEX "js_id_idx" ON "js"( "js_id" );',konnect, tranzact);
end;

procedure createTagsSQL(var konnect: TSQLite3Connection;
  var tranzact: TSQLTransaction);
begin
   sql_execute_direct( 'PRAGMA foreign_keys = ON;', konnect, tranzact);
       // Здесь мы настраиваем таблицу с именем "tags" в новой базе данных.
     sql_execute_direct('CREATE TABLE "tags"('+
                    ' "tag_id" Char(128) NOT NULL PRIMARY KEY,'+
                    ' "tag_caption" Char(255)'+
                    ');', konnect, tranzact);

        // Создание индекса на основе идентификатора в таблице "DATA"
       sql_execute_direct('CREATE UNIQUE INDEX "tag_id_idx" ON "tags"( "tag_id" );',konnect, tranzact);
end;

procedure createTagsPagesSQL(var konnect: TSQLite3Connection;
  var tranzact: TSQLTransaction);
begin
  sql_execute_direct( 'PRAGMA foreign_keys = ON;', konnect, tranzact);
       // Здесь мы настраиваем таблицу с именем "tags" в новой базе данных.
     sql_execute_direct('CREATE TABLE "tags_pages"('+
                    ' "id_tag_page" Char(128) NOT NULL PRIMARY KEY,'+
                    ' "id_tag" Char(255),'+
                    ' "id_page" Char(255)'+
                    ');', konnect, tranzact);

        // Создание индекса на основе идентификатора в таблице "DATA"
       sql_execute_direct('CREATE UNIQUE INDEX "id_tag_page_idx" ON "tags_pages"( "id_tag_page" );',konnect, tranzact);
end;

procedure createImagesSQL(var konnect : TSQLite3Connection; var tranzact : TSQLTransaction);
begin
       try
              sql_execute_direct( 'PRAGMA foreign_keys = ON;', konnect, tranzact);
              sql_execute_direct('CREATE TABLE "images"('+
                ' "image_id" Char(128) NOT NULL PRIMARY KEY, '+
                ' "image_caption" Char(255), ' +
                ' "image_data" BLOB )', konnect, tranzact);

              sql_execute_direct('CREATE UNIQUE INDEX "id_image_idx" ON "images"( "image_id" );',konnect, tranzact);
        except on E: Exception do
               ShowMessage( 'Error: '+ E.ClassName + #13#10 + E.Message );
        end;
end;

procedure createAttachmentsSQL(var konnect: TSQLite3Connection;
  var tranzact: TSQLTransaction);
begin
     try
              sql_execute_direct( 'PRAGMA foreign_keys = ON;', konnect, tranzact);
              sql_execute_direct('CREATE TABLE "attachments"('+
                ' "attachment_id" Char(128) NOT NULL PRIMARY KEY, '+
                ' "attachment_caption" Char(255), ' +
                ' "attachment_data" BLOB )', konnect, tranzact);

              sql_execute_direct('CREATE UNIQUE INDEX "id_attachment_idx" ON "attachments"( "attachment_id" );',konnect, tranzact);
        except on E: Exception do
               ShowMessage( 'Error: '+ E.ClassName + #13#10 + E.Message );
        end;
end;

end.

