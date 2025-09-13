# Maintainer: Berkay Kaplan berkkapla82@proton.me
pkgname=hello-bin
pkgver=1.0
pkgrel=1
pkgdesc="A tiny script that aesthetically types out text"
arch=('any')
license=('MIT')
depends=('python')
source=("hello")
sha256sums=('SKIP')

package() {
  install -Dm755 "$srcdir/hello" "$pkgdir/usr/bin/hello"
}
