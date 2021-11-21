# Maintainer: jokersus <jokersus.cava@gmail.com>
_pkgname=f3d
_pkgown=f3d-app
pkgname=${_pkgname}-bin
pkgver=1.1.0
pkgrel=1
epoch=1
pkgdesc='A fast and minimalist 3D viewer'
arch=('x86_64')
url="https://github.com/$_pkgown/$_pkgname"
license=('BSD')
provides=('f3d')
conflicts=('f3d')
source=("$url/releases/download/v$pkgver/$_pkgname-$pkgver-Linux.tar.xz")
sha256sums=('8a0968437463a1713e16be16216fe30fea5a34ae1546de6ceb5187effd96dbc1')

package() {
    cd "$_pkgname-$pkgver-Linux"
	install -Dm755 "./bin/${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
	cp -r "./share" "${pkgdir}/usr/share/"
}
