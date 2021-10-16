# Maintainer: jokersus <jokersus.cava@gmail.com>
_pkgname=f3d
pkgname=${_pkgname}-bin
pkgver=1.1.0
pkgrel=1
epoch=1
pkgdesc='A fast and minimalist 3D viewer'
arch=('x86_64')
url='https://gitlab.kitware.com/${pkgname}/${pkgname}'
license=('BSD')
provides=('f3d')
conflicts=('f3d')
source=("https://gitlab.kitware.com/f3d/f3d/uploads/937b2b6c8a14b40538983195395b4094/$_pkgname-$pkgver-Linux.tar.xz")
sha256sums=('8a0968437463a1713e16be16216fe30fea5a34ae1546de6ceb5187effd96dbc1')

package() {
    cd "$_pkgname-$pkgver-Linux"
	install -Dm755 "./bin/${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
	cp -r "./share" "${pkgdir}/usr/share/"
}