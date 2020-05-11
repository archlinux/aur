# Maintainer: Barfin
pkgname=iriunwebcam-bin
pkgver=2.0
pkgrel=1
pkgdesc="Use your phone's camera as a wireless webcam in your PC."
arch=(x86_64)
url="http://iriun.gitlab.io"
license=(unknown)
source=("iriunwebcam.deb::http://iriun.gitlab.io/iriunwebcam.deb")
options=('!strip')
depends=('bluez' 'qt5-base' 'v4l2loopback-dkms')

package() {
	tar -xf "${srcdir}/data.tar.xz" -C "${pkgdir}"
}

md5sums=('ce4492c4d75732a48801966bc75c5d9a')
