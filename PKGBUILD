#Maintainer: Toni Sagrista Selles <tsagrista@ari.uni-heidelberg.de>
pkgname=gaiasky
pkgver=3.0.1.2318179ff
pkgrel=1
epoch=2
pkgdesc="Interactive 3D Universe software focused on ESA's Gaia mission"
arch=(x86_64)
url="https://zah.uni-heidelberg.de/gaia/outreach/gaiasky"
license=('MPL')
groups=()
depends=('jre11-openjdk' 'xorg-xrandr')
makedepends=()
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=gaiasky.install
changelog=CHANGELOG.md
source=("http://gaia.ari.uni-heidelberg.de/gaiasky/files/releases/${pkgver//_/-}/$pkgname-${pkgver//_/-}.tar.gz")
noextract=()
md5sums=("597ed10e7c2a25ab7eac7a133487233b")
sha256sums=("ace518854dfb1d811d78b78df631c7fe8b1a422bde7cf593df11b085651710b7")
validpgpkeys=()

prepare() {
	cd "$pkgname-${pkgver//_/-}"
}

build() {
:
}

check() {
:
}

package() {
	cd "$pkgname-${pkgver//_/-}"
	mkdir -p "$pkgdir/opt/gaiasky/"
	mv * "$pkgdir/opt/gaiasky/"
}

