# Maintainer: bhmsgame06 <bhmsgamexbox2010@gmail.com>

pkgname='quram-qtc-tool'
pkgdesc='A tool for bidirectional file conversion between raw data and .qtc format.'
pkgver=1.0
pkgrel=1

arch=('any')
url='https://github.com/bhmsgame06/quram-qtc-tool'
license=('GPL-3.0-or-later')
source=("git+$url")
sha256sums=('SKIP')

depends=()
makedepends=('git')

build() {
	cd "quram-qtc-tool"
	make
}

package() {
	cd "quram-qtc-tool"
	mkdir -p "$pkgdir/usr/bin"
	make install PREFIX="$pkgdir/usr"
}
