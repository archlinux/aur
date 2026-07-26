# vulkan-terakan

Arch Linux packaging for the experimental Mesa Terakan Vulkan driver for
AMD TeraScale GPUs. It deliberately does not replace the system OpenGL stack.

## Build

```bash
sudo pacman -S --needed base-devel git meson ninja vulkan-headers \
  wayland-protocols spirv-tools systemd-libs xcb-util-keysyms \
  lib32-gcc-libs lib32-libdrm lib32-libx11 lib32-libxcb \
  lib32-libxshmfence lib32-spirv-tools lib32-systemd \
  lib32-vulkan-icd-loader lib32-wayland lib32-xcb-util-keysyms lib32-zstd

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
  packages/vulkan-terakan-*.pkg.tar.zst \
  packages/lib32-vulkan-terakan-*.pkg.tar.zst
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

## Package contents

- `vulkan-terakan`: 64-bit ICD and deterministic launch wrappers.
- `lib32-vulkan-terakan`: 32-bit ICD used by 32-bit Wine processes.

Terakan is experimental and not a conformant Vulkan implementation.
