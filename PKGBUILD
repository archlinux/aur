# Maintainer: bhmsgame06 <bhmsgamexbox2010@gmail.com>

pkgname='sfiler'
pkgdesc='File transfer: PC <-> Samsung Swift device.'
pkgver=1.0
pkgrel=1

arch=('any')
url='https://github.com/bhmsgame06/sfiler'
license=('GPL-3.0-or-later')
source=("git+$url")
sha256sums=('SKIP')

depends=()
makedepends=('git')

build() {
	cd "sfiler"
	make
}

package() {
	cd "sfiler"
	mkdir -p "$pkgdir/usr/bin"
	make install PREFIX="$pkgdir/usr"
}
