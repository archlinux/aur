# Maintainer: Zurg Egg (k1hn3trj7@mozmail.com)
pkgname=convolv2
pkgver=0.7.2
pkgrel=1
epoch=
pkgdesc="LV2 convolution plugin"
arch=('x86_64')
url="https://github.com/x42/convoLV2"
license=('GPL2')
groups=()
depends=('zita-convolver')
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
source=("https://github.com/x42/convoLV2/archive/refs/tags/v$pkgver.tar.gz")
noextract=()
sha256sums=('cdd020e284a2fc39777bfcddad67845e23d82eb25170f6e0670a49d5833d1cba')
validpgpkeys=()

build() {
	cd "convoLV2-$pkgver"
	make
}

package() {
	cd "convoLV2-$pkgver"
	make install PREFIX="$pkgdir/usr"
}
