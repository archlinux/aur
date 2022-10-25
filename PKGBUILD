# Maintainer: Christian Hesse <mail@eworm.de>

pkgname=dhcpcd-hook-openvpn
pkgver=0.2.1
pkgrel=1
pkgdesc='Hook for dhcpcd to send SIGUSR1 to openvpn and reestablish connection'
arch=('any')
depends=('openvpn' 'dhcpcd')
makedepends=('git')
url='https://github.com/eworm-de/dhcpcd-hook-openvpn'
license=('GPL')
validpgpkeys=('BD84DE71F493DF6814B0167254EDC91609BC9183') # Christian Hesse <mail@eworm.de>
source=("git+https://github.com/eworm-de/dhcpcd-hook-openvpn.git#tag=${pkgver}?signed")
sha256sums=('SKIP')

package() {
	cd dhcpcd-hook-openvpn/

	make DESTDIR="${pkgdir}" install
}

