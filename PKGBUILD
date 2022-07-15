# Maintainer: Brittany Figueroa <dormwear underscore iure at crowley dot seership dot dev>

pkgname=broadcom-bt-firmware
pkgver=10.1.0.1115
_pkgver='12.0.1.1105_p3'
pkgrel=1
pkgdesc='Firmware for Broadcom Bluetooth devices'
arch=('x86_64')
url="https://github.com/winterheart/${pkgname}"
license=(
	'custom'
	'MIT'
)
source=("${url}/releases/download/v${_pkgver}/${pkgname}-${pkgver}.deb")
conflicts=("${pkgname}-git")
b2sums=('b261cebd2996ca322accc0639c927772f92744eb51c3c1ac44dd3cd887b0db25a60b471db379faaf5a16d2ce57b23614920d56b36e0ea2f40a3d2fdd7e8c12a2')

package() {
	tar \
		--extract \
		--file data.tar.gz \
		--directory "${pkgdir}"
}
