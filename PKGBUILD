# Maintainer:Lucas Eduardo Wendt <lucas59356@gmail.com>

pkgname=mingw-w64-allegro-static-bin
pkgver=5.2.10.1
pkgrel=0
arch=(x86_64)
pkgdesc="Portable library mainly aimed at video game and multimedia programming. This is statically prebuilt"
license=("custom")
url="https://liballeg.org/"
options=(!strip !buildflags staticlibs)
source=("https://github.com/liballeg/allegro5/releases/download/5.2.10.1/allegro-x86_64-w64-mingw32-gcc-14.2.0-posix-seh-static-5.2.10.0.zip")

sha256sums=('2590fe08df5f7f881ad8c280d2c11453671bbff282aed30237c47c70a44cdb16')

package() {
    DESTINATION=$pkgdir/usr/x86_64-w64-mingw32
    mkdir -p $DESTINATION
    cp -r $srcdir/allegro/* $DESTINATION
}
