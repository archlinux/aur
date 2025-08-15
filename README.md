# org

`NOTE: This is the first ever release. This WILL break for you. But you've got to start somewhere. It should work for some of you though. Please note again: this is the first release and is 99% incomplete. But it is off the 'ground', whatever that means`

A text-first suckless second-brain CLI tool.

Org is a terminal-based tool for managing notes, todos, and events. It is designed to be simple, open-source, and locally based — a 'suckless' alternative to proprietary tools like Notion. It focuses on the essentials of a 'second-brain' app: storing and querying your notes, todos, and events in a clean, predictable way.

**Core principles:**

- **Local storage** — Your data should stay on your machines or wherever you choose.
- **Accessible formats** — Your data should remain in text files. It is readable and editable without special software.
- **Simple querying** — You should quickly be able find the most important information without complex tools.
- **Simple structure** — Your data should be organised so you can navigate your files directly, with or without Org, so that your data is compatible with other software.

---

## Quick start

### Install

```bash
pip install "git+https://github.com/benjaminingreens/org.git@v0.1.0"
```

or, if you have a managed environment, do something like this:

```bash
# 1. Create a dedicated virtual environment for org
python3 -m venv ~/.venvs/org

# 2. Install org from GitHub into that environment
~/.venvs/org/bin/pip install "git+https://github.com/benjaminingreens/org.git@v0.1.0"

# 3. Create a bin directory in your home if it doesn't exist
mkdir -p ~/.local/bin

# 4. Create a wrapper script so you can run 'org' without activating the venv
echo '~/.venvs/org/bin/org "$@"' > ~/.local/bin/org
chmod +x ~/.local/bin/org

# 5. Add ~/.local/bin to your PATH if it's not already there
echo 'export PATH="$HOME/.local/bin:$PATH"' >> ~/.profile
. ~/.profile
```

To update:

`~/.venvs/org/bin/pip install -U "git+https://github.com/benjaminingreens/org.git@vX.X.X"`

The above is useful for installing on the likes of `iSH`. I will release on the AUR soon, and hope to release on homebrew also.

### Initialise a workspace
Run this **in the directory you want as your root**:
```bash
org init
```
This writes a `.orgroot` marker. From then on, running `org` inside any subfolder will operate at the workspace root automatically.

> If nested `.orgroot` markers exist *below* your current directory, `org init` will warn and abort (auto-absorb not implemented yet).

---

## How `org` executes

1. Ensures you’re inside an initialised workspace (`.orgroot`).
2. Runs validation (invokes `validate_rewrite.py`), updating `org.db`. Any issues are written to `org_errors`.
3. Executes your command.

`org tidy` refuses to run if `org_errors` exists.

SQLite index: `<workspace>/org.db`.

---

## Commands

All commands are invoked as:
```bash
org <command> [args...]
# or, if running in-place:
python3 org.py <command> [args...]
```

### `report`
```
org report [<tag>]
```
Daily snapshot:
- **Events (today)** in time order (pattern-aware).
- **Todos (priority 1 & 2)**.

If `<tag>` is provided, both sections filter by that tag.

**Example output**
```
=== Events (today) ===
- 09:00–10:00 Team Standup (20250811t090000.txt) [Scheduled] (work, standup)

=== Todos (priority 1 & 2) ===
- Fix issue for client (20250701t101010.txt) [In Progress] (work, report)
```

---

### `notes`
```
org notes [<tag> ...]
```
List valid notes. With tags, performs a “contains” filter for each tag.

**Example output**
```
20250810t223344.txt: Draft chapter structure
```

---

### `todos`

todos live in a .td file with the following syntax:

`* t: todo // <metadata>`

`will actually tell you what the metadata is later...`

```
org todos [<tag>]
```
List valid todos (most recent first). Optional single tag filter.

**Example output**
```
- Send email to John (todos.td) [Not started] (email, work)
```

---

### `events`

events live in an .ev file with the following syntax:

`* e: event // <metadata>`

`will actually tell you what the metadata is later...`

```
org events [<tag>]
```
Print **today’s** events in chronological order (pattern-aware). Optional single tag filter.

**Example output**
```
- 15:00–16:00 PCC meeting (events.ev) [Scheduled] (parish, pcc)
```

---

### `tidy`
```
org tidy
```
Cleans up invalid/old files. Refuses to run if `org_errors` exists.

---

## Coming soon
- `org add`: create new notes/todos/events from CLI
- `org archive`: move old items to archive

---

## License
AGPLv3 — see LICENSE file for details.
