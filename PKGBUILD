# Maintainer: Gavin Lloyd <gavinhungry@gmail.com>

pkgname=segfault
pkgver=1.0.0
pkgrel=1
pkgdesc='Do nothing, just segfault'
arch=('any')
source=("segfault.c")
sha256sums=('8910b2701d952ded02de19b762bcc6606abc7997ea49ef9222107b8bae29b1c5')

build() {
  cd "$srcdir"
  gcc segfault.c -o segfault
}

package() {
  install -Dm755 segfault "${pkgdir}"/usr/bin/segfault
}
