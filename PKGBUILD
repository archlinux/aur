# Maintainer: Davorin Učakar <davorin.ucakar@gmail.com>

pkgname=xcursor-openzone
pkgver=1.2.6
pkgrel=1
pkgdesc="OpenZone X11 cursor theme"
url='https://www.opendesktop.org/p/999999/'
arch=('any')
license=('custom:xcursor-openzone')
source=('https://dl.opendesktop.org/api/files/downloadfile/id/1514377984/s/9f5df49ae77e446a49c724de84f97fb3/t/1514381703/OpenZone-1.2.6.tar.xz')
md5sums=('45913005bad7180d001642cc0452354a')

package() {
  install -D -d -m755 ${pkgdir}/usr/share/icons
  for theme in Black Black_Slim White White_Slim Ice Ice_Slim Fire Fire_Slim; do
    tar xf ${srcdir}/openzone-cursors/OpenZone_${theme}-${pkgver}.tar.xz -C ${pkgdir}/usr/share/icons
  done
  install -D -m644 ${srcdir}/openzone-cursors/COPYING ${pkgdir}/usr/share/licenses/${pkgname}/COPYING
}
