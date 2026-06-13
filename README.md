# Terakan Vulkan Driver

Vulkan 1.0 and OpenGL (r600) for AMD TeraScale GPUs (HD 2000-7000, non-GCN).

## 64-bit Vulkan

```bash
terakan-vulkan-setup vulkaninfo
```

## Wine / Proton (64-bit)

```bash
terakan-dx-setup wine your_game.exe
```

## Wine (32-bit prefix)

```bash
terakan-vulkan32-setup wine your_32bit_game.exe
```

## OpenGL (Mesa r600 in /usr/local)

```bash
export LIBGL_DRIVERS_PATH=/usr/local/lib/dri
export LD_LIBRARY_PATH=/usr/local/lib${LD_LIBRARY_PATH:+:$LD_LIBRARY_PATH}
glxinfo | grep OpenGL
```

After install: `sudo mkinitcpio -P` and reboot.
