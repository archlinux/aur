# Maintainer: Barfin
pkgname=iriunwebcam-bin
pkgver=2.2
pkgrel=2
pkgdesc="Use your phone's camera as a wireless webcam in your PC."
arch=('any')
url="http://iriun.gitlab.io"
license=(unknown)
source=("iriunwebcam.deb::http://iriun.gitlab.io/iriunwebcam.deb")
options=('!strip')
depends=('jack' 'qt5-base' 'v4l2loopback-dkms' 'adb')

package() {
	tar -xf "${srcdir}/data.tar.xz" -C "${pkgdir}"
}

md5sums=('44724115737d08fc953665bafc5f74a8')
