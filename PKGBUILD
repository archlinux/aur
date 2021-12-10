# Maintainer: Vladimir Luzan <vluzan@disroot.org>
# Contributor: Vladimir Luzan <vluzan@disroot.org>
pkgname=hru
pkgver="1.0"
pkgrel=0
pkgdesc="Filter that translates latin or cyrillic text into grunt"
arch=('i686' 'pentium4' 'x86_64' 'arm' 'armv7h' 'armv6h' 'aarch64')
url="https://git.sr.ht/~begs/hru"
license=('WTFPL')
depends=(
	'libutf8proc'
	'scdoc'
)
makedepends=(
	'git'
	'scdoc'
)
source=("hru::git+https://git.sr.ht/~begs/hru")
sha512sums=("SKIP")
build() {
	cd "$srcdir/$pkgname-$pkgver"
	make build
}

package() {
	cd "$srcdir/$pkgname-$pkgver"
	make install
}
