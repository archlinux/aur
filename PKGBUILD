# Maintainer: bhmsgame06 <bhmsgamexbox2010@gmail.com>

pkgname='ramdump-49xx'
pkgdesc='A tool for dumping RAM from Samsung Swift devices running on the PNX49xx chipset.'
pkgver=1.0
pkgrel=1

arch=('any')
url='https://github.com/bhmsgame06/ramdump-49xx'
license=('GPL-3.0-or-later')
source=("git+$url")
sha256sums=('SKIP')

depends=()
makedepends=('git')

build() {
	cd "ramdump-49xx"
	make
}

package() {
	cd "ramdump-49xx"
	mkdir -p "$pkgdir/usr/bin"
	make install PREFIX="$pkgdir/usr"
}
