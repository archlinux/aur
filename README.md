# zsh-zim-git

This package installs Zim system-wide under `/usr/lib/zim`, with configuration in `/etc/zsh`.

## File conflicts during an upgrade

An upgrade can fail with `failed to commit transaction (conflicting files)` and paths under `/usr/lib/zim` marked `exists in filesystem`.
This can happen when Zim or a manual installation added files outside pacman, and a newer package includes those files.
Pacman stops before upgrading the package or running its install scripts.

Check each conflicting file using its exact path from the error:

```sh
pacman -Qo /path/from/the/error
```

If pacman names an owning package, report the conflict to the package maintainer before moving or overwriting anything.
If it reports `No package owns ...`, back up and move the unowned files outside `/usr/lib/zim`, then retry the original upgrade command.

For conflicts within a module, preserve the whole module directory, including its `.git` directory and any local changes.
First replace `MODULE_NAME` below with the affected module's directory name and check ownership of every file in it:

```sh
zim_module=/usr/lib/zim/modules/MODULE_NAME
find "$zim_module" ! -type d -exec pacman -Qo -- {} +
```

Continue only if every file is reported as unowned.
Move the module to a separate backup directory:

```sh
zim_backup=$(mktemp -d /var/tmp/zsh-zim-backup.XXXXXX) &&
  sudo mv -- "$zim_module" "$zim_backup/" &&
  printf 'Backup saved in %s\n' "$zim_backup"
```

Repeat for each affected module, then retry the original upgrade command.
Keep your current shell open until the upgrade succeeds; if it fails again, restore the moved modules before starting a new shell.
After a successful upgrade, start a new shell and check that Zim works before removing any backups.

Do not delete `/usr/lib/zim` or use a blanket `--overwrite '*'`, as this can discard local changes or overwrite files belonging to other packages.
For personal modules, use a separate Zim installation under your home directory.

See the [pacman manual](https://man.archlinux.org/man/pacman.8.en) for file ownership queries and conflict handling.
