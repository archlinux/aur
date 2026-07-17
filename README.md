# jaclang-git (AUR)

`jaclang-git` builds the self-contained native **`jac`** binary from the latest
git HEAD of [jaseci-labs/jaseci](https://github.com/jaseci-labs/jaseci).

It is the from-source counterpart to upstream's one-liner installer
(`scripts/install.sh`), which ships the prebuilt release binary. This package
clones the source and runs the documented upstream build (`cd jac && zig build`)
to produce the very same binary.

## What it installs

A single executable at `/usr/bin/jac`. The binary bundles its own private CPython
runtime (materialized into `~/.cache/jac/rt/<hash>/` on first run), so it needs
**no system Python, pip, uv, or llvmlite** — only glibc.

## Build requirements

- `zig >= 0.16.0` (pinned in `jac/build.zig.zon`)
- `base-devel`, `git`, `cmake`
- **~10 GB free disk** during build
- **Network access during build** — the build fetches:
  - a pinned LLVM 22.1.x slice (~80 MB) via `zig build fetch-llvm` (builds the
    `LLVMPY_*` shim that the default release binary requires)
  - a python-build-standalone tree (~600 MB download + extract)
  - typeshed stdlib stubs
  - zig dependencies (the fused neovim editor fork, mini.nvim, tree-sitter-jac)

A full build takes ~15-20 min. The LLVM + pbs trees are cached in your zig global
cache, so rebuilds after a `pkgver` bump are much faster.

## Lighter build (no editor)

The default build fuses a neovim fork (the `jac ninja` editor). To build a
smaller, faster binary without it, edit `build()` in `PKGBUILD` to use:

```
zig build -Dno-ninja
```

## Notes

- `options=('!strip')` is **mandatory** — the binary layout is
  `[ELF stub][runtime payload .tar.gz][80-byte trailer]`, and makepkg's default
  `strip` would drop the appended payload and break the binary.
- Conflicts with / provides `jac` and `jaclang`.
- The repo's git tags track the jaseci release (`v2.3.x`); the `jac` binary
  reports its own version (`0.30.x`) via `jac --version`.

## Build & install

```
makepkg -si
```
