# Maintainer: A. Husen <hi@husen.id>
pkgname=ncspot-bin
_pkgname=ncspot
pkgver=0.9.3
pkgrel=1
pkgdesc="Cross-platform ncurses Spotify client written in Rust, inspired by ncmpc and the likes."
arch=('x86_64')
url="https://github.com/hrkfdn/ncspot"
license=('BSD')
provides=('ncspot')
conflicts=('ncspot')
source=("https://github.com/hapakaien/aur-packages/releases/download/ncspot%40v${pkgver}/ncspot-v${pkgver}-linux-x86_64.tar.gz")
sha512sums=('aaa1fa9084976f3bfa1c17a956694a7c4a742ee40b94efe0373ea2a6bfaff5e3bbccc4f49e9e1040e11a6c5db0b05e4077d79d894b42f7abf097919fb8770e20')

package() {
	cd "$srcdir"

    install -Dm755 $_pkgname		"${pkgdir}/usr/bin/${_pkgname}"
}
