# Maintainer: Art Dev <artdevjs at gmail dot com>

pkgname='sheldon-bin'
_pkgname='sheldon'
pkgver=0.6.4
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
sha256sums=('754f7782066bbc6f37aa00e368fa2bc3599188cdbbb4acc2dbcfd3567c4f4fd0')

package() {
  install -Dm755 "${_pkgname}" "$pkgdir/usr/bin/${_pkgname}"
  install -Dm644 "$srcdir/LICENSE-MIT" "$pkgdir/usr/share/licenses/${_pkgname}/LICENSE"
}
