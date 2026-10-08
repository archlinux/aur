# OpenResearch for Arch Linux

One split `PKGBUILD` packages alphaXiv's **0.2.17** release for `x86_64` and
`aarch64`. The version, release URLs, and SHA-256 hashes are pinned; there is no
moving Git checkout or automatic version discovery.

| Package | Contents | Launch |
| --- | --- | --- |
| `openresearch` | Desktop app compiled from the release source, using system GTK 3 and WebKitGTK 4.1 | `openresearch` or the application menu |
| `openresearch-cli` | Headless `orx` compiled from the release source | `orx` |
| `openresearch-bin` | Extracted upstream desktop AppImage with its bundled libraries | `openresearch` or the application menu |
| `openresearch-cli-bin` | Upstream static musl CLI | `orx` |

Choose one desktop variant and/or one CLI variant. Desktop and CLI packages can
coexist, including mixed source/binary choices. Alternatives for the same
component conflict with one another. The desktop contains its own backend and
does not require a separate CLI installation.

## Build and install

Install Arch's `base-devel` group, then build as an ordinary user:

```sh
makepkg -s
```

This single split build creates **all four packages**, including the source
builds, even when you only intend to install a binary variant. It therefore
requires the Rust and frontend build dependencies for every selection. Install
only your chosen variants; installing all four together would conflict.

For the upstream desktop and CLI on x86_64:

```sh
sudo pacman -U openresearch-bin-0.2.17-1-x86_64.pkg.tar.zst \
  openresearch-cli-bin-0.2.17-1-x86_64.pkg.tar.zst
```

For both source variants:

```sh
sudo pacman -U openresearch-0.2.17-1-x86_64.pkg.tar.zst \
  openresearch-cli-0.2.17-1-x86_64.pkg.tar.zst
```

Use `aarch64` filenames on ARM64 and build natively on that architecture.
`aarch64` support targets Arch Linux ARM; the official Arch distribution supports
x86_64. To reduce source build load, set `CARGO_BUILD_JOBS=2` and, if necessary,
`NODE_OPTIONS=--max-old-space-size=2048` when invoking `makepkg`.

## Packaging decisions

The binary desktop package extracts the SquashFS payload using `7zip`, without
executing either architecture's AppImage during packaging. It installs the
payload under `/opt/openresearch` and uses upstream's `AppRun.wrapped` launcher.
That launcher resolves the `/usr/bin/openresearch` symlink correctly, configures
the bundled GTK/WebKit libraries, and preserves the session environment for
programs opened by the app. Its AppImage identity variables are cleared so an
extracted, pacman-owned installation cannot identify itself as a self-updating
AppImage. Nested GTK and image-loader module runpaths are corrected to resolve
the bundled libraries instead of a host toolkit. FUSE is not needed. The upstream
binary uses X11 and needs XWayland in a Wayland session; the source variant uses
system GTK/WebKit instead. A `ttf-font` provider ensures that text can render even
on a minimal installation.

The CLI installer was inspected, not executed. For both Linux architectures it
installs only `orx`, with no libraries, aliases, or separate updater. Its shell
profile modifications, PATH helper files, and per-user cargo-dist receipt are
unnecessary for `/usr/bin/orx` and are omitted. The package installs upstream's
MIT license separately for every split package. The packaging files themselves
are licensed under 0BSD.

The source variants rebuild the frontend with the supplied pnpm lockfile, then
compile separate headless and desktop Rust binaries with the supplied Cargo
lockfile and Arch's system SQLite. Dependency downloads happen in `prepare()`;
Rust compilation uses `--frozen`. GCC LTO is disabled because Rust's LLVM linker
cannot consume GCC LTO objects from the native crypto dependency. The frontend
localization compiler also fetches upstream-configured plugins. Source builds
retain upstream's `development` build channel because
upstream reserves `production` for its official GitHub Actions builds.
Upstream's development channel also disables automatic installation or updating
of remote SSH hosts. Install `orx` on those hosts yourself, or choose the upstream
binary variants for that automatic remote-install workflow.

Update these packages through your AUR build and pacman workflow. They do not
create an installer receipt or enable AppImage self-updates. An existing
`~/.cargo/bin/orx` from the upstream installer can precede `/usr/bin/orx` in PATH;
check `command -v orx` if the reported version differs.

## Maintainer checks

```sh
bash -n PKGBUILD
makepkg --force --verifysource --nosign
makepkg --printsrcinfo > .SRCINFO
namcap PKGBUILD
makepkg -s
namcap ./*.pkg.tar.zst
git diff --check
```

Keep `.SRCINFO` synchronized with `PKGBUILD`. Verify both architectures' release
hashes against GitHub asset digests and the CLI checksum files. Before updating
the pinned version, inspect the installer, AppImage launcher, source build steps,
runtime dependencies, and upstream license again.

For the binary desktop, namcap's generic ELF placement rule flags `/opt`; that
location intentionally contains the complete upstream application bundle. Its
remaining upstream ELF hardening/unstripped warnings are not changed by
repackaging. The `ca-certificates` dependency supports native TLS trust and cannot
be inferred from ELF linkage. Runtime linkage and module resolution are checked
separately in a container without system GTK or WebKit.

Initial validation of `0.2.17-1` on 2026-10-08:

- Both architectures' release hashes passed `makepkg` verification and matched
  GitHub's asset digests; the CLI and source hashes also matched upstream's
  checksum files.
- All four x86_64 packages built in an official Arch container as an unprivileged
  user. Source desktop/CLI and binary desktop/CLI installation, reinstallation,
  file integrity, removal, and dynamic linkage were checked. Both desktop
  variants rendered their onboarding screen under Xvfb. The source CLI served
  the rebuilt frontend, including a byte-identical JavaScript asset.
- Both architectures' binary package functions were exercised. Each desktop
  preserves 515 AppImage entries, with the launcher change and 30 module runpath
  fixes checked separately. CLI payloads are byte-identical to upstream, and
  archive entries have root ownership. The ARM64 CLI passed version and help
  smoke tests under QEMU.
- Bash syntax, ShellCheck, desktop-file validation, `.SRCINFO` consistency for
  both architectures, and namcap review completed.

ARM64 source compilation and native desktop execution, native Wayland sessions,
and authenticated research/remote-compute workflows were not exercised.

Release assets: [alphaXiv/OpenResearch v0.2.17](https://github.com/alphaXiv/OpenResearch/releases/tag/v0.2.17).
Package conventions: [AUR submission guidelines](https://wiki.archlinux.org/title/AUR_submission_guidelines)
and [PKGBUILD manual](https://man.archlinux.org/man/PKGBUILD.5.en).
