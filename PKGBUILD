# Maintainer: Grigorii Horos <horosgrisa@gmail.com>

_git=6077af44e4b00f114cf08095962a79d321dbd456
pkgname=breeze-icons-extras
pkgver=20151121
pkgrel=1
pkgdesc="Breeze extras icons for KDE Plasma."
arch=('any')
url="https://github.com/horosgrisa/breeze-icon-theme-extras/"
license=('LGPL3')
depends=()
makedepends=('git' 'fakeroot')
options=('!strip')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/${_git}.tar.gz")
sha256sums=('40e4d76f8231638392369486efff7b716b692996de6bfa91ef237901a4364cf7')

package() {
    install -d ${pkgdir}/usr/share/icons/breeze/
    cp -R ${srcdir}/breeze-icon-theme-extras-${_git}/Breeze/* ${pkgdir}/usr/share/icons/breeze/
 #   cp -R ${srcdir}/breeze-icon-theme-extras-${_git}/Breeze/* ${pkgdir}/usr/share/icons/breeze/
    cp -R ${srcdir}/breeze-icon-theme-extras-${_git}/Breeze/* ${pkgdir}/usr/share/icons/breeze/
    cp -R ${srcdir}/breeze-icon-theme-extras-${_git}/Breeze/* ${pkgdir}/usr/share/icons/breeze/
}
 