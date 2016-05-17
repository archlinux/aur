# Maintainer: Luca Weiss <WEI16416@spengergasse.at>

pkgname=timeslottracker
pkgver=1.3.0
pkgrel=1
pkgdesc="Simple and useful time tracker"
arch=('any')
url="https://sourceforge.net/projects/timeslottracker/"
license=('GPL2')
provides=("timeslottracker")
depends=("java-environment")
source=("http://downloads.sourceforge.net/project/timeslottracker/TimeSlotTracker/${pkgver}/timeslottracker_${pkgver}_all.deb")
md5sums=('e5f6b0f936d866f066a070e562170d6e')

package() {
	bsdtar xf data.tar.xz
	chmod -R g-w usr
	mv {etc,usr,var} "${pkgdir}"
}

