# jrnlc

A tiny terminal-based journaling tool written in C++.

`jrnlc` is a personal project built to be simple, fast, and predictable. It stores
journal entries in a plain-text file and focuses on minimalism rather than features.
No database, no cloud sync — just text on disk.

This project also served as a learning exercise in modern C++, POSIX file handling,
and basic CLI design.

# # Features

- Local (directory specific) and global journals.
- Add journal entries from command-line arguments or stdin
- Optional tags for entries
- Display entries using ranges
- Uses the tag of the last entry for the new entry, unless a specific tag is passed
- Filter entries by time (`--before`, `--after`)
- Atomic file writes (write-to-temp + rename)
- Plain-text, human-readable storage format
- Config file to store journal path and color codes 
- Optional ANSI colorized output (configurable)
- Compatible with Unix tools like grep, less, echo etc.

# ## Tag Continuation

When adding entries, `jrnlc` supports implicit tag continuation:

- If a tag is explicitly provided, it is used.
- If no tag is provided, the tag from the **previous entry** is reused.
- If no previous tag exists, entries default to the tag `jrnl`.
- An explicitly empty tag is treated as invalid and falls back to the same behavior.

This allows fast journaling without repeatedly retyping tags, while still allowing explicit overrides.

# # Installation

# ## Build from source

`jrnlc` uses CMake for building and installation.

Requirements:
- CMake ≥ 3.10
- A C++17-compatible compiler (GCC or Clang)
- POSIX-compatible system (Linux)

Clone the repository and build:

```sh
git clone https://github.com/manjunathamajety/jrnlc.git
cd jrnlc
mkdir build
cd build
cmake ..
make
```
To install the binary to your system 
```sh
sudo make install
```

# # Configuration

On first run, to create a global journal, run
```sh
jrnlc init --global
```
This automatically creates a config file at the location,
- `$XDG_CONFIG_HOME/jrnlc/jrnlc.txt`
- or `~/.config/jrnlc/jrnlc.txt` if `XDG_CONFIG_HOME` is not set

The configuration file allows customization of:

- Journal storage path
- Backup directory
- ANSI color codes (256-color) for output

Example configuration:
```sh
PATH$/home/user/.local/share/jrnlc/journal.txt

BACKUP_PATH$/home/user/.local/share/jrnlc/backup

Id$32
Tag$34
Time$32
Text$37
```

Lines starting with `# ` are treated as comments.

To create local journals, in specific directories, run

```sh
jrnlc init --local
```
This creates a sub-directory in the current working directory,
- `.jrnlc/` with journal location as `.jrnlc/journal.txt`
- backup location as '.jrnlc/backup'

# ## Local vs Global Journals

`jrnlc` supports **local journals** (directory-specific) and a **global journal** (user-wide).  
- **Local journals** are stored inside a `.jrnlc/` folder in the current directory.  
- **Global journal** is stored in the config directory (`~/.config/jrnlc/jrnlc.txt` or `$XDG_CONFIG_HOME/jrnlc/jrnlc.txt`).  

If both exist, `jrnlc` commands default to the **local journal** unless `--global` is specified.



# # Example Usage

```sh
jrnlc init --local # initialize local journal in that repository.
jrnlc init --global # initialize global journal

jrnlc add "met a cat today" mood
jrnlc add "this came from stdin"
echo "piped thoughts" | jrnlc add

jrnlc show *  # displays the entire jrnlc
jrnlc show 3  # displays the 3rd entry
jrnlc show *5 # displays first 5 entries
jrnlc show 5* # displays last 5 entries
jrnlc show --after "2025-01-01 10:00"
jrnlc show --before "2025-01-10 18:30"
jrnlc show --after "2025-01-10 00:00" --before "2025-02-10 00:00"
jrnlc show | grep "new-year" # can be composed for more search options

Both range based and time based filters can be composed with one another. 
```

```sh
jrnlc show --after "2025-01-01 10:00" "*5"
jrnlc show --after "2025-01-01 10:00" "5*"

jrnlc show --before "2025-01-10 18:30" "*9"
jrnlc show --before "2025-01-10 18:30" "9*"
```
Backup can be generated as follows;
```sh
jrnlc backup # autogenerates backup's name with current timestamp
jrnlc backup "backup@newyear" # custom backup name
```

# # Storage Format

Journal entries are stored as one entry per line in a plain-text file:

```sh
id;tag;timestamp;text
```
- `id`        : Auto-generated numeric identifier
- `tag`       : User-provided label (defaults to `jrnlc`)
- `timestamp` : Unix timestamp (`time_t`)
- `text`      : Journal entry content

This format is intentionally simple so entries can be inspected, backed up,
or processed using standard Unix tools.

Manual edits are possible, but malformed or partially corrupted entries
may be skipped when loading.

# # Design Notes


- Operations are performed on local journal (if it exists), by default unless specified otherwise via --global flag. If local journal is absent, operations are performed on global by default.
- Journal IDs are generated automatically by the tool
- Timestamps are stored as `time_t`
- Entries are appended in chronological order
- Writes are atomic (write to a temporary file, then rename)
- Journal files and parent directories are created automatically if missing

The tool assumes it is the sole writer of the journal file.
Concurrent writes or external modification are not supported.

# # Non-goals

`jrnlc` intentionally does not aim to:

- Provide encryption or secrecy guarantees, Human-readability is the aim
- Support concurrent writers
- Replace full-featured journaling or note-taking applications
- Offer cloud sync or cross-device features

It aims to follow Unix philosophy of "Do one thing, but do it well". Hence the features to pipe with other Unix tools as well. 




