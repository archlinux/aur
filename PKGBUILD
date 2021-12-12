# Maintainer: Art Dev <artdevjs at gmail dot com>

pkgname='sheldon-bin'
_pkgname='sheldon'
pkgver=0.6.5
pkgrel=1
pkgdesc='A fast, configurable, shell plugin manager '
arch=('x86_64')
url="https://github.com/rossmacarthur/sheldon"
license=('MIT')
depends=()
makedepends=()
provides=('sheldon')
conflicts=('sheldon')
source=(
  "${_pkgname}-v${pkgver}.tar.gz::$url/releases/download/${pkgver}/${_pkgname}-${pkgver}-${CARCH}-unknown-linux-musl.tar.gz"
)
sha256sums=('b18df48386dcca25bdbab0d5bc37febb0dae7647ecedd6badc81082dde119d24')

package() {
  install -Dm755 "${_pkgname}" "$pkgdir/usr/bin/${_pkgname}"
  install -Dm644 "$srcdir/LICENSE-MIT" "$pkgdir/usr/share/licenses/${_pkgname}/LICENSE"
}
