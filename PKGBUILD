# Maintainer: khhs khhs1671@gmail.com

pkgname="libmemstack"
pkgver="1.1.0"
pkgrel="0"
pkgdesc="A small lib for managing memory"
arch=("x86_64" "arm")
depends=("make" "gcc")
license=("custom")
source=("memstack-$pkgver.tar.gz")
sha512sums=("SKIP")
conflicts=("libmemstack-git")
package() {
	mkdir -p "${pkgdir}/usr/lib"
	mkdir -p "${pkgdir}/usr/include"
	tar -xf ${source}
	make --directory=memstack-${pkgver} install INSTALL_PATH="${pkgdir}/usr"
}

