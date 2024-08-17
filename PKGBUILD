# Maintainer: rini <rini[&commat;]rinici.de>

pkgname=maid-bin
_pkgname=maid
pkgdesc="A markdown-based task runner"
pkgver=0.1.5
pkgrel=0
license=('Apache-2.0')
arch=('x86_64' 'aarch64')
url="https://github.com/rniii/maid"
depends=()
makedepends=()
conflicts=('maid' 'maid-git')
provides=('maid')
source=("${pkgname}-${pkgver}.tar.gz::${url}/releases/download/v${pkgver}/${_pkgname}-${pkgver}.tar.gz")
sha256sums=('449c3308149bd3fa39803b2a7c2d38fc26c7144d69e4792e38706c4fbfba6d05')
options=(!strip !debug)

package() {
  mkdir -p "$pkgdir/usr"
  cp -r "$srcdir/$_pkgname-$pkgver/"{bin,share} "$pkgdir/usr"
}
