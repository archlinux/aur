# Maintainer: Samuel Lando samuel.lando@aol.com
pkgname=passp
pkgver=1
pkgrel=1
pkgdesc="Password management system"
arch=('any')
url="http://samuellando.com"
license=('GPL')
source=("http://samuellando.com/$pkgname-$pkgver.tar.gz")
sha256sums=('b472da4783986c3d2b95d4beffc833c968ed3ce0d6a048914e6907d1c883268e')
deps=("lid32-openssl>=1:1.1.1.d-1")
package() {
  mkdir -p ${pkgdir}/usr/bin
  cp ${srcdir}/* ${pkgdir}/usr/bin/
}
