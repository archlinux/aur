# Maintainer: Frederic Bezies <fredbezies at gmail dot com>
# Contributor: Donald Thackeray <donaldthackeray at gmail dot com>

pkgname=cfm
pkgver=0.6.6
pkgrel=1
pkgdesc="TUI file manager with the goal of being simple, easy, and bloat-free, utilizing Vi-inspired keybinds."
arch=('x86_64')
url="https://github.com/WillEccles/cfm"
license=('MPL2')
depends=('glibc')
makedepends=()
source=("https://github.com/WillEccles/cfm/archive/v$pkgver.tar.gz")

build() {
	cd "$pkgname-$pkgver"
	make
}

package() {
	cd "$pkgname-$pkgver"
	make DESTDIR="$pkgdir" install PREFIX=/usr
}
sha256sums=('7977431d8074d3a2f0dad4e431e558201073631fa5f0e7d92b37b100feae6ed3')
