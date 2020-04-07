# bok

`bok` is a simple shellscript for managing personal journals.
In `$BOK_DIR` (`$HOME/journal` by default) it creates a directory tree organized by year and month,
and places the day's journal in that folder.
For example, the journal entry for `2020-04-20` would be
`$BOK_DIR/2020/04/20`.

## Installation
```
git clone https://github.com/astroengisci/bok.git
cd bok
sudo make install
```

## Usage

`bok new` will open today's journal file in `$EDITOR`.

`bok edit SOME_DATE` will edit the journal file for the specified date.
The date can be in any format accepted by `date -d`.
If no date is specified, the behavior is the same as `bok new`.

`bok view SOME_DATE` will open the specified entry in `less` with
the following custom keybindings (specified as a `lesskey` file at `$BOK_KEYS`, which is `~/.bokrc` by default):
- h/l: Previous/next journal entry
- j/k: Scroll down/scroll up

If no date is specified, it will open today's entry.
If the specified entry does not exist, it will fail.

`bok search REGEX` will search the journal for entries matching the specified regex.

`bok searcht TAG` is the same as `bok search` but only returns matches
from the second line of the file.
This line is meant to be reserved for tags, letting you categorize
your journal entries.

`bok searchv` and `bok searchtv` will search in the same way as
`bok search` and `bok searcht`, but will open the matches in the
same dialog as `bok view`, allowing you to flip through and read them.

# Planned features

- [x] Edit arbitrary journal entries
- [x] View journal entries 
	- [x] Navigate entries by day, week, month, and year. (`less` allows you to type a number before a command, like `vim` does; `7l` effectively skips forward a week)
- [x] Search journal entries
	- [x] Search by keyword
	- [x] Search by tag (whitespace-separated list in second line of file)
	- [x] Open search results in viewer

