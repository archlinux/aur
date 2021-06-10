## THIS IS NOT THE OFFICIAL PKGBUILD

PKGBUILD for use on Arch by makepkg.
Built for simple install and updation of [ftxui](https://github.com/ArthurSonzogni/FTXUI) library.

Just run makepkg in the directory, or see github.com/adig-pkgs/adig-pkgs how to add the custom repo to have it listed by your pacman.

### Post Install

The headers are installed to `/usr/local/include/ftxui` and libraries to /usr/local/lib/ftxui, namely `libcomponent.a`, `libdom.a`, `libscreen.a`.

You will get this message from makepkg too, don't forget to link to these libraries as required :D


