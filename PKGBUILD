# Maintainer: AntiApple4life <antiapple at antiapple.net>
_pkgname=spout2pw
pkgname=${_pkgname}-bin
pkgver=0.2.2
pkgrel=1
arch=('x86_64')
pkgdesc="Spout2 to PipeWire bridge"
url="https://github.com/hoshinolina/spout2pw"
license=('LGPL-2.1-only')
depends=()
makedepends=()
optdepends=('obs-pwvideo: For use with OBS')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
options=(!strip)
install=instructions.install
source=("https://github.com/hoshinolina/spout2pw/releases/download/${pkgver}/spout2pw-${pkgver}-bin.tar.gz")
sha256sums=('b2c9716551a493f03c826fd01d124a95cb991f540c756d733fec191128663fe7')

package() {
	mkdir -p $pkgdir/opt/${_pkgname}
	cp -r $_pkgname-$pkgver/* $pkgdir/opt/${_pkgname}
}
