
#Maintainer: Toni Sagrista Selles <tsagrista@ari.uni-heidelberg.de>
pkgname=gaiasky
pkgver=1.0.3.f7b8f51
pkgrel=1
epoch=
pkgdesc="Interactive 3D Universe software focused on ESA's Gaia mission"
arch=(x86_64)
url="https://zah.uni-heidelberg.de/gaia/outreach/gaiasky"
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
md5sums=("03db518a0b1c04ae0b186e2a38f87cb9")
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

