# Maintainer: A. Husen <hi@husen.id>
pkgname=ncspot-bin
_pkgname=ncspot
pkgver=0.8.1
pkgrel=1
pkgdesc="Cross-platform ncurses Spotify client written in Rust, inspired by ncmpc and the likes."
arch=('x86_64')
url="https://github.com/hrkfdn/ncspot"
license=('BSD')
provides=('ncspot')
conflicts=('ncspot')
source=("https://github.com/datakrama/ncspot-bin/releases/download/v${pkgver}/ncspot-v${pkgver}-linux-x86_64.tar.gz")
sha512sums=('5f80188268030cc25e6680bd4db4f905013c991df60f7db981f9cb63393e9dde53074e917530e6661bc2fc34af341b3c296d830d9a78f8321ec70a71c38b0901')

package() {
	cd "$srcdir"

    install -Dm755 $_pkgname		"${pkgdir}/usr/bin/${_pkgname}"
}
