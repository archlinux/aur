# harbor-stremio-git AUR packaging

Testing AUR package for Harbor from upstream git.

The package builds Harbor with upstream's Linux system packaging config:

- `externalBin` is disabled for the Debian bundle used during packaging.
- Runtime media tools come from Arch packages: `ffmpeg` and `yt-dlp`.
- Bundled fonts are fetched during `prepare()` with `pnpm run setup:fonts`.

This keeps the downstream package aligned with upstream's source build while
avoiding bundled Linux sidecars.

## Versioning

`pkgver()` reads the app version from upstream `package.json`, then appends the
git revision count and short commit:

```text
0.9.4.r123.gabcdef0
```

For `-git` packages this is computed by `makepkg`; no GitHub workflow is needed
just to update the package version.

## Build

```bash
makepkg -si
```

Regenerate `.SRCINFO` before publishing to AUR:

```bash
makepkg --printsrcinfo > .SRCINFO
```
