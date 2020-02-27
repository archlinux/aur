# Maintainer: Donald Thackeray <donaldthackeray at gmail dot com>

pkgname=cfm
pkgver=0.6.0
pkgrel=1
pkgdesc="TUI file manager with the goal of being simple, easy, and bloat-free, utilizing Vi-inspired keybinds."
arch=('any')
url="https://github.com/WillEccles/cfm"
license=('MPL2')
depends=('glibc')
makedepends=()
source=("https://github.com/WillEccles/cfm/archive/v$pkgver.tar.gz")
md5sums=('SKIP')

build() {
	cd "$pkgname-$pkgver"
	make
}

package() {
	cd "$pkgname-$pkgver"
	make DESTDIR="$pkgdir" install PREFIX=/usr
}
