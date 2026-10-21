# TraceDraw for Arch Linux (AUR)

`tracedraw-bin` installs the official prebuilt Linux binaries of TraceDraw,
an open-source vector illustration, page layout and print editor.

## Files

| File | What it is |
| --- | --- |
| `PKGBUILD` | The package recipe (source: the release tarball of the binaries). |
| `tracedraw-bin.install` | Icon cache and desktop database hooks. |
| `tracedraw.desktop` | Desktop entry, from `packaging/linux/tracedraw.desktop`. |
| `tracedraw-*.png` | Application icons, from `assets/icon/`. |
| `LICENSE-MIT` | The license of the program. |

## Build and install locally

```sh
git clone https://aur.archlinux.org/tracedraw-bin.git
cd tracedraw-bin
makepkg -si
```

`makepkg` downloads
`tracedraw-<version>-linux-x86_64.tar.gz` from the GitHub release page and
checks it against the SHA-256 sum in `PKGBUILD`. The package is `x86_64`
only, because that is the only Linux build upstream publishes.

## Publish to the AUR

Register an SSH key in the AUR account
(<https://aur.archlinux.org/account>, *Chave pública SSH*), then:

```sh
cd ~/Desenvolvimento/aur/tracedraw-bin
./publish.sh
```

The script refreshes `.SRCINFO`, commits and pushes to
`aur@aur.archlinux.org:tracedraw-bin.git`. The first push creates the
package base on the AUR. Two rules of the AUR matter here: the remote
user is `aur` (not `git`) and the branch is `master` (not `main`).

The key this machine offers to the AUR is:

```
ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIDQ4LE01itoZBCGYAfae9192Cy+U74joppxyLC6pNu6q aur-tracedraw
```


## Update to a new upstream release

Change `pkgver` and `pkgrel` in `PKGBUILD`, then update the checksum:

```sh
upstream_version=0.11.0
curl -sL "https://github.com/igtoth/tracedraw/releases/download/v${upstream_version}/tracedraw-${upstream_version}-linux-x86_64.tar.gz" \
  | sha256sum
```

The `sha256sums` line of the release on GitHub gives the same value
(`digest` field of the release asset in the GitHub API).

## Notes

- The binaries only link against the C library; X11, Wayland and OpenGL are
  loaded at run time, so the `depends` list is the set of libraries the
  program needs to open a window.
- `xdg-desktop-portal` is optional but recommended: without it the native
  file dialogs fall back to a built-in browser of the file system.
- The program is in alpha state, see the release notes for what to expect.

## Build from source instead

The package above uses the prebuilt binary, which upstream publishes for
`x86_64` only. On another architecture, or to build the current `main`,
build the program from the repository with Cargo (Rust 1.80 or newer):

```sh
git clone https://github.com/igtoth/tracedraw.git
cd tracedraw
cargo build --release -p tracedraw -p tracedraw-cli
install -Dm755 target/release/tracedraw /usr/local/bin/tracedraw
install -Dm755 target/release/tracedraw-cli /usr/local/bin/tracedraw-cli
```

The build needs `libxkbcommon`, Wayland and Mesa (OpenGL) development files.

