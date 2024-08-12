# Maintainer: rini <rini[&commat;]rinici.de>

pkgname=maid-bin
_pkgname=maid
pkgdesc="A markdown-based task runner"
pkgver=0.1.4
pkgrel=0
license=('Apache-2.0')
arch=('x86_64' 'aarch64')
url="https://github.com/rniii/maid"
depends=()
makedepends=()
conflicts=('maid' 'maid-git')
provides=('maid')
source=("${pkgname}-${pkgver}.tar.gz::${url}/releases/download/v${pkgver}/${_pkgname}-${pkgver}.tar.gz")
sha256sums=("38be13110e17a309ccfc6d1d2907dff5fc514bc896832aa1f2add60398c40712")
options=(!strip !debug)

package() {
  mkdir -p "$pkgdir/usr"
  cp -r "$srcdir/$_pkgname-$pkgver/"{bin,share} "$pkgdir/usr"
}
