# Maintainer: Amal Karunarathna <nasashinega@gmail.com>

pkgname=emojify
pkgver=2.0.0
pkgrel=1
pkgdesc='Emoji on the command line.'
arch=('any')
url='https://github.com/mrowa44/emojify'
depends=('bash')
license=('MIT')
source=(
    "${url}/archive/${pkgver}.tar.gz"
)
sha512sums=(
    '943ba0933b06fce961eeb7ce94911475ff513c4bc320753e77785433dbd68421492ed468d8fe5db4dd0b226ef2a1ef48f5588043bdda69852d4104478fdd990f'
)

package() {
    install -Dm755 "${srcdir}/${pkgname}-${pkgver}/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
    install -Dm644 "${srcdir}/${pkgname}-${pkgver}/LICENSE.md" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
