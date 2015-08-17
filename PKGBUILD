# Maintainer: Michał Szymański <smiszym at gmail dot com>

pkgname=openpipe
pkgver=0.0.5
pkgrel=1
pkgdesc="Puzzle game with simple rules"
arch=('i686' 'x86_64')
url="https://smiszym.github.io/openpipe"
license=('GPL')
depends=('libpng' 'glfw' 'libsndfile' 'openal')
source=("https://github.com/smiszym/openpipe/archive/v${pkgver}.tar.gz")
md5sums=('7030b217543b9063901bb5a810a774ef')

build()
{
	cd ${srcdir}/${pkgname}-${pkgver}
	make
}

package()
{
	cd ${srcdir}/${pkgname}-${pkgver}
	make DESTDIR="$pkgdir/" install
}
