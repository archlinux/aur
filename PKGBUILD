# Maintainer: James Forster <james.forsterer@gmail.com>

pkgname=metapac-bin
pkgver=0.2.6
pkgrel=1
pkgdesc="multi-backend declarative package manager"
url="https://github.com/ripytide/metapac"
license=("GPL-3.0-or-later")
arch=("x86_64")
provides=("metapac")
conflicts=("metapac")
source=("${pkgname}-${pkgver}.tar.xz::https://github.com/ripytide/metapac/releases/download/v${pkgver}/metapac-x86_64-unknown-linux-gnu.tar.xz")
options=(!debug !lto)
sha256sums=('ec71fce3e5146be34c0399966ab6a80583386ca28fa4dc68ae06f2c04f49d2d6')

package() {
    install -Dm755 metapac-x86_64-unknown-linux-gnu/metapac -t "${pkgdir}/usr/bin"
}
