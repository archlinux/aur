# Maintainer: Michael Tiebesl <meinalmere@gmail.com>

_gitname=Plat
_pkgname=Plat
pkgname=('plat-icon-theme')
pkgver=4.1
pkgrel=1
pkgdesc="Plat is a flat icon theme. It is based on Ursa Icon Theme and Masalla Icon Theme and comes with Flat UI colors."
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

