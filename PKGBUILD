# Maintainer: Arne Brücher <archlinux [at] arne-bruecher [dot] de>

pkgname=game-rs-bin
_realname=game-rs
pkgver=0.1.3
pkgrel=1
pkgdesc="A minimal (CLI) game launcher for Linux written in rust."
arch=("any")
url="https://github.com/amanse/game-rs"
license=("GPL")
provides=("game-rs")
conflicts=("game-rs")
source=(https://github.com/Amanse/game-rs/releases/download/v$pkgver/game-rs)

sha256sums=('c6fe961aa5241c5952a9ceb6c0f05ee6149b6869b6fed56bcb0bb6bb5b499dbd')

package() {
	install -D game-rs "$pkgdir"/usr/bin/game-rs
}
