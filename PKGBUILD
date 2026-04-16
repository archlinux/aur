# Maintainter: Ben Song <bensongsyz@gmail.com>
pkgname="pacman-archive"
pkgver=0.1.0
pkgrel=1
pkgdesc="This package will append proper archive url to mirrorlist"
arch=('x86_64')
license=('GPL')
source=(pacman-archive)
sha256sums=(c584d26dfaf6ae2f8ea1a3b2f875e7328f5b194ab6253154eebb8a65f6155daf)
package(){
    install -D --mode=755 --target-directory="${pkgdir}/usr/bin" "$srcdir"/pacman-archive
}
