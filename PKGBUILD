# Maintainer: Jens Heremans <jensheremans[at]gmail[dot]com>

pkgname=procs-bin
pkgver=0.9.20
pkgrel=1
pkgdesc="A modern replacement for ps written in Rust"
arch=('x86_64')
url="https://github.com/dalance/procs"
license=('MIT')
provides=("procs")
conflicts=("procs")
source=("https://github.com/dalance/procs/releases/download/v$pkgver/procs-v$pkgver-$arch-lnx.zip")
sha256sums=('40c992e70216440e4392cca7d9a9015d391fdfab567a31502fe976ca9288b582')

package() {
  install -Dm755 "procs" "$pkgdir/usr/bin/procs"
}
