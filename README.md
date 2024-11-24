[![Maintenance](https://img.shields.io/badge/Maintained%3F-yes-green.svg)](https://github.com/Puchaczov/Musoq/graphs/code-frequency)
[![Nuget](https://img.shields.io/badge/Nuget%3F-yes-green.svg)](https://www.nuget.org/packages?q=musoq)
[![Build](https://travis-ci.org/Puchaczov/Musoq.svg?branch=master)](https://travis-ci.org/Puchaczov/Musoq.svg?branch=master)

# A Quick Description of Musoq
Musoq is handy tool that allows you to use SQL syntax on a variety of data sources.

![Anim](https://github.com/Puchaczov/Musoq/blob/master/musoq_anim_3.gif)

# What is Musoq? (in depth) 
Musoq exposes raw data sets as queryable sources. This allows you to query those sources using a syntax very similar to SQL. It uses concepts of schemas and tables to logically define your datasources. What can be used as query source? Virtually anything! Here are some ideas (many of them are already included in this project!):

- Directories
- Files
- Structured files (.csv, .json, .xml, logs)
- Photos (by exif attributes)
- Archived files (.zip)
- Git, Svn, TFS
- Websites (tables, lists)
- Processes
- Time

You can also mix sources between each other.

## What does a query look like?

  `select * from #os.files('path/to/folder', false) where Extension = '.exe' or Extension = '.png'`
 
## How to run it?

To run it, you need `.NET Core 2.1` runtime. You can find it [here](https://www.microsoft.com/net/download/dotnet-core/2.1). Once you have that, then download **[Musoq Simple Client](https://github.com/Puchaczov/Musoq.Console)**. You can find latest releases [here](https://github.com/Puchaczov/Musoq.Console/releases).

## Does it work on Linux?

Yes, it does. I have tested it on Ubuntu 18.04. If you try to run it on different distro or version, I will be grateful if you would post an issue reporting either success or fail

## What features does the Musoq implements

- Use of `*` to select all columns.
- Group by operator.
- Having operator.
- Skip & Take operators.
- Complex object accessing ability `column.Name`.
- User defined functions and aggregation functions.
- Plugin API (to create your own custom data source).
- Set operators (non sql-like usage) (union, union all, except, intersect).
- Parametrizable sources.
- Like / not Like operator.
- RLike / not RLike operator (regex like operator).
- Contains operator (Doesn't support nested queries yet).
- CTE expressions.
- Desc syntax.
- In syntax.
- Inner join syntax.

## Open to add new syntax features

Do you think that SQL lacks some syntax that could simplify your work? Write this, I am open to implementations of features that sql does not have if they can prove their usefullness. 

## Roadmap

- Dynamic Query parameters like: `select * from #schema.table(@Arg2, ...) where ColumnName = @Arg1`
- Query as data source (views)
- Optional query reordering `FROM ... WHERE ... SELECT...`
- Ability to use query as a source of next query like `with p as (select 1 from #source) select 2 from #source.method(p)`
- Syntax to query constructors about it's parameters (desc for constructors).
- Syntax to query plugins about it's methods and parameters (desc for methods).
- Rethink and design mechanism to dispose unmanaged resources.
- Further project cleanups and more robust tests.

## Long term goals

- Order by further implementation.
- Translated code optimizations.
- Rethink how `LibraryBase` works in mixed sources context.
- Left and right join syntax.
- between ... and ... syntax.

## Current known critical issues

- Chunks loader will greedily load datas until memory runs out (important to know for huge files).
- Unmanaged resources are disposed too fast.
- There is not any kind of framework that allows plugin communicate with runtime about the issues occurred internally.

## Architecture for plugins

You can easily plug-in your own data source. There is fairly simple plugin api that all sources use. To read in details how to do it, jump into wiki section of this repo [click](https://github.com/Puchaczov/Musoq/wiki/Plugins).

## Roughly about performance

[![Maintenance](https://github.com/Puchaczov/Musoq/blob/master/musoq_sim_agg_pict.png)](https://github.com/Puchaczov/Musoq/blob/master/musoq_sim_agg_pict.png)

Tested on laptop with i7 7700HQ, 12 GB RAM, Windows 10, Main Disk (250 GB SSD), Secondary Disk (1TB HDD). Files were placed on the HDD. The query tested was counting how many rows the files has. The file tested was a single 6GB csv file with 11 columns. For each test the file was split to reflect sizes you can observe in chart. This should give you some guidance on what data processing rate you can expect using this tool.

## Plugins

Plugins which have been implemented so far include:

| Plugin | Description |
| ---    | --- |
| `#Os`       | Exposes operating system tables. One of them are disk and files sources |
| `#Zip`      | Exposes compressed (.zip) files from the hard disk so that you can decompress files that fits sophisticated conditions. |
| `#Json`     | Exposes json file as queryable source. |
| `#Csv`      | Exposes csv file as queryable source. |
| `#FlatFile` | Exposes FlatFile file as queryable source. |
| `#Time`     | Exposes time as queryable source. |


## Query examples

- Gets all files from folder that has extension `.exe` or `.png`

      select * from #os.files('path/to/foder', false) where Extension = '.exe' or Extension = '.png'
      
- Gets all hours from 7 to 12 (excludingly) for all saturday and sundays from `01.04.2018 00:00:00` to `30.04.2018 00:00:00`

      select DateTime, DayOfWeek + 1 from #time.interval('01.04.2018 00:00:00', '30.04.2018 00:00:00', 'hours') where Hour >= 7 and Hour < 12 and (DayOfWeek + 1 = 6 or DayOfWeek + 1 = 7)

- Shows `.cs` files from folders `some_path_to_dir_1`, `some_path_to_dir_2`, `some_path_to_dir` and their subfolders (uses disk plugin).

      select Name, Sha256File(), CreationTime, Length from #os.directory('some_path_to_dir_1', true)
      where Extension = '.cs' take 3
      union all (Name)
      select Name, Sha256File(), CreationTime, Length from #os.directory('some_path_to_dir_2', true)
      where Extension = '.cs' take 4
      union all (Name)
      select Name, Sha256File(), CreationTime, Length from #os.directory('some_path_to_dir', true)
      where Extension = '.cs' take 5

- Groups by `Country` and `City`.

      select Country, City, Count(City) from #A.Entities() group by Country, City
      
- Accessing complex objects and passing it to method.

      select Inc(Self.Array[2]) from #A.Entities()
      
- Compressing files from folder (uses `AggregateFiles` grouping method)

      select Compress(AggregateFiles(), './Results/some_out_name.zip', 'fastest') from #os.directory('./Files', false)
      
- Decompresses only those files that fits the condition. Files are extracted to directory `./Results/DecompressWithFilterTest` 

      select Decompress(AggregateFiles(File), './Results/DecompressWithFilterTest') from #zip.file('./Files.zip') 
      where Level = 1
     
- Querying `.json` file.

      select Name, Age from #json.file('./JsonTestFile_First.json', './JsonTestFile_First.schema.json', ' ')
     
where schema is defined as: 

    { 
       "Age": "int",
       "Name": "string",
       "Books": [] 
    }
    
and file to be queried is:

    [
      {
        "Name": "Aleksander",
        "Age": 24,
        "Books": [
          {
            "Name": "A"
          },
          {
            "Name" : "B" 
          }
        ]
      },
      {
        "Name": "Mikolaj",
        "Age": 11,
        "Books": []
      },
      {
        "Name": "Marek",
        "Age": 45,
        "Books": []
      }
    ]
    
## How do I know what columns the source has?

There is a built-in way to list all the columns from a source, all plugins supports it out of the box! The command is: `desc #git.commits('path/to/repo')`. 

## Motivation for creating this project

On the one hand, I needed something that allowed me to perform queries on my own bank account file, at the same time something that filters with respect to file names and their content. I had the idea that I would like it to be a single tool rather than a set of tools. That's how the musoq was born in my mind, with extensible plugins system and user defined grouping operators. All that Musoq does, you can achieve by "hand writing" multiple scripts manually, however I found it useful to automate this process and as a result minimizing the amount of time to create it. Fast querying was my goal. Looking at it another way, you might see that Musoq transpiles SQL code into C# code and then compiles it with Roslyn. In that case, writing C# code is redundant when all you have to do is to write a query and it will do the magic with your data source.

## Please, be aware of

As the language looks like sql, it doesn't mean it is fully SQL compliant. It uses SQL syntax and repeats some of it's behaviour however, some differences may appear. It will also implement some experimental syntax and behaviours that are not used by database engines.

I will try to keep this list of the incompatibilities up-to-date (hopefully):

- `Parent group aggregations`
- `Non standard set operators based on keys rather than rows.`
- `There is no support for huge sources exceeds memory`

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details


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
