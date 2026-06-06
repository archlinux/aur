# pgcli-zsh-completion

AUR package that installs a zsh completion script for [pgcli](https://www.pgcli.com/).

The completion script is generated at build time by invoking pgcli's own Click completer, so options stay in sync with the installed pgcli version. Database names and role names are resolved live via `psql` at completion time.

## Install

```
yay -S pgcli-zsh-completion
```

Or manually:

```
git clone https://aur.archlinux.org/pgcli-zsh-completion.git
cd pgcli-zsh-completion
makepkg -si
```

## See also

- [pgcli-completion.bash](https://github.com/dbcli/pgcli/blob/main/pgcli-completion.bash) — the official bash completion script bundled with pgcli
