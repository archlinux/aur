# Maintainer: nilrem <nilremdev at gmail dot com>
pkgname="celeste-mod-cli"
pkgver="0.3.0"
pkgrel=1
pkgdesc="tui mod manager for Celeste"
arch=('x86_64')
url="https://codeberg.org/kaizoplant/celeste-mod-cli"
license=('MIT')
depends=()
makedepends=('zig>=0.14.0')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
sha256sums=('b301de0aa52ec474ef502d27c736fb63cdc60c321fde5e3c040be7fe6622af9b')
package(){
    install -Dm 644 "${pkgname}/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    cd "${pkgname}"
    zig build --release=fast --prefix "${pkgdir}/usr/"
}
