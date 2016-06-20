# Maintainer: Davorin Učakar <davorin.ucakar@gmail.com>

pkgname=xcursor-openzone
pkgver=1.2.5
pkgrel=2
pkgdesc="OpenZone X11 cursor theme"
url='https://www.opendesktop.org/p/999999/'
arch=('any')
license=('custom:xcursor-openzone')
source=('https://dl.opendesktop.org/api/files/download?id=1462316428')
md5sums=('4bb8b3e96d3c7be22db383977a758498')

package() {
  install -D -d -m755 ${pkgdir}/usr/share/icons
  for theme in Black Black_Slim White White_Slim Ice Ice_Slim Fire Fire_Slim; do
    tar xf ${srcdir}/OpenZone/OpenZone_${theme}-${pkgver}.tar.xz -C ${pkgdir}/usr/share/icons
  done
  install -D -m644 ${srcdir}/OpenZone/COPYING ${pkgdir}/usr/share/licenses/${pkgname}/COPYING
}
