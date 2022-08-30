# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Philip Goto <philip.goto@gmail.com>

pkgname=pstack
pkgver=1.3.1
pkgrel=2
pkgdesc='Print stack trace of running processes'
arch=('x86_64' 'i686' 'aarch64' 'armv7h')
url='https://code.lm7.fr/robotux/pstack'
license=('GPL2')
depends=('glibc')
changelog=changelog
source=("$pkgname-$pkgver.tar.gz::$url/archive/150a89bb40.tar.gz")
sha256sums=('6f0978d40b131f765ac56fe58c9bf91e73d2d15b89b6fabb458a247c2c3ee423')

build() {
	cd "$pkgname"
	make pstack
}

package() {
	cd "$pkgname"
	make DESTDIR="$pkgdir" install
}
