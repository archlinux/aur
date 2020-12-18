# Maintainer: Barfin
pkgname=iriunwebcam-bin
pkgver=2.3
pkgrel=1
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

md5sums=('493c417aab60e64ba6e7e1e3bd7fae9d')
