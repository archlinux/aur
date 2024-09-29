# Maintainer: elitemikofan <elitemikofan (at) pm (dot) me>
# Contributor: whezzel <whezzel (at) gmail (dot) com>

pkgname=undefined-medium-fonts
_pkgname=undefined-medium
pkgver=1.3
pkgrel=1
pkgdesc='Package for undefined-medium-fonts. Includes ttf, otf, and webfonts.'
arch=('any')
url='https://undefined-medium.com/'
license=('OFL-1.1')
source=("${_pkgname}-${pkgver}-${pkgrel}.zip::https://github.com/andirueckel/${_pkgname}/archive/v${pkgver}.zip")
sha256sums=('a8e7d738177af224c0cd5f659a9504c2976ab0194c91be3777d01e80d0f121f8')

package()
{
    install -dm0775 "${pkgdir}"/usr/share/{fonts,licenses}/${_pkgname}
    install -Dm0644 "${srcdir}"/${_pkgname}-${pkgver}/fonts/{ttf,otf,webfonts}/* "${pkgdir}"/usr/share/fonts/${_pkgname}/
    install -Dm0644 "${srcdir}"/${_pkgname}-${pkgver}/OFL.txt "${pkgdir}"/usr/share/licenses/${_pkgname}/LICENSE
}
