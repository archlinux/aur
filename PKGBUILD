#Maintainer: Toni Sagrista Selles <tsagrista@ari.uni-heidelberg.de>
pkgname=gaiasky
pkgver=3.5.5_1.53d6a4f97
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
md5sums=("8ba9103945b8a939315d0df33a9d689a")
sha256sums=("1eced6daa9a8121bca888772b577d259590a67da7f4b7efa88c1157c637a0ffb")
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

