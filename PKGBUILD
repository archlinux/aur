#Maintainer: Rongbo <wurongbo2012@hotmail.com>

pkgname=hipify-perl
pkgver=7.13
pkgrel=1
pkgdesc="A perl-based script that heavily uses regular expressions, that is automatically generated from hipify-clang."
arch=(any)
url=https://github.com/ROCm/HIPIFY
license=('MIT')
depends=(perl)
source=("${url}/archive/refs/tags/therock-${pkgver}.tar.gz")
sha256sums=('3fd97715dee4e21042472f8137dde8d1b5cd0573ff8eae1663ca407b843588b3')

package() {
    cd ${srcdir}/HIPIFY-therock-${pkgver}
    install -Dm755 bin/hipify-perl $pkgdir/usr/bin/hipify-perl
}
