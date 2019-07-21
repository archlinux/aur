# Maintainer: Manuel Coenen <manuel.coenen@gmail.com>
pkgname=duetwebcontrol
pkgver=2.0.0.RC8.b1
pkgrel=1
pkgdesc="Official web interface for Duet electronics"
arch=('any')
url="https://github.com/chrishamm/DuetWebControl"
license=('GPL3')
provides=('duetwebcontrol')
conflicts=('duetwebcontrol')
source=("https://chrishamm.io/debian/dists/stretch/dsf/binary-armhf/duetwebcontrol_2.0.0.deb")
sha256sums=('d400cf8e515fcd9f4402c42f92be4bdb44384d729c7563009eb42d7bf1cb2f22')

prepare() {
    tar -xf data.tar.xz
}

package() {
	install -dm 755 "${pkgdir}/opt/dsf/dwc2"
	cp -R "${srcdir}/opt/dsf/dwc2/"* "${pkgdir}/opt/dsf/dwc2"
}
