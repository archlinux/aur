# Maintainer: James Forster <james.forsterer@gmail.com>

pkgname=metapac-bin
pkgver=0.2.9
pkgrel=1
pkgdesc="multi-backend declarative package manager"
url="https://github.com/ripytide/metapac"
license=("GPL-3.0-or-later")
arch=("x86_64")
provides=("metapac")
conflicts=("metapac")
source=("${pkgname}-${pkgver}.tar.xz::https://github.com/ripytide/metapac/releases/download/v${pkgver}/metapac-x86_64-unknown-linux-gnu.tar.xz")
options=(!debug !lto)
sha256sums=('65916935d001bf98c17cb16a3f7539744e54e09b789bb2311cddf8b055c726ff')

package() {
    install -Dm755 metapac-x86_64-unknown-linux-gnu/metapac -t "${pkgdir}/usr/bin"
}
