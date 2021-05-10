# Maintainer: Frederic Bezies <fredbezies at gmail dot com>
# Contributor: Luca Weiss <luca (at) z3ntu (dot) xyz>

pkgname=timeslottracker
pkgver=1.3.23
pkgrel=1
pkgdesc="Simple and useful time tracker"
arch=('any')
url="https://github.com/TimeSlotTracker/timeslottracker-desktop/"
license=('GPL2')
provides=("timeslottracker")
depends=("java-environment")
source=("https://github.com/TimeSlotTracker/timeslottracker-desktop/releases/download/v1.3.23/timeslottracker_1.3.23_all.deb")

package() {
  bsdtar xf data.tar.xz
  chmod -R g-w usr
  mv {etc,usr,var} $pkgdir/
  chmod -R 755 $pkgdir/etc
  chmod -R 755 $pkgdir/var
}

# vim:set ts=2 sw=2 et:
sha256sums=('124f853ab164060be7de5214deba419005c61ad1fee34f95a7a60f6b8addd3c1')
