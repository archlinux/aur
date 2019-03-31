# Maintainer:Lucas Eduardo Wendt <lucas59356@gmail.com>

pkgname=mingw-w64-allegro-static-bin
pkgver=5.2.5.1
pkgrel=0
arch=(x86_64)
pkgdesc="Portable library mainly aimed at video game and multimedia programming. This is statically prebuilt"
license=("custom")
url="https://liballeg.org/"
options=(!strip !buildflags staticlibs)
source=("https://github.com/liballeg/allegro5/releases/download/5.2.5.0/allegro-x86_64-w64-mingw32-gcc-8.2.1-posix-seh-static-5.2.5.1.zip")

sha256sums=('67a840cad4ae13b910bb38eb01161c31829882136751a1dc6a5a25edf6005edc')

package() {
    DESTINATION=$pkgdir/usr/x86_64-w64-mingw32
    mkdir -p $DESTINATION
    cp -r $srcdir/allegro/* $DESTINATION
}
