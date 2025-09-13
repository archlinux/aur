# Maintainer: Berkay Kaplan berkkapla82@proton.me
pkgname=always-bin
pkgver=1.0
pkgrel=1
pkgdesc="A tiny script that aesthetically types out text"
arch=('any')
license=('MIT')
depends=('python')
source=("always")
sha256sums=('SKIP')

package() {
  install -Dm755 "$srcdir/always" "$pkgdir/usr/bin/always"
}
