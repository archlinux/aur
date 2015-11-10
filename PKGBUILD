# Maintainer: Michael Tiebesl <email@tiebesl.com>

_gitname=Plat
_pkgname=Plat
pkgname=('plat-icon-theme-git')
pkgver=1.0
pkgrel=1
pkgdesc="A flat design icon theme by MichaelTiebesl"
arch=('any')
makedepends=('git')
url="https://github.com/MichaelTiebesl/${_gitname}"
license=('GPL3')
options=('!strip')
conflicts=('plat-icon-theme')
source=("git+${url}.git")
sha256sums=('SKIP')


package() {
    install -d ${pkgdir}/usr/share/icons
    cp -r ${srcdir}/${_gitname}/${_pkgname} ${pkgdir}/usr/share/icons/${_pkgname}
    find ${pkgdir}/usr -type f -exec chmod 644 {} \;
    find ${pkgdir}/usr -type d -exec chmod 755 {} \;
} 

