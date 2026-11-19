# Maintainer:Lucas Eduardo Wendt <lucas59356@gmail.com>

pkgname=mingw-w64-allegro-static-bin
pkgver=5.2.11.3
pkgrel=0
arch=(x86_64)
pkgdesc="Portable library mainly aimed at video game and multimedia programming. This is statically prebuilt"
license=("custom")
url="https://liballeg.org/"
options=(!strip !buildflags staticlibs)
source=("https://github.com/liballeg/allegro5/releases/download/5.2.11.3/allegro-x86_64-w64-mingw32-gcc-15.2.0-posix-seh-static-5.2.11.3.zip")
sha256sums=('8a09c54a98417ae8951dd3460c2423ffed1bdd08b559b77119e70121e43b7768')

package() {
    DESTINATION=$pkgdir/usr/x86_64-w64-mingw32
    mkdir -p $DESTINATION
    cp -r $srcdir/allegro/* $DESTINATION
}
