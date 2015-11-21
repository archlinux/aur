# Maintainer: Grigorii Horos <horosgrisa@gmail.com>

_git=b965930d7bfdd2cc4f55e40504186703770e52e6
pkgname=breeze-icons-extras
pkgver=20151119
pkgrel=1
pkgdesc="Breeze extras icons for KDE Plasma."
arch=('any')
url="https://github.com/horosgrisa/breeze-icon-theme-extras/"
license=('LGPL3')
depends=()
makedepends=('git' 'fakeroot')
options=('!strip')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/${_git}.tar.gz")
sha256sums=('f371f1f4c5795b126bb2db9317a62a7ba5ec948095b6cf739d2521f2aecb1d34')

package() {
    install -d ${pkgdir}/usr/share/icons/breeze/places/{16,22,32,64}
    cp ${srcdir}/breeze-icon-theme-extras-${_git}/Breeze/places/16/folder-{dropbox,gdrive,owncloud}.svg ${pkgdir}/usr/share/icons/breeze/places/16
 #   cp ${srcdir}/breeze-icon-theme-extras-${_git}/Breeze/places/22/folder-{dropbox,gdrive,owncloud}.svg ${pkgdir}/usr/share/icons/breeze/places/22
    cp ${srcdir}/breeze-icon-theme-extras-${_git}/Breeze/places/32/folder-{dropbox,gdrive,owncloud}.svg ${pkgdir}/usr/share/icons/breeze/places/32
    cp ${srcdir}/breeze-icon-theme-extras-${_git}/Breeze/places/64/folder-{dropbox,gdrive,owncloud}.svg ${pkgdir}/usr/share/icons/breeze/places/64
}
 