# fex-emu-wine-git

FEX-Emu DLLs for enabling Wine's ARM64EC support on Arch Linux ARM.

## Description

This package provides the FEX-Emu Windows DLLs required for Wine's ARM64EC support. These DLLs enable running Windows x86 and x86_64 applications on ARM64 Linux systems through Wine.

## What is FEX-Emu?

FEX-Emu is a fast usermode x86 and x86-64 emulator for ARM64 Linux. This package builds the Windows-side DLLs that integrate with Wine to provide ARM64EC compatibility.

## Features

- Builds libarm64ecfex.dll for ARM64EC support
- Builds libwow64fex.dll for WOW64 support
- Uses LLVM-MinGW for cross-compilation
- Optimized for performance with static linking

## Installation

```bash
cd fex-emu-wine-git
makepkg -si
```

## Dependencies

This package is a dependency for `wine-arm64ec-git` and should be installed before Wine.

## Build Details

- Compiles from FEX-Emu git source
- Uses LLVM-MinGW 20250920 toolchain
- Builds both ARM64EC and WOW64 variants
- Bundles required external libraries (Catch2, fmt, xxHash, etc.)

## Integration with Wine

The DLLs are installed to `/usr/lib/wine/aarch64-windows/` where Wine can automatically find and use them for ARM64EC emulation.

## Notes

- Only for aarch64 architecture
- Requires LLVM/Clang for building
- Build time can be significant due to bundled dependencies

## Credits

- FEX-Emu project: https://fex-emu.com
- Based on Fedora packaging by lacamar: https://github.com/lacamar/wine-arm64ec-rpm
- LLVM-MinGW by bylaws: https://github.com/bylaws/llvm-mingw

## License

FEX-Emu is licensed under MIT, with bundled libraries under various licenses (Apache-2.0, BSD-3-Clause, GPL-2.0-only).
