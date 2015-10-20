# Maintainer: FadeMind <fademind@gmail.com>

_gitname=El-General
_pkgname=ElGeneral
pkgname=('elgeneral-icon-theme')
pkgver=1.2.0.1
pkgrel=1
pkgdesc="An icon theme for Plasma Desktop"
arch=('any')
url="https://github.com/fabianalexisinostroza/${_gitname}"
license=('GPL3')
options=('!strip')
conflicts=('elgeneral-icon-theme-git')
source=("v${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
sha256sums=('4105182c2bf8b3f900b50df091fad7229bae5156f003da2407756f15824a0c4f')

package() {
    install -d ${pkgdir}/usr/share/icons
    cp -r ${srcdir}/${_gitname}-${pkgver}/${_pkgname} ${pkgdir}/usr/share/icons/${_pkgname}
    find ${pkgdir}/usr -type f -exec chmod 644 {} \;
    find ${pkgdir}/usr -type d -exec chmod 755 {} \;
} 
