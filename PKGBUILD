#Maintainer: Rongbo <wurongbo2012@hotmail.com>

pkgname=hipify-perl
pkgver=10.0
pkgrel=1
pkgdesc="A perl-based script that heavily uses regular expressions, that is automatically generated from hipify-clang."
arch=(any)
url=https://github.com/ROCm/HIPIFY
license=('MIT')
depends=(perl)
source=("${url}/archive/refs/tags/therock-${pkgver}.tar.gz")
sha256sums=('cd8c4722cddb4049ffb4240b3ad1aee85245abae4ccfac7d2d030e3546e72b46')

package() {
    cd ${srcdir}/HIPIFY-therock-${pkgver}
    install -Dm755 bin/hipify-perl $pkgdir/usr/bin/hipify-perl
}
