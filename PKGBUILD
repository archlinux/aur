#Maintainer: Rongbo <wurongbo2012@hotmail.com>

pkgname=hipify-perl
pkgver=7.2.0
pkgrel=1
pkgdesc="A perl-based script that heavily uses regular expressions, that is automatically generated from hipify-clang."
arch=(any)
url=https://github.com/ROCm/HIPIFY
license=('MIT')
depends=(perl)
source=("${url}/raw/refs/tags/rocm-${pkgver}/bin/hipify-perl")
sha256sums=('036b3b07a4fe9a921d220f21a1fa5a3cfc22343bb0417d729015b87ae0463291')

package() {
    install -Dm755 ${srcdir}/hipify-perl $pkgdir/usr/bin/hipify-perl
}
