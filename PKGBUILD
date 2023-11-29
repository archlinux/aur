#Maintainer: Toni Sagrista Selles <tsagrista@ari.uni-heidelberg.de>
pkgname=gaiasky
pkgver=3.5.7
pkgrel=3
epoch=3
versionstr=3.5.7-3.8be0b0add
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
md5sums=("4d04dc90728f3bbc020d989213f7c123")
sha256sums=("5ffc2dfd3660ad77a8d3d10f8836e146cbf08bce4cdbc6612a8ee8870e6186e1")
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

