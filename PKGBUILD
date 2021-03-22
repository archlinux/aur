# Maintainer: Barfin
# Contributor: DanielH, agstrc

pkgname=iriunwebcam-bin
pkgver=2.4
pkgrel=2
pkgdesc="Use your phone's camera as a wireless webcam in your PC."
arch=('any')
url="http://iriun.gitlab.io"
license=(unknown)
source=("iriunwebcam-${pkgver}.deb::http://iriun.gitlab.io/iriunwebcam-${pkgver}.deb")
options=('!strip')
depends=('jack' 'qt5-base' 'v4l2loopback-dkms' 'android-tools')

package() {
    tar -xf "${srcdir}/data.tar.xz" -C "${pkgdir}"
}

md5sums=('9ebc6c0f31fcffce744ffa589fe13100')
