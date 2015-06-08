# Maintainer: FadeMind <fademind@gmail.com>

_pkgname=win31x
pkgname=gtk2-theme-${_pkgname}
pkgver=1.4
pkgrel=2
pkgdesc="Windows 3.1 GTK2 Theme"
arch=('any')
url="http://opendesktop.org/content/show.php?content=169112"
license=('GPL')
depends=('gtk-engines')
source=("${pkgname}-${pkgver}.tgz::http://opendesktop.org/CONTENT/content-files/169112-${_pkgname}.tgz")
sha256sums=('8adc326d5ce10487a06c3181cf3cc2e074e60206c2193c33ef3ec76874fe523d')

package() {
  install -dm755 "${pkgdir}/usr/share/themes"
  cp -rf "${srcdir}/Win3x" "${pkgdir}/usr/share/themes"
  find ${pkgdir}/usr -type f -name '*rc~' -delete
  find ${pkgdir}/usr -type f -exec chmod 644 {} \;
  find ${pkgdir}/usr -type d -exec chmod 755 {} \;
} 
