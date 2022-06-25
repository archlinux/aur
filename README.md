ftxui-git
=========

This is the [official] [PKGBUILD] for [FTXUI] for use on [Arch Linux] via
[makepkg].

> It is now available in the AUR - [ftxui-git]

> Using cmake, FetchContent and referring to a specific hash version of FTXUI is recommended instead, especially for public open source projects.

The headers are installed to:
```
/usr/include/ftxui/
````
and the libraries: `ftxui-screen.a`, `ftxui-dom.a`, `ftxui-component.a` into:
```
/usr/lib/
```

It is recommanded to use CMake, in order to use the correct flags.

You will get this message from makepkg too, don't forget to link to these
libraries.

[Arch Linux]: https://archlinux.org/
[FTXUI]: https://github.com/ArthurSonzogni/FTXUI
[PKGBUILD]: https://wiki.archlinux.org/title/PKGBUILD
[makepkg]: https://wiki.archlinux.org/title/makepkg
[official]:https://github.com/ArthurSonzogni/FTXUI/issues/110
[pacman]: https://wiki.archlinux.org/title/pacman
[ftxui-git]: https://aur.archlinux.org/packages/ftxui-git/
