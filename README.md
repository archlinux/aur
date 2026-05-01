# cef-vaapi

Arch Linux [CEF](https://chromiumembedded.github.io/cef) package rebuilt with VAAPI hardware video decode enabled, while preserving proprietary codec support (H.264, AAC, HEVC).

This repository manages both AUR packages:

| Package | Use when |
|---|---|
| [`cef-vaapi-bin`](https://aur.archlinux.org/packages/cef-vaapi-bin) | You want the prebuilt binary and do not want to compile Chromium/CEF locally. |
| [`cef-vaapi`](https://aur.archlinux.org/packages/cef-vaapi) | You want to build from source yourself, audit the source package, or avoid third-party binaries. |

## What this is

The official Arch [`cef`](https://archlinux.org/packages/extra/x86_64/cef/) package builds CEF with `use_vaapi=false`. This package is identical to Arch's except for the smallest possible delta:

- `use_vaapi=true` — enables AMD VCN / Intel VAAPI hardware video decode
- Package rename + metadata (`provides`, `conflicts`, `optdepends`)
- Explicit `libva` runtime dependency + driver notes
- Build-time guardrails that fail if required flags drift

Everything else — proprietary codecs, bundled ffmpeg, PipeWire, PulseAudio, build flags, patches — matches Arch's `cef` package as closely as possible.

## Install the prebuilt binary

Use `cef-vaapi-bin` for a fast install:

```bash
yay -S cef-vaapi-bin
```

`cef-vaapi-bin` downloads the binary package from this repository's GitHub Releases. Releases are kept for history, while the AUR `cef-vaapi-bin` package tracks the latest committed Arch CEF sync.

## Build locally from source

Use `cef-vaapi` if you want to build CEF yourself:

```bash
yay -S cef-vaapi
```

Or build manually from the AUR source repository:

```bash
git clone https://aur.archlinux.org/cef-vaapi.git
cd cef-vaapi
makepkg -s
```

This will take several hours and requires substantial CPU, RAM, and disk space.

To verify VAAPI was compiled in after building or installing:

```bash
strings /usr/lib/cef/libcef.so | grep -E 'vaCreateContext|VaapiVideoDecoder::|libva\.so'
```

## How updates work

When Arch updates its official `cef` package:

1. `sync-arch-cef.yml` checks Arch packaging and opens/updates a pull request.
2. The PR runs `scripts/update-from-arch-cef.sh`, which re-fetches Arch packaging and reapplies the `cef-vaapi` delta.
3. After review and merge to `main`, `aur.yml` publishes the committed source package to AUR as `cef-vaapi`.
4. The same committed source state triggers `build-vaapi.yml`, which builds on the trusted self-hosted runner, verifies VAAPI symbols in `libcef.so`, creates a GitHub Release, and publishes `cef-vaapi-bin` to AUR.

Scheduled sync jobs do not publish uncommitted generated package state. The source package in the repository root is the canonical input for both AUR packages.

## AUR package identity

| Field | `cef-vaapi` | `cef-vaapi-bin` |
|-------|-------------|-----------------|
| Type | Source package | Binary package |
| Provides | `cef=$pkgver` | `cef=$pkgver` |
| Conflicts | `cef` | `cef` |
| Replaces | none | none |
| License | `BSD-3-Clause` (CEF upstream) | `BSD-3-Clause` (CEF upstream) |
| Repository license | MIT (scripts, docs, workflows) | MIT (scripts, docs, workflows) |

## License

- Repository scripts, documentation, and workflow files: MIT — see `LICENSE`
- Upstream Arch packaging metadata copied from Arch Linux: ISC — see `LICENSE.ARCH-ISC`
- CEF framework itself: BSD-3-Clause — declared in PKGBUILD `license=('BSD-3-Clause')`
