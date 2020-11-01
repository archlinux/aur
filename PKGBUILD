# Maintainer: hashworks <mail@hashworks.net>

pkgname=prismatik-psieg-bin
pkgver=5.11.2.25
pkgrel=1
pkgdesc="A controller for usb driven LED backlights (an unofficial fork)"
arch=('x86_64')
url="https://github.com/psieg/Lightpack"
license=('GPL3')
depends=('qt5-serialport' 'libxkbcommon-x11')
provides=('lightpack' 'prismatik' 'prismatik-psieg')
conflicts=('lightpack' 'prismatik' 'prismatik-psieg')
install=prismatik.install
source=("${url}/releases/download/${pkgver}/prismatik_${pkgver}_amd64.deb")
sha256sums=("2dd715a8150a46ba98cbccee5a59e477d762d3f1284679b7a4f17b0d93f07040")

package() {
	tar xf data.tar.xz -C "${pkgdir}"
	chmod -R g-w "${pkgdir}"
}
