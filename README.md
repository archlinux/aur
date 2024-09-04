# Musoq

[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)
[![Maintenance](https://img.shields.io/badge/Maintained%3F-yes-green.svg)](https://github.com/Puchaczov/Musoq/graphs/code-frequency)
[![Nuget](https://img.shields.io/badge/Nuget%3F-yes-green.svg)](https://www.nuget.org/packages?q=musoq)
![Tests](https://raw.githubusercontent.com/puchaczov/musoq/master/badges/tests-badge.svg)

Musoq brings SQL power to your data, wherever it lives. Query files, directories, CSVs, and more with familiar SQL syntax – no database required.

## 🌟 Key Features

- **Versatility:** Data sources come as plugins. Visit the [Musoq.DataSources](https://github.com/Puchaczov/Musoq.DataSources) repository where they are all stored..
- **SQL Syntax Variant:** The engine uses SQL syntax variant with support for complex queries.
- **Cross-Platform:** Runs on Linux, Windows, and Docker. MacOS compatibility is anticipated.
- **In-place querying without data movement:** Query data where it resides, without the need to move or load it into a central data store.
- **Extensible architecture for custom data sources:** Add support for custom data sources through a plugin architecture.

## 🚀 Quick Start

To try out Musoq, follow the instructions in our [CLI repository](https://github.com/Puchaczov/Musoq.CLI).

## 💡 Example Queries

Musoq can handle a wide variety of data sources. Here are some examples:

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

-- Get first, last 5 bits from files and consecutive 10 bytes of file with offset of 5 from tail
SELECT
	ToHex(Head(5), '|'),
	ToHex(Tail(5), '|'),
	ToHex(GetFileBytes(10, 5), '|')
FROM #os.files('/some/directory', false)

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

-- Query CAN DBC files
SELECT
    ID,
    Name,
    DLC,
    CycleTime
FROM #can.messages('./file.dbc')

-- Compare two directories
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

-- Find large files
SELECT
    FullName
FROM #os.files('', true)
WHERE ToDecimal(Length) / 1024 / 1024 / 1024 > 1

-- Compute sentiment on a comments
SELECT
    csv.PostId,
    csv.Comment,
    gpt.Sentiment(csv.Comment) as Sentiment,
    csv.Date
FROM #separatedvalues.csv('/home/somebody/comments_sample.csv', true, 0) csv
INNER JOIN #openai.gpt('gpt-4-1106-preview') gpt on 1 = 1

-- Compute Sha on files
SELECT
   FullName,
   f.Sha256File()
FROM #os.files('@qfs/', false) f

-- Get only files that extension is .png or .jpg
SELECT
    FullName
FROM #os.files('C:/Some/Path/To/Dir', true)
WHERE Extension = '.png' OR Extension = '.jpg'

-- Group by directory and show size of each
SELECT
	DirectoryName,
	Sum(Length) / 1024 / 1024 as 'MB',
	Min(Length) as 'Min',
	Max(Length) as 'Max',
	Count(FullName) as 'CountOfFiles',
FROM #os.files('/some/path', true)
GROUP BY DirectoryName

-- Prints the values from 1 to 9
SELECT Value FROM #system.range(1, 10)
```

## 🎬 Watch It Live

![Musoq Demo](https://github.com/Puchaczov/Musoq/blob/59603028e8fbe90ce8444077cf3561ff8e698afd/musoq.gif)

## 🛠 Supported Data Sources

- SeparatedValues (CSV, TSV, etc.)
- Archives
- OS (File System - files and directories)
- ...many more, Look at the [Musoq.DataSources](https://github.com/Puchaczov/Musoq.DataSources) repository

## 🔧 Syntax Features

Musoq supports a rich set of SQL-like features:

- Optional query reordering (FROM ... WHERE ... GROUP BY ... HAVING ... SELECT ... SKIP N TAKE N2)
- Use of `*` to select all columns
- GROUP BY and HAVING operators
- SKIP & TAKE operators
- Complex object accessing (`column.Name`)
- User-defined functions and aggregation functions
- Set operators (UNION, UNION ALL, EXCEPT, INTERSECT)
- Parameterizable sources
- LIKE / NOT LIKE operator
- RLIKE / NOT RLIKE operator (regex)
- CONTAINS operator
- CTE expressions
- DESC for schema, schema table constructors and tables
- IN syntax
- INNER, LEFT OUTER, RIGHT OUTER join syntax
- ORDER BY clause

## 🏗 Architecture

### High-level Overview
![Architecture Overview](https://github.com/Puchaczov/Musoq/blob/master/Musoq-Architecture-Engine.png)

### Plugins
Musoq offers a plugin API that all sources use. To learn how to implement your own plugin, you should examine how existing plugins are created.

## 💡 Motivation

Developed out of a need for a versatile tool that could query various data sources with SQL syntax, Musoq aims to minimize the effort and time required for data querying and analysis.

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

## 🔍 Explore CLI Options

Discover more CLI options with the `--help` command:

```bash
Musoq --help
```

## 🔮 Future Plans

Automating the installation process. Soon, you'll be able to install Musoq.CLI through package managers like `snap` or `chocolatey`. Stay tuned!

## 📄 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.
