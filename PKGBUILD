# Maintainer: Arne Brücher <archlinux@arne-bruecher.de>

pkgname=game-rs-bin
_realname=game-rs
pkgver=0.1.1
pkgrel=1
pkgdesc="A minimal (CLI) game launcher for Linux written in rust."
arch=("any")
url="https://github.com/amanse/game-rs"
license=("GPL")
makedepends=(rust)
provides=("game-rs")
conflicts=("game-rs")
source=(https://github.com/Amanse/game-rs/releases/download/v$pkgver/game-rs)
sha256sums=('6d2e306c6ecd7a90836afac20ead8e6787696f55cf06d40c072cdacdf20288af')

package() {
	install -D $_realname	"$srcdir"/usr/bin/$_realname
}
