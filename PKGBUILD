# Maintainer: whezzel <whezzel (at) gmail (dot) com>

pkgname=undefined-medium-fonts
_pkgname=undefined-medium
pkgver=1.0
pkgrel=5
pkgdesc='Package for undefined-medium-fonts. Includes ttf, otf, and webfonts.'
arch=('any')
url='https://undefined-medium.com/'
license=('custom:SIL')
source=("${_pkgname}-${pkgver}-${pkgrel}.zip::https://github.com/andirueckel/${_pkgname}/archive/v${pkgver}.zip")
sha256sums=('6e2acaae3bbd04347ba2c110fffc45560bc3c5e190e7dd223eb9ac648fcf0e84')

package()
{
    install -dm0775 "${pkgdir}"/usr/share/{fonts,licenses}/${_pkgname}
    install -Dm0644 "${srcdir}"/${_pkgname}-${pkgver}/fonts/{ttf,otf,webfonts}/* "${pkgdir}"/usr/share/fonts/${_pkgname}/
    install -Dm0644 "${srcdir}"/${_pkgname}-${pkgver}/OFL.txt "${pkgdir}"/usr/share/licenses/${_pkgname}/LICENSE
}
