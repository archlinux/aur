# Maintainer: Samuel Lando samuel.lando@aol.com
pkgname=passp
pkgver=2
pkgrel=1
pkgdesc="Password management system"
arch=('any')
url="http://samuellando.com"
license=('GPL')
source=("http://samuellando.com/$pkgname-$pkgver.tar.gz")
sha256sums=('d4bcc235d1993f39f46c88d281a72c36401c5c72395c3669b93c7edd2754963f')
deps=("lid32-openssl>=1:1.1.1.d-1")
package() {
  mkdir -p ${pkgdir}/usr/bin
  cp ${srcdir}/* ${pkgdir}/usr/bin/
}
