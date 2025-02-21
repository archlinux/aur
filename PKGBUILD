
# Maintainer: Rafael Senties Martinelli <rafael AT senties-martinelli DOT com>

pkgver=2.0.r62.g4a4195c # git describe --long --tags --abbrev=7 | sed 's/^d//;s/\([^-]*-g\)/r\1/;s/-/./g'
_commit=4a4195c093ec5396e9d11997e9e3009acaa3ce7d
_commit_sha256=ac5f7c4f4f1d999bcedd17b09726c3598713928c153d1290e624287b590285a8

# Static content

pkgname=phantom-player-git
pkgrel=1
epoch=
pkgdesc="Smart video player and playlist manager"
arch=("any")
url="https://www.phantom-player.com"
license=('GPLv3')
groups=()
depends=("gtk3" "python" "python-cairo" "python-pillow" "python-magic" "python-send2trash" "python-vlc")
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
source=("https://github.com/rsm-gh/phantom-player/archive/${_commit}.zip")
noextract=()
sha256sums=("${_commit_sha256}")
validpgpkeys=()

package() {
	cd "phantom-player-${_commit}"
	ls -la
	cp -r ./usr "$pkgdir" 
}
