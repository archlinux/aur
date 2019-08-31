# Maintainer: Manuel Coenen <manuel.coenen@gmail.com>
pkgname=duetwebcontrol
pkgver=2.0.0.RC8.b3
pkgrel=2
pkgdesc="Official web interface for Duet electronics"
arch=('any')
url="https://github.com/chrishamm/DuetWebControl"
license=('GPL3')
provides=('duetwebcontrol')
conflicts=('duetwebcontrol')
source=("https://pkg.duet3d.com/dists/unstable/armv7/binary-armhf/duetwebcontrol_2.0.0-3.deb")
sha256sums=('a2f02baaf32fa14323dd58a31af9c98ec651d212da75e4e0388dc8f1d26c7c10')

prepare() {
    tar -xf data.tar.xz
}

package() {
	install -dm 755 "${pkgdir}/opt/dsf/dwc2"
	cp -R "${srcdir}/opt/dsf/dwc2/"* "${pkgdir}/opt/dsf/dwc2"
}
