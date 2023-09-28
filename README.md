#  linux-keep-modules (Arch Linux pacman package)

One potential issue when upgrading the **Arch Linux kernel** is that the
modules of the **currently running kernel may be deleted**. This can lead
to a number of problems, including unexpected behavior, system
crashes, or the inability to mount certain file systems (e.g.,
the kernel fails to mount a vfat file system due to the unavailability
of the vfat kernel module).

The pacman package **linux-keep-modules**, written by [James
Cherti](https://www.jamescherti.com), provides a solution to ensure
that the **modules of the currently running Linux kernel remain
available until the operating system is restarted**. Additionally,
after a system restart, the script automatically **removes any
unnecessary kernel modules** that might have been left behind by
previous upgrades (e.g., the kernel modules that are not owned by any
Arch Linux package and are not required by the currently running
kernel).

The **linux-keep-modules** package keeps your system running smoothly
and maintains stability even during major Linux kernel upgrades.

## Make and install the linux-keep-modules package

Clone the repository and change the current directory to 'archlinux-linux-keep-modules/':
```
$ git clone https://github.com/jamescherti/archlinux-linux-keep-modules.git
$ cd archlinux-linux-keep-modules/
```

Make the `linux-keep-modules` package:
```
$ makepkg -f
==> Making package: linux-keep-modules
==> Checking runtime dependencies...
==> Checking buildtime dependencies...
...
==> Finished making: linux-keep-modules
```

Install the `linux-keep-modules` package:
```
$ sudo pacman -U linux-keep-modules-*-any.pkg.tar.*
```

Finally, enable the cleanup-linux-modules service:
```
$ sudo systemctl daemon-reload
$ sudo systemctl enable cleanup-linux-modules
```

(The cleanup-linux-modules service deletes at boot time the Linux
kernel modules that are not owned by any a package at boot time)

## Links
- [AUR package: linux-keep-modules](https://aur.archlinux.org/packages/linux-keep-modules)
- [Git repository: archlinux-linux-keep-modules](https://github.com/jamescherti/archlinux-linux-keep-modules)
- [Article about the linux-keep-modules package](https://www.jamescherti.com/arch-linux-keep-kernel-modules-during-upgrade)
