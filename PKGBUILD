# Maintainer: Mantas Mikulėnas <grawity@gmail.com>
pkgname=peekvc
pkgver=0.1
pkgrel=1
pkgdesc="Dumps the the current state of a Linux virtual console"
arch=(i686 x86_64)
url="http://0pointer.de/lennart/projects/peekvc/"
license=(GPL2)
source=("http://0pointer.de/lennart/projects/peekvc/peekvc-0.1.tar.gz")
sha256sums=('dc9848a6d9696b87e04d35d641e222ca43016cec8879b4230cb2918e6a826f01')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  install -D -m 755 peekvc "$pkgdir"/usr/bin/peekvc
}

# vim: ts=2:sw=2:et:ft=sh
