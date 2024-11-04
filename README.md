# Musoq: SQL-like Queries for Various Data Sources

[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)
[![Maintenance](https://img.shields.io/badge/Maintained%3F-yes-green.svg)](https://github.com/Puchaczov/Musoq/graphs/code-frequency)
[![Nuget](https://img.shields.io/badge/Nuget%3F-yes-green.svg)](https://www.nuget.org/packages?q=musoq)
![Tests](https://raw.githubusercontent.com/puchaczov/musoq/master/badges/tests-badge.svg)

Musoq lets you use SQL-like queries on files, directories, images and other data sources without a database. It's designed to simplify data analysis for developers and IT professionals.

## 🌟 Key Features

- Query files and directories using familiar SQL-like syntax
- Analyze data in place, without importing into a database
- Extend functionality with plugins for various data sources
- Run on Windows, Linux, and Docker (MacOS support planned)
- Create custom data source plugins to fit your needs

Musoq aims to make data exploration easier, whether you're analyzing log files, searching through directories, or extracting information from CSVs. It's a tool built to save time and reduce complexity in everyday data tasks.

## 🎯 What Musoq Is (and Isn't)

Musoq is designed to simplify data querying across various sources using SQL-like syntax. To help you decide if Musoq is right for your needs, here's what you should know:

### 🚀 Musoq Shines At:
- Quick, ad-hoc querying of diverse data sources (files, CSVs, archives, etc.)
- Providing SQL-like syntax for non-database data
- Simplifying complex queries with innovative syntax features
- Handling small to medium-sized datasets efficiently

### 🤔 Consider Alternatives If You Need:
- Full SQL standard compliance (we prioritize user-friendly syntax over strict standards)
- High-performance processing of large datasets
- A mature, unchanging API

### 🤝 Community:
- Your feedback and contributions are welcome to shape the project's future

If Musoq aligns with your needs, I'm excited to have you on board! If not, I appreciate your interest and welcome any suggestions for improvement.

## 🚀 Quick Start

To try out Musoq, follow the instructions in our [CLI repository](https://github.com/Puchaczov/Musoq.CLI).

## 💡 Where To Use It

Musoq might be using in various places, including:

### 🧮 Solution analysis

```sql
-- Extract all SQL queries from tests from loaded solution
select 
    p.RowNumber() as RowNumber, 
    p.Name, 
    c.Name, 
    m.Name, 
    g.ToBase64(g.GetBytes(g.LlmPerform('You are C# developer. Your task is to extract SQL query without any markdown characters. If no sql, then return empty string', m.Body))) as QueryBase64
from #csharp.solution('/some/path/Musoq.sln') s 
inner join #openai.gpt('gpt-4o') g on 1 = 1 
cross apply s.Projects p 
cross apply p.Documents d 
cross apply d.Classes c 
cross apply c.Attributes a 
cross apply c.Methods m 
where a.Name = 'TestClassAttribute'

-- How many lines of code does the project contains?
select 
    Sum(c.LinesOfCode) as TotalLinesOfCode,
    Sum(c.MethodsCount) as TotalMethodsCount
from #csharp.solution('/some/path/Musoq.sln') s 
cross apply s.Projects p 
cross apply p.Documents d 
cross apply d.Classes c 
group by 'fake'

-- Top 3 methods with highest complexity
select
    c.Name as ClassName,
    m.Name as MethodName,
    Max(m.CyclomaticComplexity) as HighestComplexity
from #csharp.solution('/some/path/Musoq.sln') s
cross apply s.Projects p 
cross apply p.Documents d 
cross apply d.Classes c 
cross apply c.Methods m 
group by c.Name, m.Name
order by Max(m.CyclomaticComplexity) desc
take 3
```

### 📂 File System Analysis

```sql
-- Look for files greater than 1 gig
SELECT 
	FullName 
FROM #os.files('/some/path', true) 
WHERE ToDecimal(Length) / 1024 / 1024 / 1024 > 1

-- Look for how many space does the extensions occupies within some directory
SELECT
    Extension,
    Round(Sum(Length) / 1024 / 1024 / 1024, 1) as SpaceOccupiedInGB,
    Count(Extension) as HowManyFiles
FROM #os.files('/some/directory', true)
GROUP BY Extension
HAVING Round(Sum(Length) / 1024 / 1024 / 1024, 1) > 0

-- Query your images folder, filter to include only .jpg files and show it's EXIF metadata
SELECT
    f.Name,
    m.DirectoryName,
    m.TagName,
    m.Description
FROM #os.files('./Images', false) f CROSS APPLY #os.metadata(f.FullName) m
WHERE f.Extension = '.jpg'

-- Get first, last 5 bits from files and consecutive 10 bytes of file with offset of 5 from tail
SELECT
	ToHex(Head(5), '|'),
	ToHex(Tail(5), '|'),
	ToHex(GetFileBytes(10, 5), '|')
FROM #os.files('/some/directory', false)

-- Diff between two folders
SELECT 
    (CASE WHEN SourceFile IS NOT NULL 
     THEN SourceFileRelative 
     ELSE DestinationFileRelative 
     END) AS FullName, 
    (CASE WHEN State = 'TheSame' 
     THEN 'The Same' 
     ELSE State 
     END) AS Status 
FROM #os.dirscompare('E:\DiffDirsTests\A', 'E:\DiffDirsTests\B')

-- Compute Sha on files
SELECT
   FullName,
   f.Sha256File()
FROM #os.files('@qfs/', false) f
```

### 📦 Archive Exploration

```sql
-- Query .csv files from archive file
table PeopleDetails {
	Name 'System.String',
	Surname 'System.String',
	Age 'System.Int32'
};
couple #separatedvalues.comma with table PeopleDetails as SourceOfPeopleDetails;
with Files as (
	select 
		a.Key as InZipPath
	from #archives.file('./Files/Example2/archive.zip') a
	where 
		a.IsDirectory = false and
		a.Contains(a.Key, '/') = false and 
		a.Key like '%.csv'
)
select 
	f.InZipPath, 
	b.Name, 
	b.Surname, 
	b.Age 
from #archives.file('./Files/Example2/archive.zip') a
inner join Files f on f.InZipPath = a.Key
cross apply SourceOfPeopleDetails(a.GetStreamContent(), true, 0) as b;
```

### 🖼️ Image Analysis with AI

```sql
-- Describe images using AI
SELECT
    llava.DescribeImage(photo.Base64File()),
    photo.FullName
FROM #os.files('/path/to/directory', false) photo 
INNER JOIN #ollama.models('llava:13b', 0.0) llava ON 1 = 1

-- Count tokens in Markdown and C files
SELECT 
   SUM(gpt.CountTokens(f.GetFileContent())) AS TokensCount 
FROM #os.files('/path/to/directory', true) f 
INNER JOIN #openai.gpt('gpt-4') gpt ON 1 = 1 
WHERE f.Extension IN ('.md', '.c')

-- Extract data from recipe image
select s.Shop, s.ProductName, s.Price from #stdin.image('OpenAi', 'gpt-4o') s

-- Compute sentiment on a comments
SELECT 
    csv.PostId,
    csv.Comment,
    gpt.Sentiment(csv.Comment) as Sentiment,
    csv.Date
FROM #separatedvalues.csv('/home/somebody/comments_sample.csv', true, 0) csv
INNER JOIN #openai.gpt('gpt-4-1106-preview') gpt on 1 = 1
```

🔍 SQL-Powered Data Extraction

```sql
-- Extract imports from proto file:
-- import "some/some_message_1"
-- ant turn them into:
-- some/SomeMessage1
with Events as (
    select
        Replace(
            Replace(
                Line,
                'import "',
                ''
            ),
            '.proto";',
            ''
        ) as Namespace
    from #flat.file('/path/to/file.proto') f
    where
        Length(Line) > 6 and
        Head(Line, 6) = 'import' and
        IndexOf(Line, 'some') <> -1
)
select
    Choose(
        0,
        Split(e.Namespace, '/')
    ) +
    '/' +
    Replace(
        ToTitleCase(
            Choose(
                1,
                Split(e.Namespace, '/')
            )
        ),
        '_',
        ''
    ) as Events
from Events e

-- Count word frequencies within text
with p as (
    select 
        Replace(Replace(ToLowerInvariant(w.Value), '.', ''), ',', '') as Word
    from #flat.file('/some/path/to/text/file.txt') f cross apply f.Split(f.Line, ' ') w
)
select
    Count(p.Word, 1) as AllWordsCount, 
    Count(p.Word) as SpecificWordCount,
    Round(ToDecimal((Count(p.Word) * 100)) / Count(p.Word, 1), 2) as WordFrequencies,
    Word
from p group by p.Word having Count(p.Word) > 1
```

### 🤖 AI-Assisted Text Structuring

```sql
-- Extract structured data from unstructured text
select s.Who, s.Age from #stdin.text('Ollama', 'llama3.1') s where ToInt32(s.Age) > 26 and ToInt32(s.Age) < 75
```

### 🔄 Universal Table Querying

```sql
-- Count occurrences of each name in a table with headers
select t.Name, Count(t.Name) from #stdin.table(true) t group by t.Name having Count(t.Name) > 1
```

### 🔧 CAN DBC File Analysis

```sql
select 
    m.Id, 
    m.Name, 
    m.DLC, 
    m.Transmitter, 
    m.Comment as MessageComment, 
    m.CycleTime,
    s.Name, 
    s.StartBit, 
    s.Length, 
    s.ByteOrder, 
    s.InitialValue, 
    s.Factor, 
    s.IsInteger, 
    s.Offset, 
    s.Minimum, 
    s.Maximum, 
    s.Unit,
    s.Comment as SignalsComment
from #can.messages('@qfs/Model3CAN.dbc') m cross apply m.Signals s
```

## 🎬 Watch It Live

![Musoq Demo](https://github.com/Puchaczov/Musoq/blob/59603028e8fbe90ce8444077cf3561ff8e698afd/musoq.gif)

## 🔧 Syntax Features

Musoq supports a rich set of SQL-like features:

- Parameterizable sources
- Optional query reordering (FROM ... WHERE ... GROUP BY ... HAVING ... SELECT ... SKIP N TAKE N2)
- Use of `*` to select all columns
- GROUP BY and HAVING operators
- SKIP & TAKE operators
- Set operators (UNION, UNION ALL, EXCEPT, INTERSECT)
- LIKE / NOT LIKE operator
- RLIKE / NOT RLIKE operator (regex)
- CONTAINS operator
- CTE expressions
- IN operator
- INNER, LEFT OUTER, RIGHT OUTER JOIN operator
- ORDER BY operator
- CROSS / OUTER APPLY operator

## 🛠 Supported Data Sources

- Airtable (allows to query tables from Airtable)
- Archives (allows to treat archives as tables)
- CANBus (allows to treat CAN .dbc files and corresponding .csv files that contains records of a CAN bus as tables)
- Docker (allows to treat docker containers, images, etc as tables)
- FlatFile (allows to treat flat files as table)
- Json (allows to treat json files as tables)
- Kubernetes (allows to treat kubernetes pods, services, etc as tables) - experimental
- OpenAI (exists mainly to be combined with other plugins to allow fuzzy search by GPT models)
- Postgres (allows to treat postgres database as tables) - experimental
- SeparatedValues (allows to treat separated values files as tables)
- Sqlite (allows to treat sqlite database as tables) - experimental
- System (mostly utils, ranges and dual table resides here) -
- Time (allows to treat time as table)

## 🧭 Roadmap

The order is accidental. I will work on things that are the most urgent from the perspective of my current or near future work I will be using it with.

- Comprehensive documentation
- Roslyn data source
- Improve runtime efficiency
- Parallelize query execution
- Recursive CTE
- Rework JSON & XML support
- Subqueries
- More tests & better handling of syntax / runtime exceptions

If you think something might be important for the project to broaden its capabilities, feel free to submit a feature request.

## 🌱 Project Maturity

Musoq is an evolving project designed primarily for querying and analyzing smaller datasets, with a focus on user-friendly and efficient operations. Here's an overview of its current state:

- **Primary Use Case:** Musoq serves as a tool for ad-hoc querying data and manipulation tasks. It intentionally support only reads. It excels at handling smaller datasets where its SQL-like syntax can provide more intuitive and efficient data operations.

- **Innovative SQL Syntax:** I introduce new SQL syntax variants to simplify some complex queries and reduce the effort required for specific operations. This approach prioritizes user efficiency and ease of use, even if it means deviating from standard SQL in some cases.

- **Development Stage:** Musoq is in active development, continuously improving its core functionality and expanding its syntax to better serve its primary use case. This includes introduction of new syntax features sometimes.

- **Dataset Size:** At the current stage, Musoq is best suited for smaller to medium-sized datasets. For very large datasets or big data scenarios, traditional big data tools will be more appropriate.

- **Real-World Usage:** As the project creator, I use Musoq in various workplaces to facilitate my daily tasks and improve my workflow efficiency. It has proven to be a valuable tool in real-world scenarios, helping me perform data operations more effectively across different professional environments.

- **API and Syntax Stability:** The core functionality is stable. These changes are always aimed at improving usability and efficiency. While I strive for backwards compatibility, new syntax features may be introduced regularly.

- **Project Suitability:** Musoq is well-suited for projects that involve data analysis, file system operations, and other tasks typically handled by scripting languages. It's designed to be a reliable and efficient tool for these scenarios, especially where its unique syntax features can simplify complex operations.

I'm commited to improving Musoq within its intended scope, with a particular focus on innovative SQL syntax that makes data querying tasks easier. I welcome feedback, bug reports, and contributions from the community, especially those that align with the goal of simplifying complex data operations through clever syntax innovations.

## 🏗 Architecture

### High-level Overview
![Architecture Overview](https://github.com/Puchaczov/Musoq/blob/master/Musoq-Architecture-Engine.png)

### Plugins
Musoq offers a plugin API that all sources use. To learn how to implement your own plugin, you should examine how existing plugins are created.

## 💡 Motivation

I hate loops. Developed out of a need for a versatile tool that could query various data sources with SQL syntax, without those horrible loops, Musoq aims to minimize the effort and time required for data querying and analysis.

## 📄 License

Musoq is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

---

**Note:** While Musoq uses SQL-like syntax, it may not be fully SQL compliant. Some differences may appear, and Musoq implements some experimental syntax and behaviors that are not used by traditional database engines and this is intended!


# Musoq.DataSources

This project contains data sources for Musoq engine. Musoq data sources are plugins that allows musoq engine to treat external data sources as tables.

# Data sources

- Airtable (allows to query tables from Airtable)
- Archives (allows to treat archives as tables)
- CANBus (allows to treat CAN .dbc files and corresponding .csv files that contains records of a CAN bus as tables)
- Docker (allows to treat docker containers, images, etc as tables)
- FlatFile (allows to treat flat files as table)
- Json (allows to treat json files as tables)
- Kubernetes (allows to treat kubernetes pods, services, etc as tables)
- OpenAI (exists mainly to be combined with other plugins to allow fuzzy search by GPT models)
- Postgres (allows to treat postgres database as tables)
- SeparatedValues (allows to treat separated values files as tables)
- Sqlite (allows to treat sqlite database as tables)
- System (mostly utils, ranges and dual table resides here)
- Time (allows to treat time as table)
- Roslyn (allows to query C# code)

### To look at the engine itself go to [Musoq](https://github.com/Puchaczov/Musoq) repository.


# 🚀 Musoq.CLI

[![GitHub license](https://img.shields.io/badge/license-MIT-blue.svg)](https://github.com/yourusername/Musoq.CLI/blob/main/LICENSE)

Musoq.CLI is a powerful command-line interface that brings the magic of [Musoq](https://github.com/Puchaczov/Musoq) to your fingertips. Query various data sources with ease, wherever they reside!

## 🌟 Features

- 🖥️ Spin up a Musoq server
- 🔍 Query diverse data sources
- 🔄 Seamless server-client interaction
- 📊 Multiple output formats (Raw, CSV, JSON, Interpreted JSON)
- 🚫 No additional dependencies required

## 🚀 Quick Start

### With Server Observation

1. 📥 Download the zipped program for your architecture
2. 📂 Unpack to a directory
3. 🖥️ Open first console in the directory
4. 🏃‍♂️ Run the server:
   - Windows: `Musoq.exe serve --wait-until-exit`
   - Linux: `./Musoq serve --wait-until-exit` (use `chmod +x ./Musoq` first)
5. 🖥️ Open second console in the directory
6. 🔍 Run a query:
   - Windows: `Musoq.exe run query "select 1 from #system.dual()"`
   - Linux: `./Musoq run query "select 1 from #system.dual()"`
7. 🛑 To quit the server: `Musoq quit`

### Single Console

1. 📥 Download and unpack as above
2. 🖥️ Open console in the directory
3. 🏃‍♂️ Run the server in background:
   - Windows: `Musoq.exe serve`
   - Linux: `./Musoq serve`
4. 🔍 Run queries as needed
5. 🛑 To quit the server: `Musoq quit`

## 🎨 Output Formats

Musoq.CLI supports multiple output formats. Try this query with different formats:

```bash
Musoq run query "select Value, NewId() from #system.range(1, 10)" --format [raw|csv|json|interpreted_json]
```

- 📊 Raw Format

```
Columns:
[{"name":"Value","type":"System.Int64","order":0},{"name":"NewId()","type":"System.String","order":1}]
Rows:
[[{"value":1},{"value":"979d94fa-b4e3-4af4-9124-ec8b9d2ee75d"}],[{"value":2},{"value":"66355215-1349-45f5-9b8c-9aff13ac83f9"}],...]
```

- 📊 CSV Format

```csv
Value,NewId()
1,"fa3765ed-077d-4064-a6fd-a874fdb1e411"
2,"6d205bf8-9588-4d11-b847-48b25b226323"
...
```

- 📊 JSON Format

```json
[{"Value":1,"NewId()":"a3c745da-aef9-4ac3-b149-472af63fe080"},{"Value":2,"NewId()":"0562a629-cbfb-4950-93d5-433c52f17bf3"},...]
```

- 📊 Interpreted JSON Format

For a nested structure, try:

```bash
Musoq run query "select Value as 'obj.Number', NewId() as 'obj.Id' from #system.range(0, 10)" --format interpreted-json
```

Output:
```json
[{"obj":{"Number":0,"Id":"00666e1c-358b-424a-b1bd-2550bb3d3d1d"}},{"obj":{"Number":1,"Id":"fb391e2c-a5d6-479e-9008-a44adddb475a"}},...]
```
</details>

## 🔬 Query Code with SQL

Musoq allows you to query your code using SQL-like syntax. This feature uses **buckets** to manage loaded solutions. 
Buckets are a powerful feature for efficient data management and querying. Here's what you need to know:

- A bucket allows you to load multiple data sources into a single AssemblyLoadContext.
- It preserves loaded data in memory between queries, significantly improving performance.
- Without buckets, each query would create a new AssemblyLoadContext, reloading data every time.
- Using a named bucket lets you load data once and reuse it across multiple queries, saving time and resources.

Here's how to use buckets for code querying:

Create a bucket for various plugin cross requests data

```bash
Musoq bucket create test
```

Then use that bucket to load solution into

```bash
Musoq csharp solution load --solution "mnt\something\repos\Repo.sln" --bucket test
```

Query your solution within a bucket

```bash
Musoq run query "select p.Name from #csharp.solution('mnt\something\repos\Repo.sln') s cross apply s.Projects p" --bucket test
```

After you've done quering, unload solution from the bucket

```bash
Musoq csharp solution unload --solution "mnt\something\repos\Repo.sln" --bucket test
```

Or you can just delete bucket

```bash
Musoq bucket delete test
```

## ⛲ Pipe Extractions

The tool allows to extract various informations from photos (through LLMs providers like OpenAi or Ollama), process CLI tables as they would be native data sources. This way, you can queries and transform those data directly.

### With Powershell

```powershell
//true determine whether table has headers or not
wmic process get name,processid,workingsetsize | Musoq.exe run query "select t.Name, Count(t.Name) from #stdin.table(true) t group by t.Name having Count(t.Name) > 1"
```

Output:

```
┌─────────────────────────┬───────────────┐
│ t.Name                  │ Count(t.Name) │
├─────────────────────────┼───────────────┤
│ csrss.exe               │ 2             │
│ fontdrvhost.exe         │ 2             │
│ svchost.exe             │ 92            │
└─────────────────────────┴───────────────┘
```

### With Bash

```bash
ps -eo comm,pid,rss --sort=-rss | head -n 20 | Musoq.exe run query "select t.COMMAND, t.PID, t.RSS from #stdin.table(true) t"
```

Output:

```bash
┌─────────────────┬───────┬───────┐
│ t.COMMAND       │ t.PID │ t.RSS │
├─────────────────┼───────┼───────┤
│ python3.10      │ 339   │ 47684 │
│ snapd           │ 251   │ 36312 │
│ systemd-journal │ 40    │ 19616 │
│ docker-desktop- │ 2767  │ 17884 │
└─────────────────┴───────┴───────┘
```

### Extracting Structured Output From Text

```powershell
Get-Content 'C:\Some\Path\To\Text' | Musoq.exe run query "select l.LicenseNameOnly, l.Copyright, l.FullClause, l.LicenseSimpleDescription from #stdin.text('OpenAi', 'gpt-4o') l"
```

Output:

```
┌───────────────────────┬────────────────────────────────────────────────┬─────────────────────────────────────────────────────────────────────────────────┐
│ License               │ Copyright                                      │ LicenseSimpleDescription                                                        │
├───────────────────────┼────────────────────────────────────────────────┼─────────────────────────────────────────────────────────────────────────────────┤
│ The MIT License (MIT) │ Copyright (c) .NET Foundation and Contributors │ Permission is hereby granted, free of charge, to any person obtaining a copy of │
│                       │                                                │ this software and associated documentation files (the 'Software'), to deal in   │
│                       │                                                │ the Software without restriction, including without limitation the rights to    │
│                       │                                                │ use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies   │
│                       │                                                │ of the Software, and to permit persons to whom the Software is furnished to do  │
│                       │                                                │ so, subject to the following conditions: The above copyright notice and this    │
│                       │                                                │ permission notice shall be included in all copies or substantial portions of    │
│                       │                                                │ the Software. THE SOFTWARE IS PROVIDED 'AS IS', WITHOUT WARRANTY OF ANY KIND,   │
│                       │                                                │ EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF              │
│                       │                                                │ MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO    │
│                       │                                                │ EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES   │
│                       │                                                │ OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE,        │
│                       │                                                │ ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER     │
│                       │                                                │ DEALINGS IN THE SOFTWARE.                                                       │
└───────────────────────┴────────────────────────────────────────────────┴─────────────────────────────────────────────────────────────────────────────────┘
```

### Extracting From Image With Query (all columns are strings)

```powershell
Musoq.exe image encode "C:\Images\Receipt1.jpg" | Musoq.exe run query "select s.Shop, s.ProductName, s.Price from #stdin.image('OpenAi', 'gpt-4o') s"
```

Output:

```
┌─────────────┬─────────────────────────────────────┬─────────┐
│ s.Shop      │ s.ProductName                       │ s.Price │
├─────────────┼─────────────────────────────────────┼─────────┤
│ MEDIAEXPERT │ LOGITECH MOUSE                      │ 59.00   │
└─────────────┴─────────────────────────────────────┴─────────┘
```

### Extracting From Image With Query (columns are extracted with types hinted)

```powershell
Musoq.exe image encode "C:\Images\Receipt1.jpg" | Musoq.exe run query "table Receipt { Shop 'System.String', ProductName 'System.String', Price 'System.Decimal' }; couple #stdin.image with table Receipt as SourceOfReceipts; select s.Shop, s.ProductName, s.Price from SourceOfReceipts('OpenAi', 'gpt-4o') s"
```

### Combining Multiple Outputs Into One Table

```powershell
& { docker image ls; .\Musoq.exe separator; docker container ls } | ./Musoq.exe run query "select t.IMAGE_ID, t.REPOSITORY, t.SIZE, t.TAG, t2.CONTAINER_ID, t2.CREATED, t2.STATUS from #stdin.table(true) t inner join #stdin.table(true) t2 on t.IMAGE_ID = t2.IMAGE"
```

Output:

```
┌──────────────┬────────────────────────────────────────┬────────┬────────────────────────────────────────┬─────────────────┬───────────────┬──────────────┐
│ t.IMAGE_ID   │ t.REPOSITORY                           │ t.SIZE │ t.TAG                                  │ t2.CONTAINER_ID │ t2.CREATED    │ t2.STATUS    │
├──────────────┼────────────────────────────────────────┼────────┼────────────────────────────────────────┼─────────────────┼───────────────┼──────────────┤
│ cc802bd2841e │ qdrant/qdrant                          │ 275MB  │ latest                                 │ d87759bd4581    │ 3 weeks ago   │ Up 3 weeks   │
│ 878983f8f504 │ redis                                  │ 174MB  │ latest                                 │ 887d68135231    │ 3 weeks ago   │ Up 3 weeks   │
└──────────────┴────────────────────────────────────────┴────────┴────────────────────────────────────────┴─────────────────┴───────────────┴──────────────┘
```

### Extracting Data From Text (using Ollama)

```text
Ticket #: 1234567
Date: 2024-09-07 14:30:22 UTC
Customer: Jane Doe (jane.doe@email.com)
Product: CloudSync Pro v3.5.2
OS: macOS 12.3.1

Subject: Sync Failure and Data Loss

Description:
Customer reported that CloudSync Pro failed to sync properly on 2024-09-06 around 18:45 local time. 
The sync process started but stopped at 43% completion with error code E-1010. 
After the failed sync, the customer noticed that approximately 250 MB of data was missing from their local drive.
The customer has tried restarting the application and their computer, but the issue persists.
They are using CloudSync Pro on 3 devices in total: MacBook Pro, iPhone 13, and iPad Air.

Steps to Reproduce:
1. Open CloudSync Pro v3.5.2 on macOS 12.3.1
2. Initiate a full sync
3. Observe sync progress halting at 43% with error E-1010

Impact: High - Customer cannot sync data and has lost important files

Troubleshooting Attempted:
- Restarted application: No effect
- Restarted computer: No effect
- Checked internet connection: Stable at 100 Mbps

Additional Notes:
Customer is a premium subscriber and requests urgent assistance due to lost data containing work-related documents.
```

```powershell
Get-Content "C:\Tickets\ticket.txt" | ./Musoq.exe run query "select t.TicketNumber, t.TicketDate, t.CustomerName, t.CustomerEmail, t.Product, t.OperatingSystem, t.Subject, t.ImpactLevel, t.ErrorCode, t.DataLossAmount, t.DeviceCount, case when ToLowerInvariant(t.SubscriptionType) like '%premium%' then 'PREMIUM' else 'STANDARD' end from #stdin.text('Ollama', 'llama3.1') t"
```

Output:

```
┌────────────────┬─────────────────────────┬───────────────────────────────┬────────────────────┬──────────────────────┬───────────────────┬────────────────────────────┬───────────────┬─────────────┬──────────────────┬───────────────┬─────────────────────────────────────────────┐
│ t.TicketNumber │ t.TicketDate            │ t.CustomerName                │ t.CustomerEmail    │ t.Product            │ t.OperatingSystem │ t.Subject                  │ t.ImpactLevel │ t.ErrorCode │ t.DataLossAmount │ t.DeviceCount │ case when                                   │
│                │                         │                               │                    │                      │                   │                            │               │             │                  │               │ ToLowerInvariant(t.SubscriptionType) like   │
│                │                         │                               │                    │                      │                   │                            │               │             │                  │               │ %premium% then PREMIUM else STANDARD end    │
├────────────────┼─────────────────────────┼───────────────────────────────┼────────────────────┼──────────────────────┼───────────────────┼────────────────────────────┼───────────────┼─────────────┼──────────────────┼───────────────┼─────────────────────────────────────────────┤
│ 1234567        │ 2024-09-07 14:30:22 UTC │ Jane Doe (jane.doe@email.com) │ jane.doe@email.com │ CloudSync Pro v3.5.2 │ macOS 12.3.1      │ Sync Failure and Data Loss │ High          │ E-1010      │ 250 MB           │ 3             │ PREMIUM                                     │
└────────────────┴─────────────────────────┴───────────────────────────────┴────────────────────┴──────────────────────┴───────────────────┴────────────────────────────┴───────────────┴─────────────┴──────────────────┴───────────────┴─────────────────────────────────────────────┘
```

## 🔍 Explore CLI Options

Discover more CLI options with the `--help` command:

```bash
Musoq --help
```

## 🔮 Future Plans

Automating the installation process. Soon, you'll be able to install Musoq.CLI through package managers like `snap` or `chocolatey`. Stay tuned!

## 📄 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.
