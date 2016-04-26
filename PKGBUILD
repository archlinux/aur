
#Maintainer: Toni Sagrista Selles <tsagrista@ari.uni-heidelberg.de>
pkgname=gaiasky
pkgver=0.707b.32738c6
pkgrel=1
epoch=
pkgdesc="Interactive 3D Universe software focused on ESA's Gaia mission"
arch=(x86_64)
url="https://zah.uni-heidelberg.de/gaia/outreach/gaiasandbox"
license=('LGPL3')
groups=()
depends=('jre8-openjdk')
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
source=("http://wwwstaff.ari.uni-heidelberg.de/gaiasandbox/$pkgver/$pkgname-$pkgver.tar.gz")
noextract=()
md5sums=("5497a1a1390b7ff8620a5d84ec81c43c")
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
	rm gaiasky.bat
	mkdir -p "$pkgdir/opt/gaiasky/"
	mv * "$pkgdir/opt/gaiasky/"
}

