# Maintainer: Grigorii Horos <horosgrisa@gmail.com>

_git=44d2e6dfa4f7766e3ba6620287e65545dea4c481 # lastest commit 20150806
pkgname=breeze-icons-extras
pkgver=20151112
pkgrel=1
pkgdesc="Breeze extras icons for KDE Plasma."
arch=('any')
url="https://github.com/NitruxSA/breeze-icon-theme/"
license=('LGPL3')
depends=()
makedepends=('git' 'fakeroot')
options=('!strip')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/${_git}.tar.gz")
sha256sums=('SKIP')

package() {
    install -d ${pkgdir}/usr/share/icons/breeze/places/{16,22,32,64}
    cp ${srcdir}/breeze-icon-theme-${_git}/Breeze/places/16/folder-{dropbox,gdrive}.svg ${pkgdir}/usr/share/icons/breeze/places/16
 #   cp ${srcdir}/breeze-icon-theme-${_git}/Breeze/places/22/folder-{dropbox,gdrive}.svg ${pkgdir}/usr/share/icons/breeze/places/22
    cp ${srcdir}/breeze-icon-theme-${_git}/Breeze/places/32/folder-{dropbox,gdrive}.svg ${pkgdir}/usr/share/icons/breeze/places/32
    cp ${srcdir}/breeze-icon-theme-${_git}/Breeze/places/64/folder-{dropbox,gdrive}.svg ${pkgdir}/usr/share/icons/breeze/places/64
}
 