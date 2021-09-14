pkgname="spwn-bin"
_pkgname="spwn"
pkgver=0.7
pkgrel=1
pkgdesc="A language for Geometry Dash triggers."
arch=('x86_64')
url="https://www.github.com/Spu7Nix/SPWN-language"
license=('MIT')
provides=('spwn')
conflicts=('spwn')
source=('https://github.com/Deltara3/spwn-bin-aur/releases/download/v0.7/spwn-bin.tar.gz')
sha256sums=('5c56458474f86af6e513877f54ae84cab350cc97540bbf3995305c1bc1108757')
install=spwn-bin.install

package() {
	install -Dm755 spwn ${pkgdir}/usr/bin/spwn-bin/spwn
	cp -r libraries/ ${pkgdir}/usr/bin/spwn-bin/libraries/
	chmod -R 755 ${pkgdir}/usr/bin/spwn-bin/libraries/
}
