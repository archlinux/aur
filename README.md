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

The [official download page](https://delta.dev/download) requests:

```text
https://delta.dev/api/releases/stable/latest/asset?asset=delta&os=linux&arch=x86_64
https://delta.dev/api/releases/stable/latest/asset?asset=delta&os=linux&arch=aarch64
```

Those endpoints return Cloudflare R2 URLs that expire after 15 minutes.
Unsigned object requests and directory listings require authorization.
For release `0.18.0`, both website downloads were compared byte-for-byte
with the archives published in the official
[delta-nix releases](https://github.com/zed-industries/delta-nix/releases/tag/v0.18.0).
They are identical, ordinary Linux binaries, not Nix-patched binaries.
The `PKGBUILD` therefore uses the permanent, versioned GitHub URLs and
upstream SHA-256 checksums.

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
makepkg --verifysource --force
makepkg --cleanbuild --force
namcap PKGBUILD
namcap zed-delta-bin-0.18.0-1-x86_64.pkg.tar.zst
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

The upstream `0.18.0` archive's CLI reports `0.17.0`; the GUI and archive
release are `0.18.0`, so the package version follows the published release.
