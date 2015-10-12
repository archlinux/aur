pkgname=aircontrol2-beta
pkgver=2.0.Beta16.1257.150922.1612
pkgrel=1
pkgdesc="Ubiquiti AirControl2 Beta for controlling AirOS devices"
arch=('any')
license=('as-is')
url="https://community.ubnt.com/t5/airControl-2-Beta/bd-p/airControl_2_Beta"
depends=('java-runtime')
makedepends=()
source=(http://www.ubnt.com/downloads/aircontrol2/aircontrol2-${pkgver/.Beta/-Beta}-ubuntu.deb)
sha1sums=('69c403edfa6e978eeb8e4026e2ec133233f681b2')

package() {
	tar -zxf data.tar.gz -C "${pkgdir}"

	# Server not supported (for now)
	rm -rf ${pkgdir}/etc
}
