# Maintainer: Christian Hesse <mail@eworm.de>

pkgname=dhcpcd-hook-ntpdate
pkgver=0.2.1
pkgrel=1
pkgdesc='Hook for dhcpcd to sync time as soon as connection is up'
arch=('any')
depends=('ntp' 'dhcpcd')
makedepends=('git')
url='https://github.com/eworm-de/dhcpcd-hook-ntpdate'
license=('GPL')
validpgpkeys=('BD84DE71F493DF6814B0167254EDC91609BC9183') # Christian Hesse <mail@eworm.de>
source=("git+https://github.com/eworm-de/dhcpcd-hook-ntpdate.git#tag=${pkgver}?signed")
sha256sums=('SKIP')

package() {
	cd dhcpcd-hook-ntpdate/

	make DESTDIR="${pkgdir}" install
}

