# tokenuze-bin

Arch Linux AUR packaging for the prebuilt `tokenuze` CLI release.

Upstream `tokenuze` summarizes token and cost usage across different LLM providers. This repo packages the published Linux binary for Arch users who want an AUR install instead of downloading releases manually.

## How It Works

The `PKGBUILD` downloads the upstream `tokenuze-linux-x86_64.tar.gz` release asset and installs the extracted binary to `/usr/bin/tokenuze`.

## Install locally

```bash
makepkg -si
```

## Notes

- Packaging-only repository: the upstream app source is not in this repo.
- Declares `provides=(tokenuze)` and `conflicts=(tokenuze)`.
- `sqlite` is an optional dependency for some providers.
- Current packaged version is `0.9.2-1`.
