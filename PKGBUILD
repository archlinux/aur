# Maintainer: David P. <megver83@openmailbox.org>

pkgname=pm-quirks
_date=20100619
pkgver=0.${_date}
pkgrel=6
pkgdesc="Quirks data for pm-utils"
arch=('x86_64')
license=('GPL')
url="http://pm-utils.freedesktop.org/wiki/"
source=("http://pm-utils.freedesktop.org/releases/${pkgname}-${_date}.tar.gz")
md5sums=('3b6ee39056b9ece0cd5e073a4c272b05')

package() {
  cd ${srcdir}
  install -m755 -d ${pkgdir}/usr/lib/pm-utils/video-quirks
  install -m644 video-quirks/*.quirkdb ${pkgdir}/usr/lib/pm-utils/video-quirks/
}
