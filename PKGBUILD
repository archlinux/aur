# Maintainer: Luke Johnston <lukejohnston at outlook dot com>
pkgname="3mf2stl"
pkgver=1.0
pkgrel=1
pkgdesc="Convert 3mf files to stl"
depends=("gcc-libs" "libzip")
arch=("x86_64")
url="https://github.com/lemgandi/3mf2stl"
source=("git+https://github.com/lemgandi/3mf2stl.git")
license=("GPL3")
provides=("3mf2stl")
md5sums=('SKIP')

build() {
	cd "${srcdir}/3mf2stl"
	make
}

package() {
	cd "${srcdir}/3mf2stl"
	mkdir -p "${pkgdir}/usr/bin"
	cp 3mf2stl "${pkgdir}/usr/bin"
}
