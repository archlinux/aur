# ty-bin

> **An extremely fast Python type checker and language server — by [Astral](https://astral.sh).**
> Same `ty`. Just the upstream binary, for Arch users whose `extra/ty` won't even start.

```sh
paru -S ty-bin      # or yay -S ty-bin
```

---

## Why this package exists

`extra/ty` from the official Arch repositories **crashes at startup** on
aarch64 systems with a **16 KiB memory page size**, including:

- Asahi Linux on Apple Silicon
- Ampere Altra / AltraMax servers (Oracle Cloud A1, Hetzner CAX, etc.)
- AWS Graviton with `CONFIG_ARM64_16K_PAGES`
- Some Raspberry Pi 5 / Pi 4 kernels built for 16K pages

The reason: ty links **jemalloc**, and the Arch build was compiled assuming
**4 KiB pages**. On a 16 KiB host, jemalloc aborts before `main()` ever runs.

```
<jemalloc>: Unsupported system page size
```

Astral's upstream binary compiles jemalloc with `--with-lg-page=16` (64 KiB),
which works on **4 K, 16 K, and 64 K** page systems alike. This package
installs **exactly that binary** — byte-for-byte what Astral publishes on
GitHub Releases — and declares `provides=('ty')` / `conflicts=('ty')` so
pacman cleanly swaps `extra/ty` out for you.

## Install

```sh
paru -S ty-bin      # or: yay -S ty-bin
```

If `extra/ty` is already installed, pacman will offer to replace it. After
install:

```sh
ty --version        # ty 0.0.70
```

## Supported architectures

| Arch       | Linux flavor        | 16 K page safe? |
|------------|---------------------|:---------------:|
| `x86_64`   | glibc               |       N/A       |
| `aarch64`  | glibc               |       Yes       |
| `armv7h`   | glibc, hardfloat    |       N/A       |

Shell completions for **bash**, **zsh**, and **fish** are installed automatically.

## When you should NOT use this

If you're on `x86_64`, or on `aarch64` with a stock **4 K-page** kernel,
`extra/ty` works perfectly fine and tracks Arch's release cadence closely.
Use `ty-bin` only when you actually need the page-size workaround, or want
the upstream binary verbatim.

## Verifying authenticity

All `sha256sums` in the PKGBUILD match the per-asset `*.sha256` sidecars
Astral publishes alongside the release. You can also verify with GitHub
Artifact Attestations:

```sh
gh attestation verify ty-x86_64-unknown-linux-gnu.tar.gz --repo astral-sh/ty
```

## Upstream

- Project: <https://github.com/astral-sh/ty>
- Docs: <https://docs.astral.sh/ty/>
- License: MIT, © Astral Software Inc.
