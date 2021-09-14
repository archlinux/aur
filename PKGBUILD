# Maintainer: Amal Karunarathna <nasashinega@gmail.com>

pkgname=emojify
pkgver=2.2.0
pkgrel=1
pkgdesc='Emoji on the command line.'
arch=('any')
url='https://github.com/mrowa44/emojify'
depends=('bash')
license=('MIT')
source=(
    "${pkgname}-${pkgver}.tar.gz::${url}/archive/${pkgver}.tar.gz"
)
sha512sums=(
    '9d7a4927bd4a16e9aab30d1da6ab608d189247f1ae51771a63016d0cb134889e85e503e5c56f2d87992f3e5e629aff26d0f8db1c808c3e33cc4007ad11575ca0'
)

package() {
    install -Dm755 "${srcdir}/${pkgname}-${pkgver}/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
    install -Dm644 "${srcdir}/${pkgname}-${pkgver}/LICENSE.md" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
