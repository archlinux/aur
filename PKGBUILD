# Maintainer: AntiApple4life <antiapple at antiapple.net>
_pkgname=spout2pw
pkgname=${_pkgname}-bin
pkgver=0.4.5
pkgrel=1
arch=('x86_64')
pkgdesc="Spout2 to PipeWire bridge"
url="https://github.com/tasokait/spout2pw"
license=('LGPL-2.1-only')
depends=()
makedepends=()
optdepends=('obs-pwvideo: For use with OBS')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
options=(!strip)
install=instructions.install
source=("${url}/releases/download/v${pkgver}/${pkgname}-${pkgver}.tar.gz")
sha256sums=('362d6654f50303296eea2846fcca7bac31bdf2078c20138c8a9592b965f794aa')

package() {
	mkdir -p $pkgdir/opt/${_pkgname}
	cp -r spout2pw.sh $pkgdir/opt/${_pkgname}
	cp -r spout2pw.inf $pkgdir/opt/${_pkgname}
	cp -r spout2pw-dlls $pkgdir/opt/${_pkgname}
}
