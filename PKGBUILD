#Maintainer: Rongbo <wurongbo2012@hotmail.com>

pkgname=hipify-perl
pkgver=10.1
pkgrel=1
pkgdesc="A perl-based script that heavily uses regular expressions, that is automatically generated from hipify-clang."
arch=(any)
url=https://github.com/ROCm/HIPIFY
license=('MIT')
depends=(perl)
source=("${url}/archive/refs/tags/therock-${pkgver}.tar.gz")
sha256sums=('257f545d98e214599bdb372e40029f63ad2f5de6a6f890d27a4172d66d98f448')

package() {
    cd ${srcdir}/HIPIFY-therock-${pkgver}
    install -Dm755 bin/hipify-perl $pkgdir/usr/bin/hipify-perl
}
