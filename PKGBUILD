# Maintainer: FadeMind <fademind@gmail.com>

_gitname=El-General
_pkgname=ElGeneral
pkgname=('elgeneral-icon-theme')
pkgver=1.2.1
pkgrel=1
pkgdesc="An icon theme for Plasma Desktop"
arch=('any')
url="https://github.com/fabianalexisinostroza/${_gitname}"
license=('GPL3')
options=('!strip')
conflicts=('elgeneral-icon-theme-git')
source=("v${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
sha256sums=('d445c5605e2ecffe2d79cf43978ca808f4a1f45370ea9456f671f1bb34e7f40d')

package() {
    install -d ${pkgdir}/usr/share/icons
    cp -r ${srcdir}/${_gitname}-${pkgver}/${_pkgname} ${pkgdir}/usr/share/icons/${_pkgname}
    find ${pkgdir}/usr -type f -exec chmod 644 {} \;
    find ${pkgdir}/usr -type d -exec chmod 755 {} \;
} 
