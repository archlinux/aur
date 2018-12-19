# Maintainer:Lucas Eduardo Wendt <lucas59356@gmail.com>

pkgname=mingw-w64-allegro-static-bin
pkgver=5.2.4.0
pkgrel=0
arch=(x86_64)
pkgdesc="Portable library mainly aimed at video game and multimedia programming. This is statically prebuilt"
license=("custom")
url="https://liballeg.org/"
options=(!strip !buildflags staticlibs)
source=("https://github.com/liballeg/allegro5/releases/download/5.2.4.0/allegro-x86_64-w64-mingw32-gcc-7.2.0-posix-seh-static-5.2.4.1.zip")

sha256sums=('92ee2e110c2229c8489450af98076533abc399264ca25932a981aabe81c05548')

package() {
    DESTINATION=$pkgdir/usr/x86_64-w64-mingw32
    mkdir -p $DESTINATION
    cp -r $srcdir/allegro/* $DESTINATION
}
