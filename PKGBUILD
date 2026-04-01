# Maintainer: bhmsgame06 <bhmsgamexbox2010@gmail.com>

pkgname='asc'
pkgdesc='Make a single shell script from images.'
pkgver=1.1
pkgrel=1

arch=('any')
url='https://github.com/bhmsgame06/asc'
license=('GPL-3.0-or-later')
source=("git+$url")
sha256sums=('SKIP')

depends=('libpng')
makedepends=('git')

build() {
	cd "asc"
	pwd
	make
}

package() {
	cd "asc"
	pwd
	mkdir -p "$pkgdir/usr/bin"
	make install PREFIX="$pkgdir/usr"
}
