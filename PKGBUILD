# Maintainer: AntiApple4life <antiapple at antiapple.net>
_pkgname=spout2pw
pkgname=${_pkgname}-bin
pkgver=0.3.0
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
source=("${url}/releases/download/${pkgver}/${pkgname}-${pkgver}.tar.gz")
sha256sums=('0e9bb53daa9f4913e9e4e761b94bce71cceb8055580a4eb00a680fb69b015bb3')

package() {
	mkdir -p $pkgdir/opt/${_pkgname}
	cp -r spout2pw.sh $pkgdir/opt/${_pkgname}
	cp -r spout2pw.inf $pkgdir/opt/${_pkgname}
	cp -r spout2pw-dlls $pkgdir/opt/${_pkgname}
}
