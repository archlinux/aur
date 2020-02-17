# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# Maintainer:Gavin Inglis <ginglis05 at gmail dot com>
pkgname=chad_stride
pkgver=0.69420
pkgrel=2
pkgdesc="A small curses program to stride across your terminal"
arch=("x86_64")
url="https://github.com/sambattalio/chad_stride"
license=('GPL3')
depends=("glibc")
makedepends=("glibc")
provides=("chad_stride")
source=("https://github.com/sambattalio/chad_stride/archive/0.69420.tar.gz")
md5sums=('4da1ab58ddacde55f372cccf96d57a3c')



build() {
	cd "$pkgname-$pkgver"
	make
}

package() {
	cd "$pkgname-$pkgver"
	make PREFIX="$pkgdir/usr" install
}
