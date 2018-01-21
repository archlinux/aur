# paudit

A script that gets all explicitly installed Arch packages and lets you select the ones to remove.

## What You Need

* Arch Linux
* [Yaourt](https://aur.archlinux.org/packages/yaourt)
* `export EDITOR="my-editor-command"` in your .rc/.profile

## Usage

Run `paudit.sh` in any directory.

You'll then open the list of all explicitly installed packages with `$EDITOR`.

Remove the ones you want to get rid of (e.g. `dd` in vim) and save/close the file and exit the editor.

You'll be asked for confirmation before the difference between your file and all installed packages are passed to `yaourt -Rsn`.
