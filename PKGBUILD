# Maintainer: Xavion <Xavion (dot) 0 (at) Gmail (dot) com>
# Contributor: Lucas Hermann Negri <kkndrox@gmail.org>

pkgname=lanes
pkgver=2.0.3
pkgrel=2
pkgdesc="A solution for running Lua multithreaded" 
arch=("i686" "x86_64")
url="http://kotisivu.dnainternet.net/askok/bin/lanes/index.html" 
depends=("lua>=5.1") 
license=("MIT")
source=(http://luaforge.net/frs/download.php/3927/${pkgname}-${pkgver}.tgz) 

build() { 
	cd "${srcdir}"/${pkgname}-${pkgver}

	make
}

package() {
	cd "${srcdir}"/${pkgname}-${pkgver}

	make DESTDIR="${pkgdir}"/usr install
}

sha1sums=('46d808569124b024f1d8ceaf9c10ea2c43852be3')
