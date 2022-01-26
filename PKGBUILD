pkgname="spwn-bin"
_pkgname="spwn"
pkgver=0.8
pkgrel=1
pkgdesc="A language for Geometry Dash triggers."
arch=('x86_64')
url="https://www.github.com/Spu7Nix/SPWN-language"
license=('MIT')
provides=('spwn')
conflicts=('spwn')
source=('https://github.com/Deltara3/spwn-bin-aur/releases/download/v0.8/spwn-bin.tar.gz')
sha256sums=('0c2abec613eab5da6f56b77897d4dc31be6b057fad8c3f4c1d52f22add549973')
install=spwn-bin.install

package() {
	install -Dm755 spwn ${pkgdir}/usr/bin/spwn-bin/spwn
	cp -r libraries/ ${pkgdir}/usr/bin/spwn-bin/libraries/
	chmod -R 755 ${pkgdir}/usr/bin/spwn-bin/libraries/
}
