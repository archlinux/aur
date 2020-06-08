# Maintainer: hashworks <mail@hashworks.net>

pkgname=prismatik-bin
pkgver=5.11.2
pkgrel=3
pkgdesc="A controller for usb driven LED backlights"
arch=('x86_64')
url="https://github.com/woodenshark/Lightpack"
license=('GPL3')
depends=('qt5-serialport' 'libxkbcommon-x11')
provides=('lightpack' 'prismatik')
conflicts=('prismatik')
install=prismatik.install
source=("${url}/releases/download/${pkgver}/prismatik_${pkgver}_amd64.deb")
sha256sums=('a97f88a9eec9f91b076d2f6b6117b03470fff71e9b18fe595ebe377220871c6f')

package() {
	tar xf data.tar.xz -C "${pkgdir}"
	chmod -R g-w "${pkgdir}"
}
