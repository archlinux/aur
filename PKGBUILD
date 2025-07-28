#Maintainer: Toni Sagrista Selles <tsagrista@ari.uni-heidelberg.de>
pkgname=gaiasky
pkgver=3.6.11
pkgrel=1
epoch=3
versionstr=3.6.11.e03d32c84
pkgdesc="Open source 3D universe simulator for desktop and VR with support for more than a billion objects"
arch=(x86_64)
url="https://gaiasky.space"
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
md5sums=("7c602a55e78e371705c1b2966c01b99e")
sha256sums=("980b8aec124561badb82fb596894123b0066c10bed0f07141085503be9d67226")
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

