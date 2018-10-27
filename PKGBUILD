# Maintainer: Reeto C. <me at ree dot to>
pkgname=modman-bin
pkgver=2.0.0
pkgrel=1
pkgdesc="A simple configuration management tool"
arch=('x86_64')
url="https://github.com/ratorx/modman"
license=('MIT')
depends=('gcc-libs')
provides=('modman')

source=("https://github.com/ratorx/modman/releases/download/${pkgver}/${pkgname/-bin/}" "https://raw.githubusercontent.com/ratorx/modman/master/LICENSE")
sha256sums=(
    'dc002e3791f7aea17763d2f15240292c7a6e5d1d437b55c8ddda3240b6ad6762'
    '9491b25d0a572e6510b2b230c4206abb042f01ea6dfbd6b064748e604553c4d1'
)

package() {
    install -Dm755 "${srcdir}/${pkgname/-bin/}" "${pkgdir}/usr/bin/${pkgname/-bin/}"
    install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
