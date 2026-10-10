# Delta for Arch Linux

`zed-delta-bin` packages Zed Industries' proprietary Delta Linux release for
`x86_64` and `aarch64`.

```sh
makepkg -si
```

The package exposes one command, `zed-delta`, and a desktop entry
launching `zed-delta open %U`. It can coexist with `git-delta`, which keeps
`/usr/bin/delta`. The desktop app needs a working Vulkan driver.

The vendor CLI (`delta`) and GUI backend (`delta-app`) retain their original
names under `/usr/lib/zed-delta/bin/` so their sibling lookup works. The backend
is not exposed as a second public command; use `zed-delta open` to launch
the GUI. Upstream's native installer likewise exposes only its CLI.
The package conflicts with the previous `delta-bin` package because they
share desktop-entry and icon files.

## Release sources

The `pkgver()` function queries the official stable release API:

```text
https://delta.dev/api/releases/stable/latest/asset?asset=delta&os=linux&arch=x86_64
```

This returns the current version and the download URL on `releases.delta.dev`
(Cloudflare R2). The `PKGBUILD` sources the tarballs directly from those
versioned R2 URLs, which are stable and permanent per release.
No upstream checksum manifest is published for these URLs, so `sha256sums`
uses `SKIP` for the arch-specific tarballs; integrity is enforced by HTTPS.

Running `makepkg -o` or any AUR helper will call `pkgver()` automatically
to pick up new releases without manual edits.

## Arch integration

Runtime dependencies cover the binaries' ELF requirements, dynamically
loaded Vulkan/EGL/Wayland libraries, fonts, TLS certificates, Git, and
URL opening. Arch supplies the XCB and xkb libraries. Only the required
x86_64 `libunwind.so.1` remains bundled. No ELF patching or
`LD_LIBRARY_PATH` override is used.

The shell launcher only sets upstream's `DELTA_UPDATE_EXPLANATION` to
disable self-updates, then executes the unchanged vendor CLI.
Updates should go through pacman/the package manager instead.

`LICENSE` is a checksummed plain-text snapshot of the upstream Early
Access Agreement, installed in `/usr/share/licenses/zed-delta-bin/`.
Delta remains proprietary; this build recipe does not grant permission
to redistribute its binaries. Review the agreement and
[Zed's terms](https://zed.dev/terms) before use or distribution.

## Validation and release status

```sh
makepkg -o          # run pkgver() to update version, then stop
makepkg --cleanbuild --force
namcap PKGBUILD
namcap zed-delta-bin-*.pkg.tar.zst
extra-x86_64-build
```

The recipe's `check()` validates the launcher syntax and rewritten desktop
entry. The devtools clean-chroot command requires sudo authentication.

Verified locally: archive/checksum equivalence with the website downloads,
x86_64 packaging, CLI execution, ELF dependency/symbol resolution, desktop
syntax, and public-command collision checks. This does not establish full
production readiness.

Still unverified: native GUI launch and deep-link delivery, clean-chroot
builds, and native ARM execution. ARM repacks were produced on x86_64, but
their cross-architecture `ldd` checks reported exit 159 and are not passing
runtime checks.

Before redistributing built packages, confirm upstream's redistribution
permission and the provenance/required notices for bundled `libunwind.so.1`.
No specific third-party license is inferred from its filename alone.

The package version follows the published GitHub release tag.
