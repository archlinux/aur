# cef-vaapi

Arch Linux [CEF](https://chromiumembedded.github.io/cef) package rebuilt with VAAPI hardware video decode enabled, while preserving proprietary codec support (H.264, AAC, HEVC).

## What this is

The official Arch [`cef`](https://archlinux.org/packages/extra/x86_64/cef/) package builds CEF with `use_vaapi=false`. This package is identical to Arch's except for the smallest possible delta:

- `use_vaapi=true` — enables AMD VCN / Intel VAAPI hardware video decode
- Package rename + metadata (`provides`, `conflicts`, `optdepends`)
- Explicit `libva` runtime dependency + driver notes
- Build-time guardrails that fail if required flags drift

Everything else — proprietary codecs, bundled ffmpeg, PipeWire, PulseAudio, build flags, patches — matches Arch's `cef` exactly.

## Why you might want this

If you use a CEF-based application (like [Dumber](https://github.com/bnema/dumber)) on AMD or Intel hardware with Wayland, the stock Arch CEF falls back to software video decode. Enabling `use_vaapi=true` restores VCN hardware decode on AMD GPUs.

## Why you might NOT want this

- **This is a source package.** Building CEF from source takes several hours and requires 25+ GB of RAM and over 100 GB of free disk space.
- If you don't need VAAPI video decode in CEF, stick with the official Arch `cef`.
- If you need VAAPI in Chromium itself, use Arch's `chromium` or `ungoogled-chromium` packages instead.

## Validation evidence

Tested locally with [Dumber](https://github.com/bnema/dumber) on Arch Linux / AMD RX 7900 GRE (RDNA3) / Wayland:

- Custom `libcef.so` maps VAAPI symbols (`vaCreateContext`, `VaapiVideoDecoder::Decode`, `libva.so`)
- `amdgpu_top` shows VCN activity during YouTube playback: MediaEngine ~14% avg, VCN_Unified ~13%
- Dumber GPU process attributed non-zero Media/VCN usage
- Proprietary codecs still present and functional

Full details in the [design spec](https://github.com/bnema/cef-vaapi/blob/main/SPEC.md).

## What's NOT included

VAAPI hardware video decode in CEF works with this package. However, a **separate accelerated-paint freeze issue** exists in Dumber's CEF OSR mode that this package does not address. See the [Dumber issue tracker](https://github.com/bnema/dumber/issues) for details.

## How to build

```bash
git clone https://aur.archlinux.org/cef-vaapi.git
cd cef-vaapi
makepkg -s
```

This will take several hours.

To verify VAAPI was compiled in after building:

```bash
strings /usr/lib/cef/libcef.so | grep -E 'vaCreateContext|VaapiVideoDecoder::|libva\.so'
```

## How it tracks Arch

When Arch updates its official `cef` package:

1. Run `scripts/update-from-arch-cef.sh` to re-fetch Arch's packaging and reapply the delta
2. Review the diff
3. Update `.SRCINFO` with `makepkg --printsrcinfo > .SRCINFO`
4. Commit and push

A GitHub Actions workflow automates this periodically.

## AUR package identity

| Field | Value |
|-------|-------|
| Package | `cef-vaapi` |
| Provides | `cef=$pkgver` |
| Conflicts | `cef` |
| License | `BSD-3-Clause` (CEF upstream) |
| Repository license | MIT (scripts, docs, workflows) |

## License

- Repository scripts, documentation, and workflow files: MIT — see `LICENSE`
- Upstream CEF packaging metadata (Arch Linux): ISC — see `LICENSE.CEF-BSD3`
- CEF framework itself: BSD-3-Clause — declared in PKGBUILD `license=('BSD-3-Clause')`
