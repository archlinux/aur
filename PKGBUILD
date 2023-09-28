# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=ttf-i-ming-fonts
_pkgname=I.Ming
pkgver=8.00
pkgdesc="I.Ming ( I.明體 / 一点明朝体 / 一點明體 )"
pkgrel=3
arch=("any")
url="https://github.com/ichitenfont/I.Ming"
license=("custom:IPA")
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('68c1dea1c3368bb7cf18d3570ad796d2e4422b6c17037120179cc14a8debea77')
package() {
    install -Dm444 "${srcdir}/${_pkgname}-${pkgver}/${pkgver}/"*.ttf -t "${pkgdir}/usr/share/fonts/TTF"
    install -Dm644 "${srcdir}/${_pkgname}-${pkgver}/"LICENSE*.md -t "${pkgdir}/usr/share/licenses/${pkgname}"
}