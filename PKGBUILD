
#Maintainer: Toni Sagrista Selles <tsagrista@ari.uni-heidelberg.de>
pkgname=gaiasky
pkgver=2.2.4.276701f80
pkgrel=1
epoch=
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
source=("http://gaia.ari.uni-heidelberg.de/gaiasky/files/releases/$pkgver/$pkgname-$pkgver.tar.gz")
noextract=()
md5sums=("349e123763b0cabb8e90f1ce2e2c921e")
validpgpkeys=()

prepare() {
	cd "$pkgname-$pkgver"
}

build() {
:
}

check() {
:
}

package() {
	cd "$pkgname-$pkgver"
	mkdir -p "$pkgdir/opt/gaiasky/"
	mv * "$pkgdir/opt/gaiasky/"
}

