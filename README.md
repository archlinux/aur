# ffmpeg-cuda-full

FFmpeg with CUDA/NVENC hardware acceleration and **all** codecs including
nonfree libfdk-aac. Each package release is pinned to a signed upstream FFmpeg
release so its AUR metadata, source, and binary ABI remain in sync.

## Features

- Full NVIDIA CUDA/NVENC/NVDEC/CUVID hardware acceleration
- Nonfree codecs: libfdk-aac (Fraunhofer AAC)
- GPL codecs: x264, x265, xvidcore, vid.stab
- 55+ libraries enabled (AV1, VP9, Opus, Vulkan, OpenCL, etc.)
- Built with `-O3 -march=native` for maximum performance on your CPU
- Parallelism controlled by makepkg's `MAKEFLAGS`

## Install

**Recommended** (handles conflicts automatically):
```bash
paru --combinedupgrade -S ffmpeg-cuda-full
```

**Manual build:**
```bash
git clone https://aur.archlinux.org/ffmpeg-cuda-full.git
cd ffmpeg-cuda-full
makepkg -si
```

Confirm pacman's prompt to remove the conflicting stock `ffmpeg` package.

When Arch rebuilds packages for a new FFmpeg ABI, upgrade this package and its
repository consumers in one transaction:

```bash
paru --combinedupgrade -Syu ffmpeg-cuda-full
```

For a manual atomic upgrade, build against the current repository state in a
clean chroot with `devtools`, then expose that archive through a temporary local
repository so pacman can resolve it together with the repository packages:

```bash
pkgctl build --clean
tmp_dir=$(mktemp -d)
chmod 0755 "$tmp_dir"
cp ./ffmpeg-cuda-full-*.pkg.tar.zst "$tmp_dir/"
repo-add "$tmp_dir/ffmpeg-cuda-full-local.db.tar.zst" \
  "$tmp_dir"/ffmpeg-cuda-full-*.pkg.tar.zst
cp /etc/pacman.conf "$tmp_dir/pacman.conf"
printf '\n[ffmpeg-cuda-full-local]\nSigLevel = Optional TrustAll\nServer = file://%s\n' \
  "$tmp_dir" >> "$tmp_dir/pacman.conf"
sudo pacman --config "$tmp_dir/pacman.conf" -Syu ffmpeg-cuda-full
```

> **Note:** This package provides an alternative to and conflicts with the stock
> `ffmpeg` package.
> Confirm pacman's conflict prompt during an interactive install, or use an AUR
> helper such as `yay` or `paru`.

## Requirements

- NVIDIA GPU with proprietary drivers (`nvidia-utils`)
- CUDA toolkit (`cuda`)
