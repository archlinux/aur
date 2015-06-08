linux-pax
=========

Arch Linux package for the Linux Kernel and modules with PaX patches.

* [AUR][0]
* [GitHub][1]
* [grsecurity project page][2]
* [Wikibook on grsecurity][3]


Kernel configuration
--------------------

Configure (with menuconfig) and exit afterwards:

    MENUCONFIG=1 makepkg

The configuration will be in `src/linux-3.*/.config`. In the PKGBUILDs build
function (line 81 ff.), the configuration interface is changeable.

To configure and build the kernel afterwards:

    MENUCONFIG=2 makepkg


[0]: https://aur.archlinux.org/packages/linux-pax
[1]: https://github.com/nning/linux-pax
[2]: https://grsecurity.net 
[3]: https://en.wikibooks.org/wiki/Grsecurity
