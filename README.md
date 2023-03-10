# PKGBUILD for Linux kernel 5.15 on StarFive VisionFive 2

- Compatible for cross compile, run `CARCH=riscv64 makepkg`.

- Kernel source code from <https://github.com/starfive-tech/linux/>

- Config modified on top of <https://gitlab.manjaro.org/packages/core/linux515/>

- `CONFIG_USB_WIFI_ECR6600U` turned off temporarily, please compile the driver yourself.
