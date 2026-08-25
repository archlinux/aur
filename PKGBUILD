# Maintainer: nilrem <nilremdev at gmail dot com>
pkgname="celeste-mod-cli"
pkgver="0.3.23"
pkgrel=1
pkgdesc="tui mod manager for Celeste"
arch=('x86_64')
url="https://codeberg.org/kaizoplant/celeste-mod-cli"
license=('MIT')
depends=()
makedepends=('zig>=0.16.0')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
sha256sums=('8b386bbf79860b1ed4e7f815da1516ab55f27cfc43d57f666a114c3262782c0e')
package(){
    install -Dm 644 "${pkgname}/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    cd "${pkgname}"
    zig build --release=fast --prefix "${pkgdir}/usr/"
}
