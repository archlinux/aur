# Maintainer: Xavion <Xavion (dot) 0 (at) Gmail (dot) com>
# Contributor: Lucas Hermann Negri <kkndrox@gmail.org>

pkgname=lanes
pkgver=3.12
pkgrel=1
pkgdesc="A solution for running Lua multithreaded"
url="https://github.com/LuaLanes/lanes"
arch=("i686" "x86_64")
depends=("lua>=5.1")
license=("MIT")
source=(git+https://github.com/LuaLanes/lanes.git)

build() {
	cd "${srcdir}"/${pkgname}

	make
}

package() {
	cd "${srcdir}"/${pkgname}

	make DESTDIR="${pkgdir}"/usr install
}

sha1sums=('SKIP')
