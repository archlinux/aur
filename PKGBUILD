# Maintainer: Arne Brücher <archlinux@arne-bruecher.de>

pkgname=game-rs-bin
_realname=game-rs
pkgver=0.1.2
pkgrel=1
pkgdesc="A minimal (CLI) game launcher for Linux written in rust."
arch=("any")
url="https://github.com/amanse/game-rs"
license=("GPL")
provides=("game-rs")
conflicts=("game-rs")
source=(https://github.com/Amanse/game-rs/releases/download/v$pkgver/game-rs)
sha256sums=('574fd23b72431c4dfb62af14b8f83a1f07763042c48d9bbc07d18c129a9d3c2e')


package() {
	install -D game-rs "$pkgdir"/usr/bin/game-rs
}
