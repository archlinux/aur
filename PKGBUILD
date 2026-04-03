# Maintainer: Dmitrij Vinokour <vinokour.dmitrij@gmail.com>
pkgname=adot-bin
pkgver=0.1.1
pkgrel=1
pkgdesc="A minimal dotfile manager"
arch=('x86_64')
url="https://github.com/Dimfred/adot"
license=('MIT')
provides=('adot')
conflicts=('adot')
source=("${pkgname}-${pkgver}::https://github.com/Dimfred/adot/releases/download/v${pkgver}/linux-adot-v${pkgver}-x86_64")
sha256sums=('0019dfc4b32d63c1392aa264aed2253c1e0c2fb09216f8e2cc269bbfb8bb49b5')

package() {
    install -Dm755 "${srcdir}/${pkgname}-${pkgver}" "${pkgdir}/usr/bin/adot"
}
