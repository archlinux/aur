
#Maintainer: Toni Sagrista Selles <tsagrista@ari.uni-heidelberg.de>
pkgname=gaiasky
pkgver=2.2.1.0df6d0d6
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
md5sums=("01655b6273cb81b5c9e9c66476859c38")
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

