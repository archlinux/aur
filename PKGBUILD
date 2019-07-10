# Maintainer: Manuel Coenen <manuel.coenen@gmail.com>
pkgname=duetwebcontrol
pkgver=2.0.0.RC7
pkgrel=2
pkgdesc="Official web interface for Duet electronics"
arch=('any')
url="https://github.com/chrishamm/DuetWebControl"
license=('GPL3')
provides=('duetwebcontrol')
conflicts=('duetwebcontrol')
source=('https://chrishamm.io/debian/dists/stretch/dsf/binary-armhf/duetwebcontrol_2.0.0.deb')
sha256sums=('f411bdb9337f31d1b01fc0d0caefa45bd58efc5181abf089411f2334212b562a')

prepare() {
    tar -xf data.tar.xz
}

package() {
	install -dm 755 "${pkgdir}/opt/dsf/dwc2"
	cp -R "${srcdir}/opt/dsf/dwc2/"* "${pkgdir}/opt/dsf/dwc2"
}
