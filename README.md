# LibreWolf-HellFire

LibreWolf with HellFire performance optimizations - a privacy-focused Firefox fork with extreme performance tuning.

## Performance Optimizations

This package combines LibreWolf's privacy features with HellFire's aggressive performance optimizations:

- **-O3 optimization level** instead of standard -O2
- **Full LTO (Link Time Optimization)** for maximum performance
- **x86-64-v3 CPU targeting** with modern instruction sets:
  - AVX2, AES, SSE4.2, BMI, BMI2, FMA, LZCNT, POPCNT
- **Rust SIMD optimizations** and WebAssembly AVX support
- **Profile Guided Optimization (PGO)** for real-world performance
- **Parallel build optimization** using all CPU cores
- **Disabled debug components** for maximum performance

## Installation

Install from AUR:
```bash
yay -S librewolf-hellfire
```

Or build manually:
```bash
git clone https://aur.archlinux.org/librewolf-hellfire.git
cd librewolf-hellfire
makepkg -si
```

## Build Requirements

- Modern x86_64 CPU supporting at least x86-64-v3 instruction set
- Minimum 8GB RAM (16GB recommended for comfortable building)
- 20GB+ free disk space
- 2+ hours build time depending on system

## Conflicts

This package conflicts with and provides `librewolf` - it will replace any existing LibreWolf installation.

## Based On

- [LibreWolf](https://librewolf.net/) - Privacy-focused Firefox fork
- [HellFire](https://github.com/CYFARE/HellFire) - Performance optimizations
- Original LibreWolf AUR package by ohfp/lsf

## License

MPL-2.0 (same as Firefox/LibreWolf)