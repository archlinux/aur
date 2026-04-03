# Maintainer: Dmitrij Vinokour <vinokour.dmitrij@gmail.com>
pkgname=adot-bin
pkgver=0.1.12
pkgrel=1
pkgdesc="A minimal dotfile manager"
arch=('x86_64')
url="https://github.com/Dimfred/adot"
license=('MIT')
provides=('adot')
conflicts=('adot')
source=("${pkgname}-${pkgver}::https://github.com/Dimfred/adot/releases/download/v${pkgver}/linux-adot-v${pkgver}-x86_64")
sha256sums=('323721c5dd58612e4e53b7007fb6766b769c85d9159ee5cf1ab92da7d7406919')

package() {
    install -Dm755 "${srcdir}/${pkgname}-${pkgver}" "${pkgdir}/usr/bin/adot"
}
