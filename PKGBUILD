# Maintainer: A. Husen <hi@husen.id>
pkgname=ncspot-bin
_pkgname=ncspot
pkgver=0.9.4
pkgrel=1
pkgdesc="Cross-platform ncurses Spotify client written in Rust, inspired by ncmpc and the likes."
arch=('x86_64')
url="https://github.com/hrkfdn/ncspot"
license=('BSD')
provides=('ncspot')
conflicts=('ncspot')
source=("https://github.com/hapakaien/aur-packages/releases/download/ncspot%40v${pkgver}/ncspot-v${pkgver}-linux-x86_64.tar.gz")
sha512sums=('09cdb98c47324c0634ecaa767ff23ce4a04c8f746ebb7c583086b5e44c28b187f8531d00c8f70eb488d1704b9691787283fca4bd569ba1374736b057257d5d82')

package() {
	cd "$srcdir"

    install -Dm755 $_pkgname		"${pkgdir}/usr/bin/${_pkgname}"
}
