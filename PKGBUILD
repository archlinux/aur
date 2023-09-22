#Maintainer: Toni Sagrista Selles <tsagrista@ari.uni-heidelberg.de>
pkgname=gaiasky
pkgver=3.5.4_1.c31b73416
pkgrel=1
epoch=3
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
source=("http://gaia.ari.uni-heidelberg.de/gaiasky/files/releases/${pkgver//_/-}/$pkgname-${pkgver//_/-}.tar.gz")
noextract=()
md5sums=("2a85ef034d4adf451929a8843fbf5320")
sha256sums=("2f803a1c9c6bf9215846d0bdca7ab756cb8aa2a913fc80e47f0455685df58f3e")
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

