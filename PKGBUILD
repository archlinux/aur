# Maintainer: Manuel Coenen <manuel.coenen@gmail.com>
pkgname=duetwebcontrol-bin
pkgver=3.1.0
pkgrel=1
pkgdesc="Official web interface for Duet electronics"
arch=('any')
url="https://github.com/chrishamm/DuetWebControl.git"
license=('GPL3')
provides=("duetwebcontrol=${pkgver}")
conflicts=("duetwebcontrol")
source=("https://pkg.duet3d.com/dists/stable/armv7/binary-armhf/duetwebcontrol_${pkgver}_all.deb")
md5sums=('4c01e4cde3ab9c2425857cbaf684043f')
sha1sums=('3c0f5e1f38376484e0b7e26b3f4ce7175e352cec')
sha256sums=('36d0eb3e9c28a7203237f66c536a5dd4ca90aaaf4407a7a63e188f2fda5f3751')
sha512sums=('20b0fce9fe0cab6b77b0748d1166c33c176cd3f981183f0298ffdf56b4cf8738ed04561d66b11c70ca5ca22ec819a83cf98e6d56eaa12ba084e4688f4c83f46a')

prepare() {
    tar -xf data.tar.xz
}

package() {
	install -dm 755 "${pkgdir}/opt/dsf/dwc2"
	cp -R "${srcdir}/opt/dsf/dwc2/"* "${pkgdir}/opt/dsf/dwc2"
}
