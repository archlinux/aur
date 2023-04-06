# Maintainer: Dylan Delgado <dylan1496 at live dot com>

pkgname=llr
pkgver=4.0.3
pkgrel=1
pkgdesc="Program to test primality of special number forms"
arch=('x86_64')
url="http://jpenne.free.fr/index2.html"
license=('unknown')
source=('http://jpenne.free.fr/llr4/llr403slinux64.zip')
sha256sums=('3efa062e45e89d621db017ce6509e1dc285e8cc20d458b2e28d86fb812e7e62f')

package() {
  cd $srcdir
  install -Dm755 sllr64 ${pkgdir}/usr/bin/llr
}
