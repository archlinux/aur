# Maintainer: torvic9 <torvic9 AT mailbox DOT org>
# gmpbench v0.2 from gmplib.org

pkgname=gmpbench
pkgver=0.2
pkgrel=2
pkgdesc="gmpbench v0.2 from gmplib.org"
url="https://gmplib.org/gmpbench"
arch=('i686' 'x86_64')
license=('GPL')
depends=('gmp')
makedepends=('make' 'gcc' 'git' 'gmp')
source=("git+https://gitlab.com/torvic9/gmpbench.git")
md5sums=('SKIP')

build() {
	cd $pkgname
	make V=1
}

package() {
	cd $pkgname
	make DESTDIR="$pkgdir/usr" install
}
