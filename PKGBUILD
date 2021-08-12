pkgname="spwn-bin"
_pkgname="spwn"
pkgver=0.6
pkgrel=1
pkgdesc="A language for Geometry Dash triggers."
arch=('x86_64')
url="https://www.github.com/Spu7Nix/SPWN-language"
license=('MIT')
provides=('spwn')
conflicts=('spwn')
source=('https://github.com/Deltara3/spwn-bin-aur/releases/download/v0.6/spwn-bin.tar.gz')
sha256sums=('546f6d28812bb9da5ae3d1554a25dadd98926978c140c55e376bf15ff69c550d')
install=spwn-bin.install

package() {
	install -Dm755 spwn ${pkgdir}/usr/bin/spwn-bin/spwn
	cp -r libraries/ ${pkgdir}/usr/bin/spwn-bin/libraries/
	chmod -R 755 ${pkgdir}/usr/bin/spwn-bin/libraries/
}
