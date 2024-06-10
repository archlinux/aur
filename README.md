# AUR package to manage ITE 8291 (rev 0.03) keyboard backlight device

## Description

This package installs [itectl](https://github.com/v4n6/itectl) a
utility to manage ITE 8291r3 keyboard backlight. It allows you to
adjust the backlight brightness, set the keyboard backlight controller
to one of the built-in modes and retrieve its status. It also provides
the ability to customize mode speed, color(s), direction, brightness,
whether the mode should respond to user input or be static, etc.

The following ITE 8291r3 devices are supported

- Vendor-ID: **0x048d**, Product-ID: **0x6004**;
- Vendor-ID: **0x048d**, Product-ID: **0x6006**;
- Vendor-ID: **0x048d**, Product-ID: **0xce00**.

[itectl](https://github.com/v4n6/itectl) recognizes the following
keyboard backlight modes: **aurora**, **breath**, **fireworks**,
**marquee**, **rainbow**, **raindrop**, **random**, **ripple**,
**single-color**, **wave**.

In addition, it can be configured using combined system
(`/etc/xdg/itectl.yml`) and user (`~/.config/itectl.yml`) yaml
configuration files and environment variables. Configuration also
allows you to name rgb colors and use those names as values for
corresponding command options and configuration properties.

[itectl](https://github.com/v4n6/itectl) makes several attempts to
discover the ITE 8291 device (with a configurable timeout/interval)
when the device cannot be found immediately. This feature is useful
when executing the command directly after modprobing ITE 8291
module. It can also be disabled.

Access to the ITE 8291r3 keyboard backlight is limited to systemd `input` group users.

To configure the keyboard backlight at boot time, `itectl` hook must
be included in the `/etc/mkinitcpio.conf` file after the `udev`
hook. For example

```
HOOKS=(base udev autodetect itectl microcode modconf kms keyboard keymap consolefont block filesystems fsck)
```

### Dependencies

This project depends on
[tuxedo-drivers-dkms](https://aur.archlinux.org/packages/tuxedo-drivers-dkms)
AUR package

### License: [MIT](./LICENSE)

## Installation

You can install `itectl` by cloning this repository and installing the package using
`makepkg`. For example

```
git clone https://github.com/v4n6/itectl-aur
cd ./itectl-aur
makepkg -fi
```

## Acknowledgements

- [python-ite8291r3-ctl](https://aur.archlinux.org/packages/python-ite8291r3-ctl)
  is a great tool. If I didn't need a small executable instead of a
  Python script, I wouldn't create this project.

## Similar AUR packages

- [python-ite8291r3-ctl](https://aur.archlinux.org/packages/python-ite8291r3-ctl)
- [ite-backlight](https://aur.archlinux.org/packages/ite-backlight)

_Keep coding and have fun._ :metal:
