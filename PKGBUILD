# Maintainer: Christian Hesse <mail@eworm.de>

pkgname=dhcpcd-hook-pdnsd
pkgver=0.2.1
pkgrel=1
pkgdesc='Hook for dhcpcd to add domain name servers to pdnsd (dns caching proxy)'
arch=('any')
depends=('pdnsd' 'dhcpcd')
makedepends=('git')
url='https://github.com/eworm-de/dhcpcd-hook-pdnsd'
license=('GPL')
validpgpkeys=('BD84DE71F493DF6814B0167254EDC91609BC9183') # Christian Hesse <mail@eworm.de>
source=("git+https://github.com/eworm-de/dhcpcd-hook-pdnsd.git#tag=${pkgver}?signed")
install=dhcpcd-hook-pdnsd.install
sha256sums=('SKIP')

package() {
	cd dhcpcd-hook-pdnsd/

	make DESTDIR="${pkgdir}" install
}

