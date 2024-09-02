
# Maintainer: Danil Vagapov <vagapov.danil@foobar.com>

pkgname=linuxcnc-ethercat
commit=938387ded
pkgver="0.9.1.${commit}"
pkgrel=1
pkgdesc='LinuxCNC EtherCAT HAL driver'
arch=('x86_64')
url='https://github.com/sittner/linuxcnc-ethercat/'
license=('GPL-2.0')
depends=('linuxcnc' 'etherlab-ethercat')
makedepends=('git' 'make')
source=("git+https://github.com/sittner/linuxcnc-ethercat/#commit=${commit}")
sha256sums=('SKIP')

package() {
	cd linuxcnc-ethercat/
	LDFLAGS="" make DESTDIR=${pkgdir} install
}