# Maintainer: Grigorii Horos <horosgrisa@gmail.com>

_git=8550feba2cbd019c34a5b679783129be29efc67f
pkgname=breeze-icons-extras
pkgver=20151121
pkgrel=2
pkgdesc="Breeze extras icons for KDE Plasma."
arch=('any')
url="https://github.com/horosgrisa/breeze-icon-theme-extras/"
license=('LGPL3')
depends=()
makedepends=('git' 'fakeroot')
options=('!strip')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/${_git}.tar.gz")
sha256sums=('a5601ba2a218f7f5c213a9940d2f11c2327291fdac1cde73cfb03e4223465a36')

package() {
    install -d ${pkgdir}/usr/share/icons/breeze/
    cp -R ${srcdir}/breeze-icon-theme-extras-${_git}/Breeze/* ${pkgdir}/usr/share/icons/breeze/
 #   cp -R ${srcdir}/breeze-icon-theme-extras-${_git}/Breeze/* ${pkgdir}/usr/share/icons/breeze/
    cp -R ${srcdir}/breeze-icon-theme-extras-${_git}/Breeze/* ${pkgdir}/usr/share/icons/breeze/
    cp -R ${srcdir}/breeze-icon-theme-extras-${_git}/Breeze/* ${pkgdir}/usr/share/icons/breeze/
}
 