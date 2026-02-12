# Maintainer: AntiApple4life <antiapple at antiapple.net>
_pkgname=spout2pw
pkgname=${_pkgname}-bin
pkgver=0.1.6
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
sha256sums=('4503a093cc6f96431f8ba8568027057f889b4aed79453e7f25800b1987f24e0d')

package() {
	mkdir -p $pkgdir/opt/${_pkgname}
	cp -r $_pkgname-$pkgver/* $pkgdir/opt/${_pkgname}
}
