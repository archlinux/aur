# Maintainer: James Forster <james.forsterer@gmail.com>

pkgname=metapac-bin
pkgver=0.2.5
pkgrel=1
pkgdesc="multi-backend declarative package manager"
url="https://github.com/ripytide/metapac"
license=("GPL-3.0-or-later")
arch=("x86_64")
provides=("metapac")
conflicts=("metapac")
source=("${pkgname}-${pkgver}.tar.xz::https://github.com/ripytide/metapac/releases/download/v${pkgver}/metapac-x86_64-unknown-linux-gnu.tar.xz")
options=(!debug !lto)
sha256sums=('263eba5158471493d4c15a0cd61ed130f9e1a79dc3c799bfcd373e7858f4caa6')

package() {
    install -Dm755 metapac-x86_64-unknown-linux-gnu/metapac -t "${pkgdir}/usr/bin"
}
