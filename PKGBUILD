# Manitainer: grgergo <csakbek@freemail.hu>

pkgname='purple-instagram'
pkgver=master
pkgrel=1
epoch=1
pkgdesc='Instagram plugin for libpurple'
arch=('x86_64')
url='https://codeberg.org/grgergo/purple-instagram'
license=('GPL3')
depends=('libpurple' 'glib2' 'json-glib')

source=('git+https://codeberg.org/grgergo/purple-instagram')
sha256sums=('SKIP')

build() {
	cd "$pkgname"
	make
}

package() {
	cd "$pkgname"
	make DESTDIR="$pkgdir/" install
}
