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

### Optional compiler cache

With `sccache` installed, opt in with `CEF_VAAPI_SCCACHE=1 makepkg -s`.
The CI workflow enables this explicitly, starts the server before makepkg, and
prints statistics even if compilation fails. It uses the persistent
`SCCACHE_DIR=/cache/sccache` with `SCCACHE_CACHE_SIZE=100G`; these job environment
variables are inherited by direct, non-sudo makepkg invocations. An enabled
build fails if sccache is missing rather than silently compiling uncached.

CEF receives `cc_wrapper="sccache"` through `GN_DEFINES`, with remote execution
disabled (incompatible with the wrapper) and absolute debug compilation paths
stripped. In this Chromium version the latter uses `-ffile-compilation-dir=.`;
source paths are relative to the output directory. This improves reuse across
checkout paths but does not guarantee identical keys: changed compiler versions,
flags, generated headers, or Chromium versions can substantially reduce hits.
The cache covers C/C++ compilation, not linking or Rust. Chromium runs rustc
through its own GN/Python wrapper, not Cargo, so setting `RUSTC_WRAPPER` alone
would not enable Rust caching here.

On the first CI run, check `out/Release_GN_x64/args.gn` for the wrapper and the
corresponding `toolchain.ninja` compile commands for `sccache clang`. The final
statistics should show nonzero compile requests and cache writes; a cold cache
will mostly miss. Recompiling unchanged objects (rather than a ninja no-op)
should produce hits. Check non-cacheable reasons if requests are present but
nothing is cached, and confirm `/cache/sccache` remains writable and populated.

A small runner smoke test, without fetching Chromium:

```bash
# Run in a scratch directory with sccache and clang on PATH.
export SCCACHE_DIR="$PWD/cache" SCCACHE_CACHE_SIZE=100M
sccache --start-server
sccache --zero-stats
printf 'int answer(void) { return 42; }\n' > test.c
sccache clang -c test.c -o test.o -O2 -g -ffile-compilation-dir=.
sccache clang -c test.c -o test.o -O2 -g -ffile-compilation-dir=.
sccache --show-stats  # Expect two requests, one miss and one hit on a fresh cache.
```

To verify VAAPI was compiled in after building or installing:

```bash
strings /usr/lib/cef/libcef.so | grep -E 'vaCreateContext|VaapiVideoDecoder::|libva\.so'
```

## How updates work

When Arch updates its official `cef` package:

1. `sync-arch-cef.yml` checks Arch packaging and runs `scripts/update-from-arch-cef.sh` when a newer version exists.
2. The sync workflow validates the generated package state, commits it directly to `main`, and dispatches the publish/build workflows.
3. `aur.yml` publishes the committed source package to AUR as `cef-vaapi`.
4. `build-vaapi.yml` installs required build dependencies, builds on the trusted self-hosted runner, verifies VAAPI symbols in `libcef.so`, creates a GitHub Release, and publishes `cef-vaapi-bin` to AUR.

Scheduled sync jobs only publish committed generated package state. The source package in the repository root is the canonical input for both AUR packages.

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
