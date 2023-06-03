# Manitainer: grgergo <csakbek@freemail.hu>

pkgname='purple-instagram'
pkgver=1.0.0
pkgrel=2
pkgdesc='Instagram plugin for libpurple'
arch=('x86_64')
url='https://github.com/doopage/purple-instagram'
license=('GPL3')
depends=('libpurple' 'glib2' 'json-glib')

source=('git+https://github.com/doopage/purple-instagram')
sha256sums=('SKIP')

build() {
	cd "$pkgname"
	make
}

package() {
	cd "$pkgname"
	make DESTDIR="$pkgdir/" install
}
