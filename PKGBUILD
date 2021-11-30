# Maintainer: A. Husen <hi@husen.id>
pkgname=ncspot-bin
_pkgname=ncspot
pkgver=0.9.1
pkgrel=1
pkgdesc="Cross-platform ncurses Spotify client written in Rust, inspired by ncmpc and the likes."
arch=('x86_64')
url="https://github.com/hrkfdn/ncspot"
license=('BSD')
provides=('ncspot')
conflicts=('ncspot')
source=("https://github.com/hapakaien/aur-packages/releases/download/ncspot%40v${pkgver}/ncspot-v${pkgver}-linux-x86_64.tar.gz")
sha512sums=('0bb9fc2c464d0839e09c28c0a324fabbe1e6479438dd703bb2f01fb033336cee438f1a823c26cca0a899d48b10c0dd50548165d44e6df431c40fbdd5d535d1b0')

package() {
	cd "$srcdir"

    install -Dm755 $_pkgname		"${pkgdir}/usr/bin/${_pkgname}"
}
