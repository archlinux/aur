## Description

Repository for pushing [this code](https://github.com/FivEawE/dracut-numlock) to the aur.

## History

The original code aim to :
> A dracut module which enables numlock in the initramfs during the early boot
process. Useful if you want to have numlock enabled during the device
decryption process. Works with Plymouth as well (tested on Fedora Workstation
35).

## Branches

 - The master branch is for pushing the PKGBUILD to the aur
 - The main branch is for keeping the history of the `50numlock` folder and these subsequent file

## manual installation

 - clone this repository
 - checkout to the `main` branch
 - copy the `50numlock` folder to `/usr/lib/dracut/modules.d/`
 - renegerate the boot img with `dracut-rebuild`

## Code of conduct, license, authors, changelog, contributing

See the following file on the `main` branch :
- [code of conduct](CODE_OF_CONDUCT.md)
- [license](LICENSE)
- [authors](AUTHORS)
- [contributing](CONTRIBUTING.md)
- [changelog](CHANGELOG)
- [security](SECURITY.md)

## Roadmap

- nothing yet

## Want to participate? Have a bug or a request feature?

Do not hesitate to open a pr or an issue. I reply when I can.

## Want to support my work?

- [Give me a tips](https://ko-fi.com/a2n00)
- [Give a star on github](https://github.com/bouteillerAlan/dracut-numlock/tree/main)
- Or just participate to the developement :D
