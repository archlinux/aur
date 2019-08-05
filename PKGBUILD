# Maintainer: Manuel Coenen <manuel.coenen@gmail.com>
pkgname=duetwebcontrol
pkgver=2.0.0.RC8.b1
pkgrel=2
pkgdesc="Official web interface for Duet electronics"
arch=('any')
url="https://github.com/chrishamm/DuetWebControl"
license=('GPL3')
provides=('duetwebcontrol')
conflicts=('duetwebcontrol')
source=("https://chrishamm.io/debian/dists/buster/dsf/binary-armhf/duetwebcontrol_2.0.0.deb")
sha256sums=('7abf57e9d2fa9211a7f201e773a53a88a196d7692381b324a3d17969f4e9cceb')

prepare() {
    tar -xf data.tar.xz
}

package() {
	install -dm 755 "${pkgdir}/opt/dsf/dwc2"
	cp -R "${srcdir}/opt/dsf/dwc2/"* "${pkgdir}/opt/dsf/dwc2"
}
