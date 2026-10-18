# helium-widevine

Widevine CDM repackaged for [Helium Browser](https://github.com/imperatormk/helium-browser)
on Arch Linux (x86_64).

Helium ships **without** Widevine, so DRM content (Netflix, Spotify Web Player,
Hulu, Bitmovin test streams, etc.) fails until a CDM is installed to
`/opt/helium-browser-bin/WidevineCdm/`. This package downloads the official
Google Widevine Chrome Component at build time and installs it there — the
same approach as AUR `chromium-widevine`, just pointed at Helium's paths.

- Current Widevine: `4.10.3050.0`
- Helium tested: `0.19.4.1` (Chromium `155`)
- Forked from [mary-ext/helium-widevine](https://github.com/mary-ext/helium-widevine)

## Install

Requires `helium-browser-bin` and a full build environment (`base-devel`).

```bash
# from this repo
makepkg -si
# or, once submitted to the AUR, with your helper:
# paru -S helium-widevine
```

Then **fully restart Helium** (not just reload a tab).

## Verify it works

1. Open `helium://components` → `WidevineCdm` should list `4.10.3050.0`.
2. Play a DRM test stream, e.g. https://bitmovin.com/demos/drm.
3. Then try your real target (Netflix / Spotify / etc.).

If the version in `helium://components` is stale, quit every Helium process
(`pkill helium`) and start it again.

## What gets installed

| File | Destination |
|---|---|
| `libwidevinecdm.so` | `/opt/helium-browser-bin/WidevineCdm/_platform_specific/linux_x64/` |
| `manifest.json` | `/opt/helium-browser-bin/WidevineCdm/` |
| `LICENSE` (Google's) | `/opt/helium-browser-bin/WidevineCdm/` + `/usr/share/licenses/helium-widevine/` |
| compat symlink | `/opt/helium-browser-bin/libwidevinecdm.so` |

The binary is **not** stored in this repo — `makepkg` fetches the `.crx3`
from `dl.google.com` and verifies its `sha256sums` (see `PKGBUILD`).

## Updating

Widevine versions rotate a few times a year and old ones get revoked. To bump:

1. Check AUR `chromium-widevine` for the newest `pkgver`, `_release_id`,
   `_file_id`, and `sha256sums`.
2. Copy those into `PKGBUILD`, run `makepkg -f`, install, and re-verify
   with the steps above.

## Legal

The `PKGBUILD` and docs here are 0BSD (see `LICENSE.md`). The Widevine CDM
itself is proprietary Google software (`license=('custom')`) and is **never
redistributed by this repo** — only downloaded from Google on your machine
at build time. Do not publish built packages containing `libwidevinecdm.so`.
Use is subject to Google's/Widevine's terms. Not affiliated with Google or
Helium. This is not legal advice.
