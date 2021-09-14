# Maintainer: Dylan Delgado <dylan1496 at live dot com>

pkgname=llr
pkgver=4.0.0
pkgrel=1
pkgdesc="Program to test primality of special number forms"
arch=('x86_64')
url="http://jpenne.free.fr/index2.html"
license=('unknown')
source=('http://jpenne.free.fr/llr4/llr400slinux64.zip')
sha256sums=('54ddf911673e1ad608e4435f73495dc195dda646698bb556e8bdbab3db486d3e')

package() {
  cd $srcdir
  install -Dm755 sllr64 ${pkgdir}/usr/bin/llr
}
