# Maintainer: Evilur <andrewflame@mail.ru>
pkgname=spwd
pkgver=1.0.0
pkgrel=3
epoch=0
pkgdesc='Program for displaying the current working directory in the shell prompt'
arch=('any')
url='https://github.com/Andrew-Flame/spwd.git'
license=('BSD-3')
install='spwd.install'
source=("https://github.com/Andrew-Flame/${pkgname}/archive/refs/tags/v${pkgver}.tar.gz")
sha512sums=('50d91387050e18e36cefaabc9c33357a9e07706b80a93dec7245fd79ef2d9b3ec530a3c1f5ca5563734ba842b24bc4b77b7874c2bdda848be803beb14f6f0b69')
makedepends=('gcc')

prepare() {
	tar -xf "v${pkgver}.tar.gz"
}

package() {
	gcc "${pkgname}-${pkgver}/spwd.c" -o /tmp/spwd.bin
}
