# Maintainer: Manuel Coenen <manuel.coenen@gmail.com>
pkgname=duetwebcontrol-bin
pkgver=2.0.7
pkgrel=1
pkgdesc="Official web interface for Duet electronics"
arch=('any')
url="https://github.com/chrishamm/DuetWebControl.git"
license=('GPL3')
provides=("duetwebcontrol=${pkgver}")
conflicts=("duetwebcontrol")
source=("https://pkg.duet3d.com/dists/stable/armv7/binary-armhf/duetwebcontrol_${pkgver}-1_all.deb")
md5sums=('7a7fe0abf9419686ffc8a524e71cb554')
sha1sums=('537e8fc016d8268ae49eac37225640fc677b9fa9')
sha256sums=('1586128688615b41f8d248b2075e3b74e7ba1fcf18dfd4ef3cc70b869911e3cc')
sha512sums=('951951b4d9a059e68c101ecf879787240e86bdf5c0e321781fb6a9f0868501da99d4b6eef9262106e4a23236d937ecc329cbd0ab0fc2b1968e56d65f55843bad')

prepare() {
    tar -xf data.tar.xz
}

package() {
	install -dm 755 "${pkgdir}/opt/dsf/dwc2"
	cp -R "${srcdir}/opt/dsf/dwc2/"* "${pkgdir}/opt/dsf/dwc2"
}
