# Maintainer: hashworks <mail@hashworks.net>

pkgname=prismatik-psieg-bin
pkgver=5.11.2.23
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
sha256sums=("cde00d39ae695edf71c0c5e71958ed3304f6321049ec877abfa4419d55550ab4")

package() {
	tar xf data.tar.xz -C "${pkgdir}"
	chmod -R g-w "${pkgdir}"
}
