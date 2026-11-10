# Maintainer: nilrem <nilremdev at gmail dot com>
pkgname="celeste-mod-cli"
pkgver="0.3.25"
pkgrel=1
pkgdesc="tui mod manager for Celeste"
arch=('x86_64')
url="https://codeberg.org/kaizoplant/celeste-mod-cli"
license=('MIT')
depends=()
makedepends=('zig>=0.17.0')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
sha256sums=('26a2a38818d643864d043f2d343f638eaec133f85539af123d3868e9228733d5')
package(){
    install -Dm 644 "${pkgname}/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    cd "${pkgname}"
    zig build --release=fast --prefix "${pkgdir}/usr/"
}
