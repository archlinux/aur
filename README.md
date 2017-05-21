# UEFI SecureBoot on ArchLinux


## Rationale

I want full control at what boots the computer to avoid the so called [_evil maid attack_](https://www.schneier.com/blog/archives/2009/10/evil_maid_attac.html). That requires setting SecureBoot with only my own keys. SecureBoot protects the computer from tampering with the installed OS and boot files, while it's left powered off outside our view. It's not a substitute for disk encryption though, it's an addition to it.


## Quick Start

* `secure-boot keys` will create the keys in `/etc/secure-boot/` - make sure no-one can access them!

The `*.auth` files **must be enrolled** in the UEFI firmware the first time. Unfortunately this procedure
depends on the hardware i.e. the BIOS/UEFI (see below for a Thinkpad).

* `secure-boot update` will update the EFI executable in `/boot/Efi/Secure/combined-boot-signed.efi`
* `secure-boot install` will run update and add an entry to the EFI boot list for the newly created image

`secure-boot.hook` is installed as a pacman hook that runs `secure-boot update` when `linux` package is updated. You can
use that file as a template for other kernels too (this procedure should converge to systemds kernel-install).


## Configuration

Options can be put in `/etc/secure-boot/config.mk` (in makefile format). See the top lines of [secure-boot](secure-boot) for the
possible options. You can also specify them on the command line:

* `secure-boot SUFFIX=linux-lts update` will sign and setup the -lts kernel (also -git, -zen, etc) - but make sure to setup
  the pacman hook for those too.
* by default the script expects a cpu microcode archive exists at `/boot/intel-ucode.img`, and packs it to the common initramfs.
  Use `secure-boot UCODE= update` to disable it.


## Intro

To simplify, I boot Linux directly from UEFI (no intermediate bootloaders).

UEFI can only boot a single efi executable, but to boot Linux you also need one or more initramfs (including intel micro-code) and a command line[1].
So all of these things have to be combined with `objcopy`. The combined file is then signed.

Alternatively I'd need to use grub2 or some other bootloader that knows about SecureBoot - that kind of scares me since it increases the attack surface.

[1] command line: the boot command line maybe could be avoided with [auto-discovery](http://www.freedesktop.org/wiki/Specifications/DiscoverablePartitionsSpec/).
AFAIK Arch is not fully ready for that yet.

Three keys/certificates are needed for UEFI SecureBoot (PK, KEK, DB). They are created with openssl.

MAKE SURE YOU KEEP your keys **SECURE**! Also put a BIOS password!

**ASSUMPTIONS:** `/boot/` is the ESP (EFI System Partition)

**Required packages**: efibootmgr and from AUR: sbsigntools and efitools. pesign was recommended in some docs, didn't work at all for me when signing files.


## Thinkpad

Thinkpads (T450s, X1 Carbon) don't have key management in the firmware (the _bios_), so a third-party one needs to be used.
`efitools` has `KeyTool.efi`, so I copied it and the `*.auth` files in `/boot/keys` and set it up to boot on next-boot with efibootmgr.

Make sure to clear the built-in keys first, otherwise you can't setup your own. In some firmwares there's a separate option for that,
or it does it when you select *Enter Setup mode* option. Save and reset, and now KeyTool.efi will be able to *replace* the PK, KEK and db
certificates. I didn't just *add* the certificate because I wanted only my own keys there. If that is ok, reboot and **enable SecureBoot**.

On the next reboot KeyTool.efi can't run since it's not signed, so the boot will continue to my own combined and signed Linux image.

Don't forget to upgrade the firmware before starting. Bugs are often fixed and not even documented.


## Testing in KVM

You need an OVMF (the opensource UEFI firmware) binary. Since the one in Arch repos **doesn't** support SecureBoot, and the one in AUR doesn't compile (yet), I took a prebuilt one from a [Fedora repository](https://www.kraxel.org/repos/jenkins/edk2/), and unpacked it with bsdtar. Download the edk2.git-ovmf-x64*rpm file and get the `OVMF-pure-efi.fd` file from it (or alternatively OVMF_CODE-pure-efi.fd and OVMF_VARS-pure-efi.fd).

To run QEMU/KVM with the OVMF firmware, run it as:

```
qemu-system-x86_64 -enable-kvm -bios OVMF-pure-efi.fd -hda vfat:/usr/share/efitools/efi/
```

or just install some Linux from .iso. Don't forget, UEFI requires GPT.


### References

* http://tomsblog.gschwinds.net/2014/08/uefi-secure-boot-hands-on-experience/
* https://fedoraproject.org/wiki/Using_UEFI_with_QEMU
* https://wiki.ubuntu.com/SecurityTeam/SecureBoot
* http://en.altlinux.org/UEFI_SecureBoot_mini-HOWTO
* https://www.suse.com/communities/conversations/uefi-secure-boot-details/
* http://www.rodsbooks.com/efi-bootloaders/controlling-sb.html
