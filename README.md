# texlive-minted-git — local test package

This is an experimental Arch Linux package for the branch
`python/conditional-local-path` of `arkadesOrg/minted`.

## Build

```bash
makepkg -s
```

The package depends on `texlive-latexextra` and Python. It reuses the bundled
wheel files already installed by `texlive-latexextra`; it does not package
copies of those wheels.

## Files installed by this package

- `/usr/share/texmf/tex/latex/minted/minted.sty`
- `/usr/share/texmf/scripts/minted/latexminted.py`
- `/usr/share/texmf/scripts/minted/latexminted_bootstrap.py`

It deliberately does **not** install `/usr/bin/latexminted`.

## Symlink override lifecycle

The `.install` script remembers the original target of
`/usr/bin/latexminted` in:

`/var/lib/texlive-minted-git/original-link-target`

The state file contains the exact target as a NUL-terminated byte sequence.
On install and upgrade, the script activates the alternative launcher. On
upgrade it only reactivates if the current target is either already the
alternative or has returned to the recorded original target. If an
administrator has changed it to some third target, that change is preserved.

On removal, the original target is restored only if the link still points to
this package's launcher. If it has been changed independently, it is left
alone.

## Important caveats

- `texlive-latexextra` remains the owner of `/usr/bin/latexminted`. The
  symlink target is changed by a package install script, so `pacman -Qkk
  texlive-latexextra` may report it as modified.
- An upgrade of `texlive-latexextra` may restore its packaged symlink target.
  The `post_upgrade` hook reactivates this alternative only when the target
  matches the previously recorded original target.
- The package is intentionally co-installable with `texlive-latexextra`:
  it declares `provides=('texlive-minted')` and no `conflicts` or `replaces`.
- This is a local experiment, not a claim that mutating another package's
  owned symlink is an ideal long-term pacman integration. A native pacman
  alternatives mechanism would model this relationship more accurately.

## Local checks

The `check()` function runs the branch's standard-library unittest suite for
the bootstrap helper. The build-time launcher patch is deliberately guarded:
if the expected upstream code fragment changes, `prepare()` fails rather
than silently producing a launcher that cannot find its fallback wheels.
