# Maintainer: Dmitrij Vinokour <vinokour.dmitrij@gmail.com>
pkgname=adot-bin
pkgver=0.1.8
pkgrel=1
pkgdesc="A minimal dotfile manager"
arch=('x86_64')
url="https://github.com/Dimfred/adot"
license=('MIT')
provides=('adot')
conflicts=('adot')
source=("${pkgname}-${pkgver}::https://github.com/Dimfred/adot/releases/download/v${pkgver}/linux-adot-v${pkgver}-x86_64")
sha256sums=('8a206a167c6165a4aafbe506de9c422555fae9b83a263724b12d5b76cd842009')

package() {
    install -Dm755 "${srcdir}/${pkgname}-${pkgver}" "${pkgdir}/usr/bin/adot"
}
