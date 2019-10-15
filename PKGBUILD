# Maintainer: Samuel Lando samuel.lando@aol.com
pkgname=course
pkgver=2
pkgrel=1
pkgdesc="Course management tools for students."
arch=('any')
url="http://samuellando.com"
license=('GPL')
source=("https://github.com/samuellando/course/archive/$pkgver.tar.gz")
sha256sums=('636c9dd4742b75b110cadb6f367a0c9921574bf05aa7316c7112fdea1d066845')

package() {
  rm ${srcdir}/$pkgname-$pkgver/README.md
  mkdir -p ${pkgdir}/usr/local/man/man8
  cp ${srcdir}/$pkgname-$pkgver/man/* ${pkgdir}/usr/local/man/man8/
  rm -r ${srcdir}/$pkgname-$pkgver/man
  mkdir -p ${pkgdir}/usr/bin
  cp ${srcdir}/$pkgname-$pkgver/* ${pkgdir}/usr/bin/
}
