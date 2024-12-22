
# Maintainer: Rafael Senties Martinelli <rafael AT senties-martinelli DOT com>

_pkgname=phantom-player
pkgname=${_pkgname}-git
pkgver=2.0.241222.0b9e4be
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
    echo "2.0."$(git --no-pager log -1 --pretty='format:%cd' --date='format:%y%m%d').$(git rev-parse --short HEAD)
}

package() {
	cd "${_pkgname}"
	cp -r ./usr "$pkgdir" 
}
