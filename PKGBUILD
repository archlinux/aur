#Maintainer: Toni Sagrista Selles <tsagrista@ari.uni-heidelberg.de>
pkgname=gaiasky
pkgver=3.5.6
pkgrel=2
epoch=3
versionstr=3.5.6-2.b9300ce43
pkgdesc="Open source 3D universe simulator for desktop and VR with support for more than a billion objects"
arch=(x86_64)
url="https://zah.uni-heidelberg.de/gaia/outreach/gaiasky"
license=('MPL')
groups=()
depends=('java-runtime' 'xorg-xrandr')
makedepends=()
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=gaiasky.install
changelog=releasenotes.txt
source=("http://gaia.ari.uni-heidelberg.de/gaiasky/files/releases/${versionstr//_/-}/$pkgname-${versionstr//_/-}.tar.gz")
noextract=()
md5sums=("be18d2605285e1648ce53921a6d2bd62")
sha256sums=("423402b08209fad4c0d61c739e4fd048adcf2b0315ec6856dc99419adc028678")
validpgpkeys=()

prepare() {
	cd "$pkgname-${versionstr//_/-}"
}

build() {
:
}

check() {
:
}

package() {
	cd "$pkgname-${versionstr//_/-}"
	mkdir -p "$pkgdir/opt/gaiasky/"
	mv * "$pkgdir/opt/gaiasky/"
}

