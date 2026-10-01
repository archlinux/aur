# herta-bin

Arch Linux packaging for [Herta](https://github.com/PersonaCLI/Herta), the
desktop companion built on DeepSeek.

This repository is the source of the `herta-bin` package on the
[AUR](https://aur.archlinux.org/packages/herta-bin). It repacks the official
upstream AppImage: only the application payload (`resources/`) is installed,
and the Chromium runtime comes from Arch's `electron43` package. That keeps the
installed size around 67 MiB instead of the 334 MiB the AppImage's bundled
Electron would take, and lets Electron security updates arrive through pacman.

## Install

```sh
paru -S herta-bin     # or: yay -S herta-bin
```

## Layout

| Path | Purpose |
| --- | --- |
| `/usr/bin/herta` | launcher (`herta.sh`) |
| `/usr/lib/herta-bin/resources` | application payload |
| `/usr/share/applications/herta.desktop` | desktop entry |

Upstream's LICENSE excludes character artwork, canon text and the voice clips
from the MIT grant (they are fan content). This package does not redistribute
any of it: `makepkg` fetches the AppImage from the project's own release page.

## Automation

[`.github/workflows/aur-update.yml`](.github/workflows/aur-update.yml) runs
daily, and on demand from the Actions tab:

1. reads the newest [upstream release](https://github.com/PersonaCLI/Herta/releases)
   and the sha256 of `Herta-x86_64.AppImage` from the release asset digest;
2. if the version or the checksum moved, rewrites `pkgver`, `pkgrel` and
   `sha256sums` — an AppImage re-released under the same version bumps `pkgrel`
   instead;
3. builds the package in an `archlinux:base-devel` container, so a release that
   no longer packages cleanly is never published;
4. regenerates `.SRCINFO`, commits to this mirror and pushes to the AUR.

It needs the `AUR_SSH_PRIVATE_KEY` repository secret: the private key registered
to the AUR account. Run the workflow by hand with `dry_run` to check a release
without publishing it.

## Remotes

`origin` is this GitHub mirror; `aur` is `ssh://aur@aur.archlinux.org/herta-bin.git`.

The AUR repository holds the package files only — the workflow pushes a commit
whose tree is this one **minus `.github/`**, so the CI plumbing never lands
there. Do not push `master` straight to the AUR; either let the workflow run,
or reproduce its push:

```sh
git fetch aur master
tree=$(git ls-tree "$(git rev-parse 'HEAD^{tree}')" | sed $'/\t\.github$/d' | git mktree)
commit=$(git commit-tree "$tree" -p "$(git rev-parse FETCH_HEAD)" -m "herta-bin <version>")
git push aur "$commit:refs/heads/master"
```

A plain `git push origin master` is still the way to update this mirror.
