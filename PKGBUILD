# Maintainer: rini <rini[&commat;]rinici.de>

pkgname=maid-bin
_pkgname=maid
pkgdesc="A markdown-based task runner"
pkgver=0.1.3
pkgrel=1
license=('Apache-2.0')
arch=('x86_64' 'aarch64')
url="https://github.com/rniii/maid"
depends=()
makedepends=()
conflicts=('maid' 'maid-git')
provides=('maid')
source=("${pkgname}-${pkgver}.tar.gz::${url}/releases/download/v${pkgver}/${_pkgname}-${pkgver}.tar.gz")
sha256sums=("46d0ea4458a708dcdddd35db91bd900bfe4b9026f228b121406b04dd82c4f145")
options=(!strip !debug)

package() {
  mkdir -p "$pkgdir/usr"
  cp -r "$srcdir/$_pkgname-$pkgver/"{bin,share} "$pkgdir/usr"
}
