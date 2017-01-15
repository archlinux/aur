# Maintainer: Josh Mandle <difarem@gmail.com>
pkgname=lmms-orgmaker-samples
pkgver=0925
pkgrel=2
pkgdesc="The set of samples used in Cave Story and other Pixel games."
arch=(any)
url="http://studiopixel.sakura.ne.jp/pxtone/index.html"
license=('BSD')
depends=(lmms)
makedepends=()
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=(http://studiopixel.sakura.ne.jp/binaries/pxtone_$pkgver.zip)
noextract=()
md5sums=('caa267b0255e2c10f62dbea236c317f3')
validpgpkeys=()

package() {
	install -Dm644 -t "$pkgdir/usr/share/lmms/samples/drumsynth/orgmaker" pxtone/my_material/Organya22KHz8bit/ORG_D*.wav
	install -Dm644 -t "$pkgdir/usr/share/lmms/samples/waveforms/orgmaker" pxtone/my_material/Organya22KHz8bit/ORG_M*.wav
}
