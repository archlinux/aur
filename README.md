# vulkan-ai-terakan

Arch Linux packaging for an updated and enhanced fork of the experimental Mesa
Terakan Vulkan driver for AMD TeraScale GPUs. It tracks the maintained
`Terakan_state_rework` branch and deliberately does not replace the system
OpenGL stack.

The split package base produces:

- `vulkan-ai-terakan`: 64-bit Vulkan ICD and launch wrappers;
- `lib32-vulkan-ai-terakan`: 32-bit ICD for Wine and Steam.

## Source and package version

This is a live VCS recipe even though the requested package name has no
`-git` suffix. The source is not pinned to a tag or commit. Every new
`makepkg` or AUR-helper build updates the Git checkout from
`Terakan_state_rework`, checks out its latest commit, and derives `pkgver`
from Mesa's version, the Git revision count, and the commit hash.

The `pkgver` written in the AUR recipe is only a bootstrap value required by
`makepkg`; it is replaced automatically during every build. Consequently, a
fresh install or an explicitly requested rebuild does not require a PKGBUILD
version bump in AUR.

Because the package deliberately does not use the conventional `-git` suffix,
some AUR helpers may not classify it as a development package during a normal
system upgrade. Rebuilding `vulkan-ai-terakan` explicitly always fetches the
latest GitHub revision.

## Build

```bash
sudo pacman -S --needed base-devel git meson ninja pkgconf vulkan-headers \
  wayland-protocols spirv-tools systemd-libs xcb-util-keysyms \
  lib32-gcc-libs lib32-libdrm lib32-libx11 lib32-libxcb \
  lib32-libxshmfence lib32-spirv-tools lib32-systemd \
  lib32-vulkan-icd-loader lib32-wayland lib32-xcb-util-keysyms \
  lib32-zlib lib32-zstd

makepkg --cleanbuild --syncdeps --force
```

To package the current local Mesa working tree, including uncommitted changes:

```bash
./build-local.sh --syncdeps
```

The script creates an isolated Git snapshot under `.makepkg/`; it never resets
or modifies the source working tree. Packages are written to `packages/`.

Install both packages for 64-bit games and Wine:

```bash
sudo pacman -U \
  packages/vulkan-ai-terakan-*.pkg.tar.zst \
  packages/lib32-vulkan-ai-terakan-*.pkg.tar.zst
```

For a regular `makepkg` build, omit the `packages/` prefix.

No initramfs rebuild or reboot is required. CAICOS uses the kernel `radeon`
driver already; this package only installs Vulkan userspace ICDs.

## Run and test

```bash
terakan-vulkan vulkaninfo --summary
terakan-vulkan vkcube
terakan-wine wine /path/to/game.exe
terakan-test-capabilities
```

The wrappers only select Terakan ICD manifests. They do not force WineD3D,
alter DXVK DLL overrides, enable debug flags, or claim unsupported OpenGL
features.

## AUR publication

The AUR package base is `vulkan-ai-terakan`. Publish the contents
of this repository root to the package's AUR Git repository. `PKGBUILD`,
`.SRCINFO`, the install script, wrappers, test helper, and this README are all
required source files.

Before every AUR push:

```bash
makepkg --printsrcinfo > .SRCINFO
namcap PKGBUILD
makepkg --cleanbuild --syncdeps
namcap ./*.pkg.tar.zst
```

Terakan is experimental and not a conformant Vulkan implementation.
