# Maintainer: AntiApple4life <antiapple at antiapple.net>
_pkgname=spout2pw
pkgname=${_pkgname}-bin
pkgver=0.1.4
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
sha256sums=('3f9b9806174abec0a8cc70eb372f170a2623c92118c4207507244e6fefe1f9bd')

package() {
	mkdir -p $pkgdir/opt/${_pkgname}
	cp -r $_pkgname-$pkgver/* $pkgdir/opt/${_pkgname}
}
