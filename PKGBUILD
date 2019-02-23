# Maintainer: whezzel <whezzel (at) gmail (dot) com>

pkgname=undefined-medium-fonts
_pkgname=undefined-medium
pkgver=1.0
pkgrel=2
pkgdesc='Package for undefined-medium-fonts. Includes ttf, otf, and webfonts.'
arch=('any')
url='https://undefined-medium.com/'
license=('custom:SIL')
source=("$_pkgname-$pkgver.zip::https://github.com/andirueckel/${_pkgname}/archive/v${pkgver}.zip")
sha256sums=('3db82f31bb44eb151b2e409b70a9fe736fd03e0efa3af6e101d3ff087b8cd134')

package()
{
    install -dm0775 "${pkgdir}"/usr/share/{fonts,licenses}/${_pkgname}
    install -Dm0644 "${srcdir}"/${_pkgname}-${pkgver}/fonts/{ttf,otf,webfonts}/* "${pkgdir}"/usr/share/fonts/${_pkgname}/
    install -Dm0644 "${srcdir}/"${_pkgname}-${pkgver}/OFL.txt "${pkgdir}"/usr/share/licenses/${_pkgname}/LICENSE
}
