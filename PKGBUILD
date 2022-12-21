# Maintainer: F-TD5X <F-TD5X@mail.maye.moe>

pkgname=librga-bin-git
pkgver=1.8.1
pkgrel=1
pkgdesc="rockchip rga library"
arch=('aarch64')
url="https://github.com/airockchip/librga"
license=('Apache License 2.0')
conflicts=('librga')
provides=('librga')
source=('git+https://github.com/airockchip/librga')
sha256sums=('SKIP')

package() {
	cd librga
	mkdir -p $pkgdir/usr/include/rga
	mkdir -p $pkgdir/usr/lib
	cp -r include/* $pkgdir/usr/include/rga/
	cp -r libs/Linux/gcc-aarch64/* $pkgdir/usr/lib/
}


