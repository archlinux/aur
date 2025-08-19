# org - `alpha release`

`NOTE: This is the alpha release. This will probably break for you, and it will be slower than the ideal. Only the most basic features exist (see the command list), and I am still writing some of the core commands. I am a while off from a beta release, which would be the first release that would be usable by a wider audience. This release is to test the simplest of functionality, and nothing more. Feedback on such matters is welcome.`

## What is 'org'?

Org aims to be a text-first suckless second-brain CLI tool.

Org is a terminal-based tool designed for managing notes, todos, and events. It is seeking to meet the need for a 'second-brain' which many have in our modern age; the need to capture, organise, and query an overflow of personal information and data in order to maximise its usefulness.

Why not just use Notion, Evernote, or even Apple Notes/Reminders? Most - if not all - 'second-brain' apps today force users to cede territory in key areas, such as: locality of data storage, accessibility and portability of data, simplicity of the structure data, and, most notably: the cost of organising data.

Org wants to meet the same needs these apps meet while honouring these core principles:

- **Locality** — Your data should stay on your machines or wherever you choose.
- **Accessibility** — Your data should remain in accessible and portable formats - such as plain-text files.
- **Simplicity** — Your data should be organised and structured simply so that it is compatible with other (or no) software and querying tools.
- **Affordability** - All the above should be available to you for free.

## Quick Start

### 1. Install

The only package manager which hosts org currently is `yay`. Install with: `yay -S org`.

For those who don't use `yay`: I plan to make org available on as many platforms as I can. For now, the below instructions will suffice while I am alpha testing:

```bash
pip install "git+https://github.com/benjaminingreens/org.git@v0.1.4"
```

If you have a managed environment, do something like this:

```bash
# 1. Create a dedicated virtual environment for org
python3 -m venv ~/.venvs/org

# 2. Install org into that environment
~/.venvs/org/bin/pip install "git+https://github.com/benjaminingreens/org.git@v0.1.4"

# 3. Create a bin directory in your home if it doesn't exist
mkdir -p ~/.local/bin

# 4. Create a wrapper script so you can run 'org' without activating the venv
echo '~/.venvs/org/bin/org "$@"' > ~/.local/bin/org
chmod +x ~/.local/bin/org

# 5. Add ~/.local/bin to your PATH if it's not already there
echo 'export PATH="$HOME/.local/bin:$PATH"' >> ~/.profile
. ~/.profile
```

To update, run:
```bash
~/.venvs/org/bin/pip install -U "git+https://github.com/benjaminingreens/org.git@v0.1.4"
```

### 2. Initialise

Run `org init` **in the directory you want to use as your org workspace**.

From then on, running `org` inside any subfolder will operate at the workspace directory automatically.

## Using Your Workspace

At this early stage, Org manages three types of files:

`.txt` files - or 'notes'.
`.td` files - or 'todos'.
`.ev` files - or 'events'.

### `note` Conventions

Org relies on YAML-style metadata in `.txt` files to index and manage your notes. For example:

```YAML
---
title: Note title
tags: [general]
---

this is the note content
```

Officially, no metadata is required when the user creates a `.txt` note. However, if no metadata is returned, Org will assume the following defaults:

```YAML
---
title: YYYYMMDDTHHMMSS
tags: [general]
authour: <your_name>
creation: YYYYMMDDTHHMMSS
---

this is the note content
```

If you wish, you may include a `description` property to include a brief description of your note. Org does not assume any defaults for this property.

### `todo` and `event` Conventions

`.td` (todo) and `.ev` (event) files follow similar conventions to one another.

Todos and Events are stored in respective files; todos can only be stored in `.td` files, and events can only be stored in `.ev` files. They cannot be stored together.

Here is an example of a `.td` file:
```td
* t: buy drinks for sam's party
```

Here is an example of an `.ev` file:
```ev
* e: sam's party
```

Both can be stored with metadata, like so:

```td
* t: buy drinks for sam's party // #shopping
```

```ev
* e: sam's party // #birthdays
```

As you might have guessed, the `#` symbol represents a `tag`, and is the in-line equivalent to the `tags` property in the `.txt` notes file.

Below is a table showing the metadata schemas for todo and event files:

`r` = required
`d` = defaultable (org will generate a default value without user input)
`n` = not required / optional (org will not generate a default value without user input)
`a` = automatic (org will generate a value regardless of user input)
`-` = n/a (property not compatible)

| name        | syntax  | todo | event | multiple | type     | format          |
|-------------|---------|------|-------|----------|----------|-----------------|
| tag         | `#foo`  | d    | d     | true     | list     | array           |
| authour     | `$foo`  | d    | d     | false    | str      | string          |
| creation    | `~foo`  | a    | a     | false    | datetime | YYYYMMDDTHHMMSS |
| status      | `=foo`  | d    | d     | false    | str      | string          |
| assignee    | `@foo`  | d    | d     | true     | list     | array           |
| priority    | `!foo`  | d    | d     | false    | int      | integer         |
| title       | `/foo`  | –    | –     | false    | str      | string          |
| description | `+foo`  | –    | –     | false    | str      | string          |
| deadline    | `%foo`  | n    | –     | false    | datetime | YYYYMMDDTHHMMSS |
| start       | `>foo`  | –    | r     | false    | datetime | YYYYMMDDTHHMMSS |
| pattern     | `^foo`  | –    | n     | false    | str      | string          |
| end         | `<foo`  | –    | n     | false    | datetime | YYYYMMDDTHHMMSS |

## Command List

`Note`: These commands are largely in development. The most mature part of this app is the indexing and validation (that is, structuring of data). Building useful ways of querying your data is what comes next, and all that exists are essentially placeholders. Every single command you see here is about 10% complete, and will have much more added to it.

Before running through other commands, it is worth mentioning the `org collab` command. This command enables you to set up a connection between two distinct workspaces so that many of the below commands apply to multiple workspaces at once (except for `org tidy` and `org group` - which only apply to the current workspace). `org collab` will ask you to define a 'ceiling' - a reference point from which org will search for other workspaces, which will usually be your `/home`. It will then ask you to enter a workspace id to connect to a workspace. This id can be found in the `.orgroot` file of any workspace.

`org init` - initialises a dir as an org workspace  
`org notes` - lists all notes managed by org  
`org todos` - lists all priority 1 & 2 todo items in the workspace  
`org events` - lists all events of the day  
`(sorting and filtering to be included for the above three in future)`  
`org report` - combination of `org todos` and `org events` (custom reports to be included in future)  
`org tags` - lists all tags found in the workspace  
`org tidy` - organises files into relevant folders: `YYYY/MM` folders based on modification time, or project folders (see below command)  
`org group <project_name> [tag1] [tag2]` - creates a folder called `_project_name`, and moves all notes, todos, and events of any specified tags into that folder.

There are some hidden commands for fun. Many of which are still in development.

`Note`: on flat structure

Commands coming soon:

`org add` - create new notes/todos/events from CLI  
`org archive`- move old items to archive

---

## License

AGPLv3 — see LICENSE file for details.
