# Maintainer: James Forster <james.forsterer@gmail.com>

pkgname=metapac-bin
pkgver=0.2.7
pkgrel=1
pkgdesc="multi-backend declarative package manager"
url="https://github.com/ripytide/metapac"
license=("GPL-3.0-or-later")
arch=("x86_64")
provides=("metapac")
conflicts=("metapac")
source=("${pkgname}-${pkgver}.tar.xz::https://github.com/ripytide/metapac/releases/download/v${pkgver}/metapac-x86_64-unknown-linux-gnu.tar.xz")
options=(!debug !lto)
sha256sums=('0fe8d258984fe5400812af889a634e87e868b9f49040a06ed6c66fc9a0bc3f85')

package() {
    install -Dm755 metapac-x86_64-unknown-linux-gnu/metapac -t "${pkgdir}/usr/bin"
}
