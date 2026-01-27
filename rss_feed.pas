{ Generates RSS feed for site }
unit rss_feed;

{$mode ObjFPC}{$H+}

interface

uses
  SysUtils, Classes, SQLite3Conn, SQLDB, DateUtils, url_constr ;

function selectByMode(Mode : String; ValuePlain : String; ValueTree : String) : String;
procedure writeRssFeed(Mode : String; Domain : String; feedXMLFileName: String; var konnect: TSQLite3Connection; var tranzact: TSQLTransaction);
function clearCuttedToPlainFromHtml(S: String; N: Integer): String;

implementation


function clearCuttedToPlainFromHtml(S: String; N: Integer): String;
var
  PlainText: String;
  i: Integer;
begin
  // Step 1: Remove HTML tags using a simple regex-like approach
  PlainText := '';
  i := 1;
  while i <= Length(S) do
  begin
    if S[i] = '<' then
    begin
      // Skip everything until '>'
      while (i <= Length(S)) and (S[i] <> '>') do
        i := i + 1;
      i := i + 1; // Move past the closing '>'
    end
    else
    begin
      // Append non-tag characters to PlainText
      PlainText := PlainText + S[i];
      i := i + 1;
    end;
  end;

  // Step 2: Take only the first N characters
  if Length(PlainText) > N then
    PlainText := Copy(PlainText, 1, N);

  // Step 3: Return the result
  clearCuttedToPlainFromHtml := PlainText;
end;

function selectByMode(Mode: String; ValuePlain: String; ValueTree: String
  ): String;
begin
  if mode = 'plain' then result := ValuePlain else Result:=ValueTree;
end;

procedure writeRssFeed(Mode : String; Domain : String; feedXMLFileName: String; var konnect: TSQLite3Connection; var tranzact: TSQLTransaction);
var
  Query: TSQLQuery;
  XMLContent: TStringList;
  rssHeader, rssFooter, rssItemTemplate, rssItem: String;
  itemCount: Integer;
  Log : TStringList;
begin
  // Initialize variables
  Query := TSQLQuery.Create(nil);
  XMLContent := TStringList.Create;
  Log := TStringList.Create;
  try
    // Configure SQLQuery
    Query.Database := konnect;
    Query.Transaction := tranzact;
    Query.SQL.Text := 'SELECT id, caption, content, section, dt FROM content ORDER BY dt DESC LIMIT 20'; // Fetch latest 20 entries
    Query.Open;

    // Define RSS header and footer
    rssHeader :=
      '<?xml version="1.0" encoding="UTF-8"?>' +
      '<rss version="2.0">' +
      '<channel>' +
      '<title>Latest News</title>' +
      '<link>http://' + Domain + '</link>' +
      '<description>Latest news feed from the database</description>';

    rssFooter := '</channel></rss>';

    // Define RSS item template
    rssItemTemplate :=
      '<item>' +
      '<title>%s</title>' + // Caption
      '<link>http://' + Domain + '/%s</link>' + // Section
      '<description>%s</description>' + // Content
      '<pubDate>%s</pubDate>' + // Publication date
      '</item>';

    // Add RSS header to XML content
    XMLContent.Add(rssHeader);

    // Loop through query results and add RSS items
    itemCount := 0;
    while not Query.EOF do
    begin
      rssItem := Format(rssItemTemplate, [
        Query.FieldByName('caption').AsString,
         selectByMode( Mode,
                       Query.FieldByName('id').AsString + '.html',
                       getTreeUrl(  Query.FieldByName('id').AsString, '.html', konnect, tranzact)
         ),
      { #note : need URLs construction for page by id }
        clearCuttedToPlainFromHtml( Query.FieldByName('content').AsString, 50) ,
        FormatDateTime('ddd, dd mmm yyyy hh:nn:ss', Query.FieldByName('dt').AsDateTime)
      ]);
      XMLContent.Add(rssItem);
      Query.Next;
      Inc(itemCount);
    end;

    // Add RSS footer to XML content
    XMLContent.Add(rssFooter);

    // Write XML content to file
    XMLContent.SaveToFile(feedXMLFileName);
    Log.Add(Format('RSS feed created successfully with %d items.', [itemCount]));
    Log.Add('Filename: '+ feedXMLFileName);
    Log.SaveToFile('rss.log');



  finally
    // Free resources
    Log.Free;
    Query.Free;
    XMLContent.Free;
  end;
end;

end.

