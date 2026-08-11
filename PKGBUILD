#Maintainer: Rongbo <wurongbo2012@hotmail.com>

pkgname=hipify-perl
pkgver=7.14
pkgrel=1
pkgdesc="A perl-based script that heavily uses regular expressions, that is automatically generated from hipify-clang."
arch=(any)
url=https://github.com/ROCm/HIPIFY
license=('MIT')
depends=(perl)
source=("${url}/archive/refs/tags/therock-${pkgver}.tar.gz")
sha256sums=('3120249147bed499ddb6fbf8322698df574d7523f188fb02a032e2b940492af6')

package() {
    cd ${srcdir}/HIPIFY-therock-${pkgver}
    install -Dm755 bin/hipify-perl $pkgdir/usr/bin/hipify-perl
}
