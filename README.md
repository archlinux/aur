# ffmpeg-cuda-full

Latest FFmpeg with CUDA/NVENC hardware acceleration and **all** codecs
including nonfree (libfdk-aac). Dynamically tracks upstream releases —
always builds the newest stable FFmpeg.

## Features

- Full NVIDIA CUDA/NVENC/NVDEC/CUVID hardware acceleration
- Nonfree codecs: libfdk-aac (Fraunhofer AAC)
- GPL codecs: x264, x265, xvidcore, vid.stab
- 55+ libraries enabled (AV1, VP9, Opus, Vulkan, OpenCL, etc.)
- Built with `-O3 -march=native` for maximum performance on your CPU
- Parallel build using all CPU threads

## Install

**Recommended** (handles conflicts automatically):
```bash
yay -S ffmpeg-cuda-full
# or
paru -S ffmpeg-cuda-full
```

**Manual build:**
```bash
git clone https://aur.archlinux.org/ffmpeg-cuda-full.git
cd ffmpeg-cuda-full
makepkg -si --noconfirm
```

> **Note:** This package replaces the stock `ffmpeg` package.
> Use `--noconfirm` with `makepkg -si` to allow automatic replacement,
> or use an AUR helper like `yay`/`paru` which handles it for you.

## Requirements

- NVIDIA GPU with proprietary drivers (`nvidia-utils`)
- CUDA toolkit (`cuda`)
