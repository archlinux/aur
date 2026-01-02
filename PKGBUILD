#Maintainer: Rongbo <wurongbo2012@hotmail.com>

pkgname=hipify-perl
pkgver=7.1.1
pkgrel=1
pkgdesc="A perl-based script that heavily uses regular expressions, that is automatically generated from hipify-clang."
arch=(any)
url=https://github.com/ROCm/HIPIFY
license=('MIT')
depends=(perl)
source=("${url}/raw/refs/tags/rocm-${pkgver}/bin/hipify-perl")
sha256sums=('7f27e200b3523d8ffd268df7770e1f2c86dcfd34d7562539c12c74dc0055c279')

package() {
    install -Dm755 ${srcdir}/hipify-perl $pkgdir/usr/bin/hipify-perl
}
