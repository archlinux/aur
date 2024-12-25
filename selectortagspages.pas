{ SQL requests for gettings tags }
unit selectorTagsPages;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, DB, BufDataset, Forms, Controls, Graphics, Dialogs,
  DBCtrls,   SQLite3Conn, SQLDB, process, StdCtrls, ExtCtrls, ComCtrls, Menus, DBGrids,
  db_helpers, types_for_app, replacers;

{ Gets to TagsMaps tm tags for page with id id_page }
procedure loadTagsForPages(id_page : String; var tm : TagsMap; var sq : TSqlQuery;
  var tranzact : TSqlTransaction);

{ Return tags links for html page }
function tagsInPageHtml(var tags : TagsMap; ext : String) : String;

{ Load all tags for site sitemap }
procedure loadAllTagsForSitemap(var tm : TagsMap; var sq : TSqlQuery;
  var tranzact : TSqlTransaction);

{ Returns all tag links for html page }
function tagsInSitemap(var tags : TagsMap) : String;


{ Gets to PagesMap pages with given tag id_tag }
procedure loadPagesByTag(id_tag : String; var pm : PagesMap; var sq : TSqlQuery;
  var tranzact : TSqlTransaction);


{ Returns HTML markup for PagesMap pm }
function pagesWithTag(var pm : PagesMap; item_tag_tpl : String; ext : String; useT : boolean) : String;

implementation

procedure loadTagsForPages(id_page : String; var tm: TagsMap; var sq : TSqlQuery;
  var tranzact : TSqlTransaction);
var

  r : Tag;
  tag_id: String;
  tag_caption : String;

begin
   sq.SQL.Clear;
  sq.SQL.LoadFromFile('sql_tags_for_page.txt');

  prepared_transaction_start(sq.SQL.Text, sq, tranzact);
  sq.Params.ParamByName('ID_PAGE').AsString := id_page;
  prepared_transaction_end( sq, tranzact);
  sq.Active:=True;


  tm.Clear;
  while Not sq.Eof do
    begin
      tag_id := sq.FieldByName('tag_id').AsString;
      tag_caption := sq.FieldByName('tag_caption').AsString;
      r.tag_id:= tag_id;
      r.tag_caption:=tag_caption;
      tm.Add(tag_id, r);
      sq.Next;
    end;
  sq.First;



end;

function tagsInPageHtml(var tags: TagsMap; ext : String): String;
var i : Integer; t : Tag; r : String;
begin
   r := '';
  for i:=0 to Tags.count-1 do
     begin
       t:=Tags.Data[i];
       r:=r+'&nbsp;<a href="/tags/'+t.tag_id+'.'+ext+'">'+t.tag_caption+'</a>';
     end;
  result:=r;
end;

procedure loadAllTagsForSitemap(var tm: TagsMap; var sq: TSqlQuery;
  var tranzact: TSqlTransaction);
var

  r : Tag;
  tag_id: String;
  tag_caption : String;

begin
  sq.SQL.Clear;
  sq.SQL.LoadFromFile('sql_tags_for_all.txt');
  open_sql(sq.SQL.Text, sq);
  sq.Active:=True;


  tm.Clear;
  while Not sq.Eof do
    begin
      tag_id := sq.FieldByName('tag_id').AsString;
      tag_caption := sq.FieldByName('tag_caption').AsString;
      r.tag_id:= tag_id;
      r.tag_caption:=tag_caption;
      tm.Add(tag_id, r);
      sq.Next;
    end;
  sq.First;

end;

function tagsInSitemap(var tags: TagsMap): String;
var i : Integer; t : Tag; r : String;
begin
   r := '';
  for i:=0 to Tags.count-1 do
     begin
       t:=Tags.Data[i];
       r:=r+'<br/><a href="/tags/'+t.tag_id+'.html">'+t.tag_caption+'</a>';
     end;
  result:=r;
end;

procedure loadPagesByTag(id_tag : String; var pm: PagesMap; var sq: TSqlQuery;
  var tranzact: TSqlTransaction);
var

  p : page_params;

begin
  sq.SQL.Clear;
  sq.SQL.LoadFromFile('sql_pages_by_tag.txt');


  prepared_transaction_start(sq.SQL.Text, sq, tranzact);
  sq.Params.ParamByName('ID_TAG').AsString := id_tag;
  prepared_transaction_end( sq, tranzact);
  sq.Active:=True;

      // ShowMessage(sq.SQL.Text);


  pm.Clear;
  while Not sq.Eof do
    begin
      p.id := sq.FieldByName('id').AsString;
      p.title:=sq.FieldByName('caption').AsString;
      p.tree:=sq.FieldByName('tree').AsString;
      pm.Add(p.id, p);
      sq.Next;
    end;
  sq.First;

end;

function pagesWithTag(var pm: PagesMap; item_tag_tpl : String; ext : String; useT : boolean): String;
var i : Integer; page : page_params; elem, r : String; url : String;
begin
   r := '';
  for i:=0 to pm.count-1 do
     begin
       page:=pm.Data[i];
       url:='/'+page.id;
       if useT then url:=page.tree+'/'+page.id;
       if url[1]<>'/' then url:='/'+url;
       elem:=applyVar(item_tag_tpl, 'itemUrl', url );
       elem:=applyVar(elem, 'itemTitle', page.title);
       elem:=applyVar(elem, 'ext', ext);
       r:=r+elem;
     end;
  result:=r;
end;

end.

