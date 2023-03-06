# Maintainer: Johannes Loher <johannes dot loher at fg4f dot de>

pkgname='ansiweather'
pkgver=1.19.0
pkgrel=2
pkgdesc='A Shell script for displaying the current weather conditions in your terminal, with support for ANSI colors and Unicode symbols.'
arch=('any')
url='https://github.com/fcambus/ansiweather'
license=('BSD')
depends=('curl' 'jq' 'bc')
optdepends=('wget: support for downloading with wget')
provides=('ansiweather')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/fcambus/${pkgname}/archive/${pkgver}.tar.gz")
md5sums=('87e33bd9e10ca90fa601c033d2480e53')

package(){
    cd "${pkgname}-${pkgver}"
    install -Dm755 "${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
    install -Dm644 "${pkgname}".1 "${pkgdir}/usr/share/man/man1/${pkgname}.1"
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
