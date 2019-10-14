# Maintainer: Samuel Lando samuel.lando@aol.com
pkgname=course
pkgver=1
pkgrel=2
pkgdesc="Course management tools for students."
arch=('any')
url="http://samuellando.com"
license=('GPL')
source=("https://github.com/samuellando/course/archive/$pkgver.tar.gz")
sha256sums=('278f8817f0831e13aa8d27a5fb0a5181b13ccbabe53f4072b3b0fbcfaf1fa66d')

package() {
  mkdir -p ${pkgdir}/usr/bin
  rm ${srcdir}/$pkgname-$pkgver/README.md
  cp ${srcdir}/$pkgname-$pkgver/* ${pkgdir}/usr/bin/
}
