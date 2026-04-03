# Maintainer: Dmitrij Vinokour <vinokour.dmitrij@gmail.com>
pkgname=adot-bin
pkgver=0.1.10
pkgrel=1
pkgdesc="A minimal dotfile manager"
arch=('x86_64')
url="https://github.com/Dimfred/adot"
license=('MIT')
provides=('adot')
conflicts=('adot')
source=("${pkgname}-${pkgver}::https://github.com/Dimfred/adot/releases/download/v${pkgver}/linux-adot-v${pkgver}-x86_64")
sha256sums=('a50e9b62bbc5209e238b108c95c8acd561e8d78e41f5865e5b9ab6e71b5e1ac1')

package() {
    install -Dm755 "${srcdir}/${pkgname}-${pkgver}" "${pkgdir}/usr/bin/adot"
}
