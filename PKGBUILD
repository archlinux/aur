# Maintainer: FadeMind <fademind@gmail.com>

_gitname=El-General
_pkgname=ElGeneral
pkgname=('elgeneral-icon-theme')
pkgver=1.3
pkgrel=1
pkgdesc="An icon theme for Plasma Desktop"
arch=('any')
url="https://github.com/fabianalexisinostroza/${_gitname}"
license=('GPL3')
options=('!strip')
conflicts=('elgeneral-icon-theme-git')
source=("v${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
sha256sums=('84b2fe1f64c872ff99032188b85c498e303285eb29026e765c8627220c16bf84')

package() {
    install -d ${pkgdir}/usr/share/icons
    cp -r ${srcdir}/${_gitname}-${pkgver}/${_pkgname} ${pkgdir}/usr/share/icons/${_pkgname}
    find ${pkgdir}/usr -type f -exec chmod 644 {} \;
    find ${pkgdir}/usr -type d -exec chmod 755 {} \;
} 
