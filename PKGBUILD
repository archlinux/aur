#Maintainer: Toni Sagrista Selles <tsagrista@ari.uni-heidelberg.de>
pkgname=gaiasky
pkgver=3.5.1.ebd5983f4
pkgrel=1
epoch=2
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
md5sums=("5f06a63a48ca404bcb934b68da11b78c")
sha256sums=("3c03830e79c48b1c30f3e49da0c8dde4aa5f74eacc5c0aeec4d29b8f0661a4d7")
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

