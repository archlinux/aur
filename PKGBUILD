# Maintainer: Davorin Učakar <davorin.ucakar@gmail.com>

pkgname=xcursor-openzone
pkgver=1.2.4
pkgrel=1
pkgdesc="OpenZone X11 cursor theme"
url="http://opendesktop.org/content/show.php/OpenZone?content=111343"
arch=('any')
license=('custom:xcursor-openzone')
source=("http://opendesktop.org/CONTENT/content-files/111343-OpenZone-${pkgver}.tar.xz")
sha1sums=('3cdc4841689f022436d6e83dd5587313e65efc17')

package() {
  install -D -d -m755 ${pkgdir}/usr/share/icons
  for theme in Black Black_Slim White White_Slim Ice Ice_Slim Fire Fire_Slim; do
    tar xf ${srcdir}/OpenZone/OpenZone_${theme}-${pkgver}.tar.xz -C ${pkgdir}/usr/share/icons
  done
  install -D -m644 ${srcdir}/OpenZone/COPYING ${pkgdir}/usr/share/licenses/${pkgname}/COPYING
}
