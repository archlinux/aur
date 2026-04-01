# Maintainer: bhmsgame06 <bhmsgamexbox2010@gmail.com>

pkgname='imaster-image-tool'
pkgdesc='A tool for bidirectional file conversion between PNG (.png) and IM (.ifg) formats.'
pkgver=1.0
pkgrel=1

arch=('any')
url='https://github.com/bhmsgame06/Imaster-image-tool'
license=('GPL-3.0-or-later')
source=("git+$url")
sha256sums=('SKIP')

depends=('libpng')
makedepends=('git')

build() {
	cd "Imaster-image-tool"
	make
}

package() {
	cd "Imaster-image-tool"
	mkdir -p "$pkgdir/usr/bin"
	make install PREFIX="$pkgdir/usr"
}
