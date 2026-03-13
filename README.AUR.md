lib32-nvidia-575xx-utils

Purpose:
- 32-bit userspace NVIDIA libraries matching the `nvidia-575xx-utils` package.

What this package does:
- installs the 32-bit OpenGL/Vulkan/NVML/CUDA userspace libraries into `/usr/lib32`
- provides `lib32-nvidia-utils`
- depends on `nvidia-575xx-utils=575.64.05`

Why it exists:
- there is no separate `lib32-nvidia-575xx-utils` package available in the standard repos
- this package fills that gap for systems pinned to the 575.xx legacy branch

Update workflow:
1. bump `pkgver`
2. update the NVIDIA download URL in `source`
3. update `sha256sums`
4. regenerate `.SRCINFO` with `makepkg --printsrcinfo > .SRCINFO`
5. commit and push to AUR
