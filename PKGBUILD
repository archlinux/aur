#Maintainer: Toni Sagrista Selles <tsagrista@ari.uni-heidelberg.de>
pkgname=gaiasky
pkgver=3.6.4
pkgrel=1
epoch=3
versionstr=3.6.4.431291e37
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
md5sums=("60da4932a808ceb170ae6b56d533aba0")
sha256sums=("34d6f54d664c2ca2c8bf43836ef1368d7564bba1916d16369c55de6895931cf0")
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

