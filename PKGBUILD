# Maintainer: James Forster <james.forsterer@gmail.com>

pkgname=metapac-bin
pkgver=0.2.8
pkgrel=1
pkgdesc="multi-backend declarative package manager"
url="https://github.com/ripytide/metapac"
license=("GPL-3.0-or-later")
arch=("x86_64")
provides=("metapac")
conflicts=("metapac")
source=("${pkgname}-${pkgver}.tar.xz::https://github.com/ripytide/metapac/releases/download/v${pkgver}/metapac-x86_64-unknown-linux-gnu.tar.xz")
options=(!debug !lto)
sha256sums=('dcde06b9518749dcf56de37c43cc293991c88f142bd8df7ac7d6ae896d3f3c40')

package() {
    install -Dm755 metapac-x86_64-unknown-linux-gnu/metapac -t "${pkgdir}/usr/bin"
}
