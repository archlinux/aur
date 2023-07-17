#Maintainer: Toni Sagrista Selles <tsagrista@ari.uni-heidelberg.de>
pkgname=gaiasky
pkgver=3.5.0.5b427a04f
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
md5sums=("f41bba6c84d94cace6a20ef6ddf0cf04")
sha256sums=("c4500234501c965c047e62720ee0156d2b9c1b9c6c69f828de992c3aef254f16")
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

