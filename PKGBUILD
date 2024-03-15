#Maintainer: Toni Sagrista Selles <tsagrista@ari.uni-heidelberg.de>
pkgname=gaiasky
pkgver=3.6.0
pkgrel=3
epoch=3
versionstr=3.6.0-3.fb7b7a553
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
md5sums=("e83a156d27a98b551c4d6470e0c326ca")
sha256sums=("da4286750cf8d01faa7e66a8dff3cfca6e81c9ae008605ee531e292a25e106b3")
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

