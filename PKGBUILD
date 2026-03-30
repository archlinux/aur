# Maintainer: bhmsgame06 <bhmsgamexbox2010@gmail.com>

pkgname='ramdump-49xx'
pkgver=1.0
pkgrel=1

arch=('any')
url='https://github.com/bhmsgame06/ramdump-49xx'
license=('GPL-3.0-or-later')

depends=()
makedepends=('git')

prepare() {
	git clone "$url" "$srcdir"
}

build() {
	make -C "$srcdir"
}

package() {
	install -Dm755 "$srcdir/bin/ramdump-49xx" "$pkgdir/usr/bin/ramdump-49xx"
}
