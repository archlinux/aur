# Maintainer: A. Husen <hi@husen.id>
pkgname=ncspot-bin
_pkgname=ncspot
pkgver=0.9.0
pkgrel=1
pkgdesc="Cross-platform ncurses Spotify client written in Rust, inspired by ncmpc and the likes."
arch=('x86_64')
url="https://github.com/hrkfdn/ncspot"
license=('BSD')
provides=('ncspot')
conflicts=('ncspot')
source=("https://github.com/datakrama/ncspot-bin/releases/download/v${pkgver}/ncspot-v${pkgver}-linux-x86_64.tar.gz")
sha512sums=('9e827bd2da29bf045de50fb3344e15880a4227f1e53fe1aa94c94a9194be0c4dca2d228d80fea1bf6a537acca8e4703f775c5b7121a9b12fd79f38fc2054fbc8')

package() {
	cd "$srcdir"

    install -Dm755 $_pkgname		"${pkgdir}/usr/bin/${_pkgname}"
}
