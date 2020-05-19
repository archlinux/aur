# Maintainer: Manuel Coenen <manuel.coenen@gmail.com>
pkgname=duetwebcontrol-bin
pkgver=3.1.1
pkgrel=1
pkgdesc="Official web interface for Duet electronics"
arch=('any')
url="https://github.com/chrishamm/DuetWebControl.git"
license=('GPL3')
provides=("duetwebcontrol=${pkgver}")
conflicts=("duetwebcontrol")
source=("https://pkg.duet3d.com/dists/stable/armv7/binary-armhf/duetwebcontrol_${pkgver}_all.deb")
md5sums=('64308dfb82f633c2b51647505244ce12')
sha1sums=('c143d8877514754df472949c3b7f3efc9d6e1cf7')
sha256sums=('5b95f22d60af63a844c6ec4694458557b75a44773a51cd7dbb5f01b099707d2d')
sha512sums=('324892aff934564a09219610db3d58db9933a9611a6caed600b14aafe63a9b82a89c63de499d4f6846f60261606c0a73aaf707ba8b94bb116f1c20803b4fdc77')

prepare() {
    tar -xf data.tar.xz
}

package() {
	install -dm 755 "${pkgdir}/opt/dsf/dwc2"
	cp -R "${srcdir}/opt/dsf/dwc2/"* "${pkgdir}/opt/dsf/dwc2"
}
