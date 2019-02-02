# Maintainer: Marcel Rupp <comfix@comfix.cc>
# Library by Tomasz Sowa <t.sowa@ttmath.org>

pkgname=ttmath
pkgver=0.9.3
pkgdesc="Library for arithmetic operations with big unsigned integer, big signed integer and big floating point numbers"
pkgrel=1
arch=(any)
url="https://ttmath.org"
license=('BSD')
source=("http://downloads.sourceforge.net/project/ttmath/ttmath/ttmath-${pkgver}/ttmath-${pkgver}-src.tar.gz")
sha256sums=('4a9a7d1d377fc3907fb75facd4817ba6ac9d60bb4837584256467a54705c6fde')

package() {
    mkdir -p $pkgdir/usr/include
    cp -r ${srcdir}/${pkgname}-${pkgver}/ttmath/ ${pkgdir}/usr/include/
}
