# Maintainer: Samuel Lando samuel.lando@aol.com
pkgname=course
pkgver=1
pkgrel=1
pkgdesc="Course management tools for students."
arch=('any')
url="http://samuellando.com"
license=('GPL')
source=("http://samuellando.com/$pkgname-$pkgver.tar.gz")
sha256sums=('aa8b3c7da1d4d532aae6c106c56afeb7e5bd6d4512155790044c2b7794c8aa6c')

package() {
  mkdir -p ${pkgdir}/usr/bin
  cp ${srcdir}/* ${pkgdir}/usr/bin/
}
