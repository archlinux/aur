# Maintainer: Haris Gušić <harisgusic dot dev at gmail dot com>
pkgname=tuterm
pkgver=0.2.0
pkgrel=1
pkgdesc="A framework for real-time tutorials and demonstrations of CLI programs"
arch=('x86_64')
url="https://github.com/HarisGusic/tuterm"
license=('MIT')
depends=('readline')
makedepends=('git')
optdepends=('asciinema')
source=("git+https://github.com/HarisGusic/tuterm#tag=v$pkgver")
noextract=()
md5sums=('SKIP')
validpgpkeys=()

package() {
	cd "$srcdir/$pkgname"
	make install PREFIX=/usr DESTDIR="$pkgdir"
}
