{ Rendering Function By Custom SQL}
unit render_custom_request;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, SQLite3Conn, SQLDB,  db_helpers, RenderHtml, regexpr;

(*

Usage:

output := renderCustomRequest(
  '@db(id,name,email|users|age>18)=>(<div>{name} - {email}</div>);',
  conn, trans, query
);

The function:

    Parses the request expression using regex to extract fields, table, condition, and template

    Builds and executes the SQL query

    For each record in the result set:

        Sets variables in the renderer based on field values

        Renders the template with these variables

        Appends the result to the output string

    Returns the concatenated rendered output

*)

function renderCustomRequest(requestExpression: String; var konnect: TSQLite3Connection;
  var tranzact: TSQLTransaction; var sQ: TSQLQuery): String;

{
This function:

    Uses regex to find all @db(...)=>(...); patterns in the input string

    For each match, calls renderCustomRequest to get the rendered HTML

    Replaces the original request with its rendered output

    Returns the fully processed string
}
function renderAllCustomRequests(t: String; var konnect: TSQLite3Connection;
  var tranzact: TSQLTransaction; var sQ: TSQLQuery): String;

implementation

function renderCustomRequest(requestExpression: String; var konnect: TSQLite3Connection;
  var tranzact: TSQLTransaction; var sQ: TSQLQuery): String;
var
  regex: TRegExpr;
  fieldsPart, tablePart, conditionPart, templatePart: String;
  fields: TStringList;
  sqlRequest: String;
  renderer: Render;
  i: Integer;
  output: String;

  item : String;
  fileWriter : TStringList;
begin
  fileWriter := TStringList.Create;
  output := '';

  // Initialize regular expression to parse the request
   regex := TRegExpr.Create;
    // Pattern to match @db(...)=>(...) format
    regex.Expression := '@db\(([^|]+)\|([^|]+)\|([^)]*)\)=>\((.*)\);?';

    if regex.Exec(requestExpression) then
    begin
      // Extract parts from the request expression
      fieldsPart := regex.Match[1];
      tablePart := regex.Match[2];
      conditionPart := regex.Match[3];
      templatePart := regex.Match[4];

      fileWriter.Add('fields detected: '+fieldsPart);
      fileWriter.Add('table detected:' + tablePart);
      fileWriter.Add('condition detected ' + conditionPart);
      fileWriter.Add('template part is '+templatePart);

        // Split fields into a list
        fields := TStringList.Create;
        fields.StrictDelimiter := True;
        fields.Delimiter := ',';
        fields.DelimitedText := fieldsPart;

        // Build SQL query
        sqlRequest := 'SELECT ' + fieldsPart + ' FROM ' + tablePart;
        if conditionPart <> '' then
          sqlRequest := sqlRequest + ' WHERE ' + conditionPart;

        fileWriter.add('Construct sql request is ' + sqlRequest);

        // Execute the query
        open_sql(sqlRequest, sQ);



          // Process each record
          sQ.First;
          while not sQ.EOF do
          begin
               // Create renderer
            renderer := Render.Create;
            renderer.setTemplate(templatePart);

            // Set variables for current record
            for i := 0 to fields.Count - 1 do
            begin
              fileWriter.Add(fields[i] + ' has value ' + sQ.FieldByName(fields[i]).AsString);
              renderer.setVar(fields[i], sQ.FieldByName(fields[i]).AsString);
            end;

            // Render and append to output
            item := renderer.getHtml();
            renderer.Free;

            fileWriter.Add('item render ' + item);
            output := output + item;

            sQ.Next;
          end;

  end;



  fields.Free;
  regex.Free;
  fileWriter.Add(output);
  fileWriter.SaveToFile('render_custom_request.log');
  fileWriter.Free;

  Result := output;
end;

function renderAllCustomRequests(t: String; var konnect: TSQLite3Connection;
  var tranzact: TSQLTransaction; var sQ: TSQLQuery): String;
var
  regex: TRegExpr;
  startPos, endPos: Integer;
  request, rendered: String;
  output: String;
begin
  output := t;
  regex := TRegExpr.Create;
  try
    // Pattern to match @db(...)=>(...);
    regex.Expression := '@db\([^)]+\)=>\([^)]+\)\;?';

    // Find and process all matches
    if regex.Exec(t) then
    begin
      repeat
        // Get the full matched request
        request := regex.Match[0];

        // Render this single request
        rendered := renderCustomRequest(request, konnect, tranzact, sQ);

        // Replace the original request with rendered output
        output := StringReplace(output, request, rendered, []);
      until not regex.ExecNext;
    end;
  finally
    regex.Free;
  end;

  Result := output;
end;

end.

