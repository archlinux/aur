# Maintainer: sandu <Halespider396>
pkgname=lazy-search
pkgver=1.0.0
pkgrel=1
pkgdesc="Fuzzy TUI search over official Arch repos and the AUR, part of the Lazy ecosystem"
arch=('x86_64')
url="https://github.com/Halespider396/lazy-search"
license=('MIT')
depends=('pacman' 'curl' 'tar' 'gzip')
makedepends=('gcc' 'make')
source=()
sha256sums=()

build() {
	cd "$startdir"
	make clean
	make
}

package() {
	install -Dm755 "$startdir/lazy-search" "$pkgdir/usr/bin/lazy-search"
}
