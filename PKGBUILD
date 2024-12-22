
# Maintainer: Rafael Senties Martinelli <rafael AT senties-martinelli DOT com>

_pkgname=phantom-player
pkgname=${_pkgname}-git
pkgver=2.0.r3.g0f106d3
pkgrel=1
epoch=
pkgdesc="Smart video player and playlist manager"
arch=("any")
url="https://www.phantom-player.com/"
license=('GPLv3')
groups=()
depends=("gtk3" "python" "python-cairo" "python-pillow" "python-magic" "python-vlc")
makedepends=("git")
checkdepends=()
optdepends=()
provides=("phantom-player")
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("git+https://github.com/rsm-gh/phantom-player.git")
noextract=()
sha256sums=("SKIP")
validpgpkeys=()

pkgver() {
    cd ${_pkgname}
    git describe --long --tags --abbrev=7 | sed 's/^d//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
	cd "${_pkgname}"
	cp -r ./usr "$pkgdir" 
}
