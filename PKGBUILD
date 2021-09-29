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
source=("${url}/releases/download/v${pkgver}/ncspot-v${pkgver}-linux.tar.gz")
sha512sums=('af66fddf2e4e9a2d08f7609b843cefcd6672f73580a81397b2b1d0f1dfb21497b6a1801f68d3544bc48477076731c871a2402cea871522239d2bf9b194345079')

package() {
	cd "$srcdir"

    install -Dm755 $_pkgname		"${pkgdir}/usr/bin/${_pkgname}"
}
