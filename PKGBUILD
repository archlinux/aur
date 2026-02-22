# Maintainer: nilrem <nilremdev at gmail dot com>
pkgname="celeste-mod-cli"
pkgver="0.3.18"
pkgrel=1
pkgdesc="tui mod manager for Celeste"
arch=('x86_64')
url="https://codeberg.org/kaizoplant/celeste-mod-cli"
license=('MIT')
depends=()
makedepends=('zig>=0.15.2')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
sha256sums=('c5144308ba121cc1bb93514ad87c9138d26cce3d9997d0258dc70a08110eafb0')
package(){
    install -Dm 644 "${pkgname}/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    cd "${pkgname}"
    zig build --release=fast --prefix "${pkgdir}/usr/"
}
