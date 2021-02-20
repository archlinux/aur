# Maintainer: Jiri Popek <jiri.popek@gmail.com>

pkgname=bbfpromix
pkgver=b371896d9a66bbb45f88b2b67bd7b46b39c9be03
pkgrel=1
epoch=
pkgdesc="ALSA Mixer Frontend for RME Babyface Pro (FS)"
arch=('any')
url="https://github.com/MrBollie/bbfpromix"
license=('unknown')
groups=()
depends=()
makedepends=('pkg-config')
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=(!buildflags)
install=
changelog=
source=("https://github.com/MrBollie/bbfpromix/archive/$pkgver.zip")
noextract=()
sha256sums=("469e930ecba346523a0da50fabfdb54813dbe5a3090003e5002cee18c1fca521")
validpgpkeys=()

prepare() {
	cd "$pkgname-$pkgver"
}

build() {
	cd "$pkgname-$pkgver"
	make
}

package() {
	cd "$pkgname-$pkgver"
	make DESTDIR="$pkgdir/" PREFIX="/usr" install
}
