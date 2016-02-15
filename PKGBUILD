# Maintainer: Luca Weiss <WEI16416@spengergasse.at>

pkgname=timeslottracker
pkgver=1.2.9
pkgrel=1
pkgdesc="Simple and useful time tracker"
arch=('any')
url="https://sourceforge.net/projects/timeslottracker/"
license=('GPL2')
provides=("timeslottracker")
depends=("java-environment")
source=("http://downloads.sourceforge.net/project/timeslottracker/TimeSlotTracker/${pkgver}/timeslottracker_${pkgver}_all.deb")
md5sums=('4c528a47457cf5be3e899cd34cf66611')

package() {
	bsdtar xf data.tar.xz
	chmod -R g-w usr
	mv usr "${pkgdir}"
}

