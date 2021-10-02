# Maintainer: A. Husen <hi@husen.id>
pkgname=ncspot-bin
_pkgname=ncspot
pkgver=0.8.2
pkgrel=1
pkgdesc="Cross-platform ncurses Spotify client written in Rust, inspired by ncmpc and the likes."
arch=('x86_64')
url="https://github.com/hrkfdn/ncspot"
license=('BSD')
provides=('ncspot')
conflicts=('ncspot')
source=("https://github.com/datakrama/ncspot-bin/releases/download/v${pkgver}/ncspot-v${pkgver}-linux-x86_64.tar.gz")
sha512sums=('afdfbceaff11a9aa40464117c494c0b5960e3d775610c19ce81f58d2d550c08b128c8b2a9642067c8b1fcd8687a7328383b341d865645c9b8e42156c437af7e7')

package() {
	cd "$srcdir"

    install -Dm755 $_pkgname		"${pkgdir}/usr/bin/${_pkgname}"
}
