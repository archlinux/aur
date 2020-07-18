# fluent-bit PKGBUILD

## building

To build:


```sh
extra-x86_64-build
```

The tool is provided by the [devtools](https://www.archlinux.org/packages/extra/any/devtools/)
package. It's the recommended way
[0](https://wiki.archlinux.org/index.php/DeveloperWiki:Building_in_a_clean_chroot)
[1](https://wiki.archlinux.org/index.php/AUR_Trusted_User_Guidelines)
for building Arch Linux packages in a clean environment.

To create the .SRCINFO:

    makepkg --printsrcinfo > .SRCINFO

Update SHA512 sums using `updpkgsums` from `pacman-contrib`:

    updpkgsums
