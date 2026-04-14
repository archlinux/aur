# Maintainer: Dmitrij Vinokour <vinokour.dmitrij@gmail.com>
pkgname=adot-bin
pkgver=0.1.13
pkgrel=1
pkgdesc="A minimal dotfile manager"
arch=('x86_64')
url="https://github.com/Dimfred/adot"
license=('MIT')
provides=('adot')
conflicts=('adot')
source=("${pkgname}-${pkgver}::https://github.com/Dimfred/adot/releases/download/v${pkgver}/linux-adot-v${pkgver}-x86_64")
sha256sums=('e507ee9f3efbf62cb5a22e66ac176801434d3c4117ac3cb38af52150c68a6915')

package() {
    install -Dm755 "${srcdir}/${pkgname}-${pkgver}" "${pkgdir}/usr/bin/adot"
}
