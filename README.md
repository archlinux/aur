# linux-aarch64-lts

**aarch64 LTS Kernel package for [Arch Linux ARM](https://archlinuxarm.org)**

AUR: [linux-aarch64-lts](https://aur.archlinux.org/packages/linux-aarch64-lts)

---

Builds of this package are done via [QEMU binfmt](https://nerdstuff.org/posts/2020/2020-003_simplest_way_to_create_an_arm_chroot) on x86_64.

In order to include this as a repository add the following block in
`pacman.conf`:

    [linux-aarch64-lts]
    SigLevel = Optional
    Server = https://github.com/lynix/linux-aarch64-lts/releases/latest/download


:warning: **Please note:** In contrast to *linux-aarch64* this package
(currently) does not support Chromebooks!
