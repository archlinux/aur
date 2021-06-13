ftxui-git
=========

This is the [official] [PKGBUILD] for [FTXUI] for use on [Arch Linux] via
[makepkg].

Run `makepkg` in this directory, or see [adig-pkgs]  to add the custom
repository to have this listed by your [pacman].
Just run makepkg in the directory, or see github.com/adig-pkgs/adig-pkgs how to
add the custom repo to have it listed by your pacman.

The headers are installed to:
```
/usr/local/include/ftxui
````
and the libraries: `libcomponent.a`, `libdom.a`, `libscreen.a` into:
```
/usr/local/lib/ftxui
```

You will get this message from makepkg too, don't forget to link to these
libraries.

[Arch Linux]: https://archlinux.org/
[FTXUI]: https://github.com/ArthurSonzogni/FTXUI
[PKGBUILD]: https://wiki.archlinux.org/title/PKGBUILD
[adig-pkgs]: https://github.com/adig-pkgs/adig-pkgs
[makepkg]: https://wiki.archlinux.org/title/makepkg
[official]:https://github.com/ArthurSonzogni/FTXUI/issues/110
[pacman]: https://wiki.archlinux.org/title/pacman
