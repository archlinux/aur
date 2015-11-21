# Maintainer: Carlos Silva <r3pek@r3pek.org>

pkgname=aircontrol2-beta
pkgver=2.0.Beta17.1318.151020.2002
pkgrel=1
pkgdesc="Ubiquiti AirControl2 Beta for controlling AirOS devices"
arch=('any')
license=('as-is')
url="https://community.ubnt.com/t5/airControl-2-Beta/bd-p/airControl_2_Beta"
depends=('java-runtime')
makedepends=()
source=(http://www.ubnt.com/downloads/aircontrol2/aircontrol2-${pkgver/.Beta/-Beta}-ubuntu.deb)
sha1sums=('a87eec58a235536070a037e8f6711571966d50cf')

package() {
	tar -zxf data.tar.gz -C "${pkgdir}"

	# Server not supported (for now)
	rm -rf ${pkgdir}/etc
}
