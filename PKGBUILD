# Maintainer: hashworks <mail@hashworks.net>

pkgname=prismatik-psieg
pkgver=5.11.2.19
pkgrel=1
pkgdesc="A controller for usb driven LED backlights. An unofficial fork."
arch=('x86_64')
url="https://github.com/psieg/Lightpack"
license=('GPL3')
depends=('qt5-serialport' 'libxkbcommon-x11')
provides=('lightpack' 'prismatik')
conflicts=('prismatik')
install=prismatik.install
source=("${url}/releases/download/${pkgver}/prismatik_${pkgver}_amd64.deb")
sha256sums=('07248fe7d9950747b6c73bb0b382dfd3b84219d8675b65c3a5f08b5bc83d1ac8')

package() {
	tar xf data.tar.xz -C "${pkgdir}"
	chmod -R g-w "${pkgdir}"
}
