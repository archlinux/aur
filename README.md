# codebuddy-cn-ide (AUR)

腾讯 CodeBuddy IDE CN 在 Linux 上的非官方自动化打包脚本。

This is the AUR git repository (`ssh://aur@aur.archlinux.org/codebuddy-cn-ide.git`)
that hosts the `PKGBUILD` and `.SRCINFO`. Helper conversion scripts live
in a separate GitHub repository:

  https://github.com/JipZeonGit/codebuddy-ide-cn-linux


## What this package does

At install time the package recipe:

1. Downloads the official **macOS** Intel-x64 DMG of Tencent CodeBuddy
   IDE CN directly from Tencent's CDN to the user's own machine.
2. Extracts the JavaScript / Electron payload from the DMG.
3. Fetches a Linux Electron runtime of the matching version.
4. Rebuilds the bundled native modules against that runtime.
5. Installs the result under `/opt/codebuddy-cn-ide/`, with a
   `/usr/bin/codebuddy-cn-ide` launcher and a system-wide
   `.desktop` entry.

No proprietary Tencent binary is shipped by this AUR repository or
its helper repository. Every install pulls the original bytes from
Tencent's own URL.


## Disclaimer

Unofficial community packaging. **Not affiliated with Tencent.**

The packaging recipe is MIT-licensed. The installed Tencent CodeBuddy
IDE binaries remain governed by Tencent's proprietary license. See
`/usr/share/licenses/codebuddy-cn-ide/` after install.


## Build requirements

- A network connection during build. Native module rebuilds fetch
  source tarballs from the npm registry and Electron headers from
  Electron's mirror. **Clean chroot builds (`extra-x86_64-build`)
  will not work** because the chroot has no network.
- ≥ 4 GB of free space in `~/.cache/yay/codebuddy-cn-ide/` (or
  wherever your AUR helper builds). The DMG is ~180 MB; intermediate
  npm and Electron caches add up.
- Linux x86_64. arm64 is not supported by upstream.


## Bumping versions

When upstream releases a new build:

1. Find the new DMG URL on the official download page and identify
   its dotted version (e.g. `4.9.10.x` part) and its build-id suffix
   (e.g. the `19255a94`-style hex).
2. Update `pkgver` and `_dmg_buildid` in `PKGBUILD`.
3. Optionally bump `_helper_commit` to a fresh helper-repo commit if
   the conversion logic changed.
4. Recompute checksums:

   ```bash
   updpkgsums
   ```

5. Regenerate `.SRCINFO`:

   ```bash
   makepkg --printsrcinfo > .SRCINFO
   ```

6. Test locally with `makepkg -f`. Optionally `namcap PKGBUILD` and
   `namcap *.pkg.tar.zst`.

7. Commit and push:

   ```bash
   git add PKGBUILD .SRCINFO
   git commit -m 'Update to <version>'
   git push
   ```


## Local development tips

To avoid re-downloading the 180 MB DMG and 100 MB Electron zip on
every clean rebuild, drop them next to `PKGBUILD` (the names must
match `source=()` exactly):

```
codebuddy-cn-ide/
├── PKGBUILD
├── CodeBuddy-darwin-x64-<pkgver>-<buildid>-cn.dmg
├── codebuddy-ide-cn-linux-<commit>.tar.gz
└── electron-v<elver>-linux-x64.zip
```

makepkg verifies them via `sha256sums=()` and skips downloading.
These files are in `.gitignore` so they will not be committed.
