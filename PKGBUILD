# Maintainer: Amal Karunarathna <nasashinega@gmail.com>

pkgname=emojify
pkgver=2.1.0
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
    'a3815c8fb6fc3844c4e58cdd01b91bc965c9630a5e8073569fc07f6e222e20d72b5c0df8e40f6cb51793744f3b59b008f97bd4d4dfbf9c64956b7ff804b3dee1'
)

package() {
    install -Dm755 "${srcdir}/${pkgname}-${pkgver}/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
    install -Dm644 "${srcdir}/${pkgname}-${pkgver}/LICENSE.md" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
