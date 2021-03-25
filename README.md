# linux-raspberrypi4-aarch64

`linux-raspberrypi4-aarch64` is an Arch Linux PKGBUILD script to build a 64-bit
kernel for the Raspberry Pi 4 from sources.

AUR:                 <https://aur.archlinux.org/linux-raspberrypi4-aarch64.git>

Repo:     <https://git.esotericnonsense.com/pub/linux-raspberrypi4-aarch64.git>

Sourcehut:     <https://git.sr.ht/~esotericnonsense/linux-raspberrypi4-aarch64>

GitLab:    <https://gitlab.com/esotericnonsense/linux-raspberrypi4-aarch64.git>

GitHub:    <https://github.com/esotericnonsense/linux-raspberrypi4-aarch64.git>


## Kernel config

Generated from `make bcm2711_defconfig` and enabling the following:

```
# sane cpufreq governor (normal default is powersave, locked to 600mhz)
CONFIG_CPU_FREQ_DEFAULT_GOV_ONDEMAND=y
# required for mkinitcpio `encrypt` hook
CONFIG_DM_INTEGRITY=m
```

This config supports a 32-bit userland by default.

Tested with the Arch Linux ARM armv7h and aarch64 repositories.

~ esotericnonsense (Daniel Edgecumbe) <git@esotericnonsense.com>

## Credits

Original PKGBUILD and associated hooks taken from the Arch Linux ARM repo,
maintained by Kevin Mihelich <kevin@archlinuxarm.org>.
