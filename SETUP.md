# Bashd AUR package

Packaging-only branch. Scripts are **not** stored here — they come from a
GitHub tag of `main` (`source=` in the PKGBUILD).

```bash
yay -S bashd
# or
paru -S bashd
```

Login shells source `/usr/share/bashd/bashd-init.sh` via `/etc/profile.d/bashd.sh`.
For other interactive shells, add to `~/.bashrc` or `~/.zshrc`:

```bash
[ -f /usr/share/bashd/bashd-init.sh ] && . /usr/share/bashd/bashd-init.sh
```

That init file is required for directory-changing helpers (`hop`, `crush`,
`tmpws`, `bm`, `mark`, `ld`, `ndir`, `cdch`, `qs`). Other commands are on PATH
as wrappers around `bashd`.

0.1.x names still work: `prefix` → `pfx`, `bfold`/`cram` → `wrap`, `ufold` → `uwrap`.

Remote extras (`archive`, `pullfrom`, `pushto`) read `~/.config/bashd/remote.conf`.

Manual install (non-Arch) is `make install-core` on **main**, not this branch.
