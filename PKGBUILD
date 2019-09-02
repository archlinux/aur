# Maintainer: Manuel Coenen <manuel.coenen@gmail.com>
pkgname=duetwebcontrol-bin
pkgver=2.0.0.RC8.b3
pkgrel=1
pkgdesc="Official web interface for Duet electronics"
arch=('any')
url="https://github.com/chrishamm/DuetWebControl"
license=('GPL3')
provides=('duetwebcontrol')
conflicts=('duetwebcontrol')
source=("https://pkg.duet3d.com/dists/stable/armv7/binary-armhf/duetwebcontrol_2.0.0-3.deb")
sha256sums=('ed69bc775046f07ff03ea5050d1eff19b7076ad5d2d3e4df673568836d20ffbe')

prepare() {
    tar -xf data.tar.xz
}

package() {
	install -dm 755 "${pkgdir}/opt/dsf/dwc2"
	cp -R "${srcdir}/opt/dsf/dwc2/"* "${pkgdir}/opt/dsf/dwc2"
}
