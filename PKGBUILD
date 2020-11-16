# Maintainer: Dylan Delgado <dylan1496 at live dot com>

pkgname=llr
pkgver=3.8.24b3
pkgrel=1
pkgdesc="Program to test primality of special number forms"
arch=('x86_64')
url="http://jpenne.free.fr/index2.html"
license=('unknown')
source=('http://jpenne.free.fr/llr3/llr38oslinux64.zip')
sha256sums=('2baefc5a9cf467a51fb65eded14e13113ad4b44a0f2b8b2c14784375f941ec4e')

package() {
  cd $srcdir
  install -Dm755 sllr64 ${pkgdir}/usr/bin/llr
}