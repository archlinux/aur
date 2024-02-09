# Maintainer: Arne Brücher <archlinux [at] arne-bruecher [dot] de>

pkgname=game-rs-bin
_realname=game-rs
pkgver=0.2.0
pkgrel=1
pkgdesc="A minimal (CLI) game launcher for Linux written in rust."
arch=("any")
url="https://github.com/amanse/game-rs"
license=("GPL")
provides=("game-rs")
conflicts=("game-rs")
source=(https://github.com/Amanse/game-rs/releases/download/v$pkgver/game-rs)

sha256sums=('1149a1dcc7f4b02b594c929fc0b7f2ae8fec6ba4ec4909ea6eb2eb435fd8f764')

package() {
	install -D game-rs "$pkgdir"/usr/bin/game-rs
}
