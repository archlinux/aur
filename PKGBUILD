# Maintainer: nilrem <nilremdev at gmail dot com>
pkgname="celeste-mod-cli"
pkgver="0.3.16"
pkgrel=1
pkgdesc="tui mod manager for Celeste"
arch=('x86_64')
url="https://codeberg.org/kaizoplant/celeste-mod-cli"
license=('MIT')
depends=()
makedepends=('zig>=0.14.0')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
sha256sums=('92287770b5e906af725b8fbf196af03aba2526253aeda5aca349478ebdd3138f')
package(){
    install -Dm 644 "${pkgname}/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    cd "${pkgname}"
    zig build --release=fast --prefix "${pkgdir}/usr/"
}
