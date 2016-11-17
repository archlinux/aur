# Maintainer: Luca Weiss <luca (at) z3ntu (dot) xyz>

pkgname=timeslottracker
pkgver=1.3.1
pkgrel=1
pkgdesc="Simple and useful time tracker"
arch=('any')
url="https://sourceforge.net/projects/timeslottracker/"
license=('GPL2')
provides=("timeslottracker")
depends=("java-environment")
source=("http://downloads.sourceforge.net/project/timeslottracker/TimeSlotTracker/${pkgver}/timeslottracker_${pkgver}_all.deb")
md5sums=('154c3b0777f2b94049f2d6b9d5dc2581')

package() {
  bsdtar xf data.tar.xz
  chmod -R g-w usr
  mv {etc,usr,var} $pkgdir/
  chmod -R 755 $pkgdir/etc
  chmod -R 755 $pkgdir/var
}

# vim:set ts=2 sw=2 et:
