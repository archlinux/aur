# Maintainer: Donald Thackeray <donaldthackeray at gmail dot com>

pkgname=cfm
pkgver=0.4.4
pkgrel=1
pkgdesc="TUI file manager with some features here and there. It's quick and light with VIM-like bindings."
arch=('any')
url="https://github.com/WillEccles/cfm"
license=('MPL2')
depends=('glibc')
makedepends=('git')
source=("https://github.com/WillEccles/cfm/archive/v0.4.4.tar.gz")
md5sums=('SKIP')

build() {
	cd "$pkgname-$pkgver"
	make
}

package() {
	cd "$pkgname-$pkgver"
	make DESTDIR="$pkgdir" install PREFIX=/usr
}
