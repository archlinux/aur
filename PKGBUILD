# Maintainer: piratecarrot <39475419+piratecarrot@users.noreply.github.com>
pkgname=gama
pkgver=2.23
pkgrel=1
pkgdesc="GNU Gama package is dedicated to the adjustment of surveying networks."
arch=('i686' 'x86_64')
url="https://www.gnu.org/software/gama/"
license=('GPL')
groups=('')
#depends=('suitesparse')
makedepends=('make' 'gcc')
optdepends=('')
source=("https://ftpmirror.gnu.org/${pkgname}/${pkgname}-${pkgver}.tar.gz")
sha256sums=('38a5408261dd850a12de40b072513d96338ddc7d8d5420afa51da18307ea9c0d')
sha512sums=('bcdd98253b814f7b631ddcce5a3ca11d648f71e683a1a21bedaf117b1aab732544ed4880cd79396d53f13a3d321b678e0ab1a233b7871a2d54d051e38b9a7744')
b2sums=('22ec305c26bc3f2c94618973c7b785dca3cd2bd7348a9d7ba056a53f50b93025c4109d5189574f006c11ad14281eb074ebe2dc087a6d6fa650ed588b8b221262')

build() {
	cd "$srcdir/${pkgname}-${pkgver}"
	./configure --prefix=$pkgdir/usr
	make
}

package() {
	cd "$srcdir/${pkgname}-${pkgver}"
	make install
}
